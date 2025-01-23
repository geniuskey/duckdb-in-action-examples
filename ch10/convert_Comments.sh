#!/bin/bash
# Sample:   <row Id="57515" PostId="37862" Score="0" Text="To other readers:, don't feel like you aren't smart enough to &#xA;a) test whatever built in generator you are using (there are lot of bad ones, unsuitable for simulation work) &#xA;b) learn enough about the existing generators to know which will suit your needs &#xA;c) learn to best use results" CreationDate="2008-10-05T14:15:48.240" UserId="279" />

7z e -so stackoverflow.com-Comments.7z | \
xidel -se '//row/[(@Id|@PostId|@Score|@Text|@CreationDate|@UserId)]' - | \
(echo "Id,PostId,Score,Text,CreationDate,UserId" &&
jq -r '. | @csv') |
gzip -9 > Comments.csv.gz
