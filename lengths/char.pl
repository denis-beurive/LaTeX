#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Path::Tiny;
use Getopt::Long;
use Readonly;

Readonly::Scalar my $DEFAULT_TEMPLATE => './template.tex';
Readonly::Scalar my $DEFAULT_OUTPUT   => './output.tex';

my $TPL = <<'END_MESSAGE';
   \newsavebox{\__BOX_NAME__}
   \savebox{\__BOX_NAME__}{\framebox{__CHAR__}}
   \addtostream{dimensions}{__CHAR__:  \the\wd\__BOX_NAME__, \the\ht\__BOX_NAME__, \the\dp\__BOX_NAME__}
END_MESSAGE

my $L1 = 0;
my $L2 = 0;
my $L3 = 0;
my $L4 = 0;
my @L = ('a'..'z');

# -------------------------------------------------------
# Parse the command line
# -------------------------------------------------------

# Path to the file that contains the LaTeX template.
my $clo_template = $DEFAULT_TEMPLATE;
# Path to the LaTeX file that will be created.
my $clo_output = $DEFAULT_OUTPUT;
# Help switch.
my $clo_help;

unless (
    GetOptions (
        'help'       => \$clo_help,
        'template=s' => \$clo_template,
        'ouput=s'    => \$clo_output,
    )
) { error("ERROR: Invalid command line.") }

if ($clo_help) {
    help();
    exit 0
}


# -------------------------------------------------------
# Generate the LaTeX code
# -------------------------------------------------------

my @chars = ('a'..'z', 'A'..'Z', '0'..'9');

my @tags = ();
foreach my $c (@chars) {
    my $t = $TPL;
    my $box_name = 'box'. get_name();
    $t =~ s/__BOX_NAME__/${box_name}/mg;
    $t =~ s/__CHAR__/${c}/mg;

    push(@tags, $t);
}

my $tpl_file = path($clo_template);
my $tpl_content = $tpl_file->slurp;
my $code = join("\n", @tags);
$tpl_content =~ s/__CODE__/${code}/;

my $output_file = path($clo_output);
$output_file->spew($tpl_content);




sub help {
    print "perl char.pl [--template=</path/to/template>] [--output=</path/to/output/file>] [--help]\n";
    printf "Default template is: \"%s\"\n", $DEFAULT_TEMPLATE;
}

sub get_name {
    my $r = sprintf "%s%s%s%s", $L[$L1], $L[$L2], $L[$L3], $L[$L4];
    if ($L1<25) { $L1++ } elsif($L2<25) {
        $L2++
    } elsif($L3<25) {
        $L3++
    } elsif($L4<25) {
        $L4++;
    } else {
        error("Unexpected error!")
    }
    return $r;
}

sub error {
    my ($in_message) = @_;
    printf "%s\n", $in_message;
    exit 1;
}

