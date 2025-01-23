#!/bin/bash
# Sample:      <row Id="44562" Reputation="74770" CreationDate="2008-12-09T11:04:10.673" DisplayName="soulmerge" LastAccessDate="2024-04-04T12:24:33.967" WebsiteUrl="https://atesman.at" AboutMe="" Views="2405" UpVotes="2725" DownVotes="186" AccountId="19131" />

7z e -so stackoverflow.com-Users.7z | \
xidel -se '//row/[(@Id|@Reputation|@CreationDate|@DisplayName|@LastAccessDate|@WebsiteUrl|@AboutMe|@Views|@UpVotes|@DownVotes|@AccountId)]' - | \
(echo "Id,Reputation,CreationDate,DisplayName,LastAccessDate,WebsiteUrl,AboutMe,Views,UpVotes,DownVotes,AccountId" &&
jq -r '. | @csv') |
gzip -9 > Users.csv.gz




