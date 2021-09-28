use strict;
use warnings FATAL => 'all';
use warnings;
use File::Spec;
use File::Basename;
use File::Path qw/make_path/;
use Data::Dumper;

use constant INPUT => 'python.tex';
use constant OUTPUT => 'code.png';
use constant PDFLATEX => '/home/denis/.texlive/bin/x86_64-linux/pdflatex';
use constant CONVERT => '/usr/bin/convert';
use constant MOGRIFY => '/usr/bin/mogrify';
my $__DIR__ = File::Spec->rel2abs(dirname(__FILE__));
my $PDF_OUT_DIR = "${__DIR__}/latex-out";
my $PDF_OUT_FILE =  File::Spec->catfile("${PDF_OUT_DIR}", sub { my $v = basename(&INPUT); $v =~ s/\.tex$/.pdf/i; $v }->());
make_path($PDF_OUT_DIR) unless (-d $PDF_OUT_DIR);

# Produce the PDF document.
my @command = (
    sprintf("%s", &PDFLATEX),
    '-file-line-error',
    '-interaction=nonstopmode',
    '-synctex=1',
    '-output-format=pdf',
    "-output-directory=${PDF_OUT_DIR}",
    sprintf("%s", &INPUT));
printf("Exec: %s\n", join(' ', @command));
system @command and do {
    warn sprintf("Failed to run:\n%s\n.Exit code is %d", join(' ', @command), $?);
    exit $? >> 8;
};

if (! -f $PDF_OUT_FILE) {
    warn sprintf("Failed to run:\n%s\nNo file '%s' generated", join(' ', @command), $PDF_OUT_FILE);
    exit $? >> 8;
}

# Convert the PDF into PNG.
# Warning: this operation may produce more that one PNG image.
#          It produces as many images as there are pages in the PDF document.
# Note: if you want to convert the background color from transparent to white, then add these options:
#       -background white -alpha remove
@command = (
    sprintf('%s', &CONVERT),
    '-background',
    'white',
     '-alpha',
    'remove',
    '-trim',
    '-density',
    300,
    $PDF_OUT_FILE,
    '-quality',
    90,
    "${__DIR__}/tmp.png");
printf("Exec: %s\n", join(' ', @command));
system @command and do {
    warn sprintf("Failed to run:\n%s\n.Exit code is %d", join(' ', @command), $?);
    exit $? >> 8;
};

# List images.
my %files = ();
opendir(D, $__DIR__) || die "Can't open directory: $!\n";
while (my $f = readdir(D)) {
    print "${f}\n";
    if ($f =~ m/^tmp\-(\d+)\.png/) {
        $files{$1} = $f;
    }
}
closedir(D);

my @sorted_keys = sort { $a cmp $b } keys(%files);

foreach my $key (@sorted_keys) {
    my $input = $files{$key};
    # Add the borders.
    # If you want to add transparent background borders, then replace:
    #     -bordercolor white
    # by:
    #     -bordercolor transparent
    my @command = (
        sprintf('%s', &MOGRIFY),
        '-border',
        20,
        '-bordercolor',
        'white',
        "${input}");
    printf("Exec: %s\n", join(' ', @command));
    system @command and do {
        warn sprintf("Failed to run:\n%s\n.Exit code is %d", join(' ', @command), $?);
        exit $? >> 8;
    };

    @command = (
        sprintf('%s', &MOGRIFY),
        '-background',
        'white',
        '-alpha',
        'remove',
        '-trim',
        '-density',
        300,
        '-quality',
        90,
        "${input}");
    printf("Exec: %s\n", join(' ', @command));
    system @command and do {
        warn sprintf("Failed to run:\n%s\n.Exit code is %d", join(' ', @command), $?);
        exit $? >> 8;
    };
}

# Concatenate the images.
@command = (sprintf('%s', &CONVERT), '-append');
push(@command, sub {my @v = (); foreach (@sorted_keys) { push(@v, $files{$_}) } @v }->() );
push(@command, &OUTPUT);
printf("Exec: %s\n", join(' ', @command));
system @command and do {
    warn sprintf("Failed to run:\n%s\n.Exit code is %d", join(' ', @command), $?);
    exit $? >> 8;
};

# Add border.
@command = (
    sprintf('%s', &MOGRIFY),
    '-border',
    20,
    '-bordercolor',
    'white',
    &OUTPUT
);
printf("Exec: %s\n", join(' ', @command));
system @command and do {
    warn sprintf("Failed to run:\n%s\n.Exit code is %d", join(' ', @command), $?);
    exit $? >> 8;
};

printf("Result: \"%s\"\n", &OUTPUT);

