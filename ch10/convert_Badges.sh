#!/bin/bash
# Sample:    <row Id="1835163" UserId="724506" Name="Teacher" Date="2011-06-15T22:56:15.810" Class="3" TagBased="False" />

7z e -so stackoverflow.com-Badges.7z | \
xidel -se '//row/[(@Id|@UserId|@Name|@Date|@Class|@TagBased)]' - | \
(echo "Id,UserId,Name,Date,Class,TagBased" &&
jq -r '. | @csv') |
gzip -9 > Badges.csv.gz
