#!/bin/bash
#
# This file contains functions that can be used to customise your BASH environment.
#
# These functions should be added to your BASH configuration file ("~/.bashrc").
# One way to do this is simply to copy paste the content of this file to your BASH
# configuration filei (~/.bashrc). Or you can source the present file from your BASH
# configuration filei (~/.bashrc).
#
# WARNING !!!
#
# Please, customize the function latex_configuration(). 

##########################################################################
#                            CONFIGURATION                               #
##########################################################################

# This funcion configures the LaTeX environment.
# @note You must configure the function by setting values for the local variables listed below:
#       - EXPECTED_ENC: list the accepted file encodings.
#       - WANTED_ENC:   the encoding that you want to open the file with.
# @see https://github.com/denis-beurive/LaTeX
# @see http://www.iana.org/assignments/character-sets/character-sets.xhtml

latex_configuration() {
   type EXPECTED_ENC 2>&1 >/dev/null | egrep ' not found$' > /dev/null
   if [ $? -eq 0 ]; then
      export EXPECTED_ENC='ISO-8859-15|ISO-8859-1|ascii|us-ascii'
      export WANTED_ENC='ISO-8859-15'
   fi
}

latex_configuration

# Make sure that the functions defined in this file are not already defined (for other purposes).

type check_file_encoding 2>&1 >/dev/null | egrep ' not found$' > /dev/null
if [ $? -ne 0 ]; then
   echo "WARNING !!!! Function check_file_encoding() will be redefined !"
fi

type vitex 2>&1 >/dev/null | egrep ' not found$' > /dev/null
if [ $? -ne 0 ]; then
   echo "WARNING !!!! Function vitex() will be redefined !"
fi

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

vitex() {
   typeset -r INPUT_FILE="$1"
   typeset ENC="${WANTED_ENC}"
   typeset MATCH="yes"

   if [ -s "${INPUT_FILE}" ]; then
      # The file exists and is not empty.
      ENC=$(file --mime-encoding "${INPUT_FILE}" | sed -e 's/^[^:]\+: \+//')
      MATCH=$(check_file_encoding "${ENC}" "${EXPECTED_ENC}")
   else
      # The file does not exist, or is empty.
      touch "${INPUT_FILE}" 
   fi

   if [ -f "${INPUT_FILE}" ]; then   
      if [ $MATCH == "yes" ]; then
           vim -c "set fileencoding=${WANTED_ENC}" "${INPUT_FILE}"
      else
           echo "Wrong file encoding (${ENC}) ! Accepted encodings are: ${EXPECTED_ENC}"
      fi
   else 
      echo "Something is wrong with the given path (${INPUT_FILE})! This is not a regular file!"
   fi
}

# Uncomment the lines below in order to test the functions defined within this document.
# vitex "$1"

