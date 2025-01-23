#!/bin/bash
# Sample:  <row Id="25679" PostTypeId="2" ParentId="6113" CreationDate="2008-08-25T05:12:51.047" Score="3" Body="&lt;p&gt;Just assume that the bad guys WILL get the credentials out of your config file.  This means that they'd be able to login to your database and do whatever that user is capable of.  So just make sure that user can't do anything bad like access the tables directly.  Make that user only capable of executing certain stored procedures and you'll be in better shape.  This is one place that sprocs shine.&lt;/p&gt;&#xA;" OwnerUserId="1975" OwnerDisplayName="Webjedi" LastActivityDate="2008-08-25T05:12:51.047" CommentCount="1" ContentLicense="CC BY-SA 2.5" />

7z e -so stackoverflow.com-Posts.7z | \
xidel -se '//row/[(@Id|@PostTypeId|@AcceptedAnswerId|@CreationDate|@Score|@ViewCount|@Body|@OwnerUserId|@OwnerDisplayName|@LastActivityDate|@CommentCount|@ContentLicense)]' - | \
(echo "Id,PostTypeId,AcceptedAnswerId,CreationDate,Score,ViewCount,Body,OwnerUserId,OwnerDisplayName,LastActivityDate,CommentCount,ContentLicense" &&
jq -r '. | @csv') |
gzip -9 > Posts.csv.gz
