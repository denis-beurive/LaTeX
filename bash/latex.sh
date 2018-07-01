#!/bin/bash
#
# This file contains functions that can be used to customise your BASH environment.
#
# These functions should be added to your BASH configuration file ("~/.bashrc"). One way to do this s simply to
# copy paste the content of this file to your BASH configuration file. Or you can source the present file from your
# BASH configuration file.
#
# WARNING !!!
#
# Some functions need to be configured. Please read the functions descriptions carefully.

# This function checks that a given character set is included within a given list of character sets.
# @param [string] #1 The given character set.
#        For example: "ISO-8859-15"
# @param [string] #2 The list of character sets.
#        For example: "ISO-8859-15|ISO-8859-1|ascii|us-ascii"
# @return [string] If the given character set is included within the given list of character sets, then the function
#         returns "yes". Otherwise, the funtion returns "no". 
# @see https://github.com/denis-beurive/LaTeX
# @see http://www.iana.org/assignments/character-sets/character-sets.xhtml

check_file_encoding() {
   typeset -r ENC="${1}"
   typeset -r EXPECTED_ENC="${2}"
   typeset -r MATCH=$(perl -e "use strict; \
        my \$given = lc \$ARGV[0]; \
        my @t=split '\\|', \"${EXPECTED_ENC}\"; \
        my %vs = (); foreach my \$e (@t) { \$vs{lc \$e} = 0 } \
        print exists \$vs{\$given} ? 'yes' : 'no' \
        " $ENC)

   echo $MATCH
}

# This function checks that the file encoding of a given file (identified by its path) is listed within a configured
# list of characters sets. If so, then the function launches the VIM editor on the given file, with a configured file
# encoding.
# @param [string] #1 Path the the file.
# @note You must configure the function by setting values for the local variables listed below:
#       - EXPECTED_ENC: list the accepted file encodings.
#       - WANTED_ENC:   the encoding that you want to open the file with.
# @see https://github.com/denis-beurive/LaTeX
# @see http://www.iana.org/assignments/character-sets/character-sets.xhtml

vitex() {

   # CONFIGURATION

   typeset -r EXPECTED_ENC='ISO-8859-15|ISO-8859-1|ascii|us-ascii'
   typeset -r WANTED_ENC='ISO-8859-15'
   
   typeset -r INPUT_FILE="$1"
   typeset ENC
   typeset MATCH="yes"

   if [ -f "${INPUT_FILE}" ]; then
      ENC=$(file --mime-encoding "${INPUT_FILE}" | sed -e 's/^[^:]\+: \+//')
      MATCH=$(check_file_encoding "${ENC}" "${EXPECTED_ENC}")
   else
      touch "${INPUT_FILE}"
   fi

   if [ -f "${INPUT_FILE}" ]; then   
      if [ $MATCH == "yes" ]; then
           vim -c "set fileencoding=${WANTED_ENC}" "${INPUT_FILE}"
      else
           echo "Wrong file encoding (${ENC}) ! Accepted encodings are: ${EXPECTED_ENC}"
      fi
   else 
      echo "Something is wrong with the given path! This is not a regular file!"
   fi
}

# Uncomment the lines below in order to test the functions defined within this document.
vitex "$1"


