#!/bin/bash

# start by fetching the books
/bin/bash fetch.sh
# and then separate epubs and mobi's, giving them proper filenames while we're at it
/bin/bash process.sh
