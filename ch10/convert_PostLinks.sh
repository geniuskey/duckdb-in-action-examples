#!/bin/bash
# Sample:   <row Id="816331943" CreationDate="2013-07-28T15:03:46.380" PostId="17908846" RelatedPostId="1112665" LinkTypeId="1" />

7z e -so stackoverflow.com-PostLinks.7z | \
xidel -se '//row/[(@Id|@CreationDate|@PostId|@RelatedPostId|@LinkTypeId)]' - | \
(echo "Id,CreationDate,PostId,RelatedPostId,LinkTypeId" &&
jq -r '. | @csv') |
gzip -9 > PostLinks.csv.gz
