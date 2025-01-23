#!/bin/bash
# Sample:   <row Id="7302" PostId="3061" VoteTypeId="2" CreationDate="2008-08-06T00:00:00.000" />

7z e -so stackoverflow.com-Votes.7z | \
xidel -se '//row/[(@Id|@PostId|@VoteTypeId|@CreationDate)]' - | \
(echo "Id,PostId,VoteTypeId,CreationDate" &&
jq -r '. | @csv') |
gzip -9 > Votes.csv.gz
