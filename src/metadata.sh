#!/usr/bin/env zsh

cp ~/bibliotecanacional/src/getEssoMonth.class .
# upload a directory of images.zip files
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia upload/ 1 1-27 11 /--metadata=\"mediatype:texts\" --metadata=\"collection:lagocollection\" --metadata=\"collection:arubanewspapers\" --metadata=\"collection:bibliotecanacionalaruba\"/ 40 1-* 197 | > upload.sh"

#add eng as a language
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia metadata/ 1 1-27 14 /--modify=\"language:eng\"/ 45 | >> upload.sh"

#append Papiamento as a language
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia metadata/ 1 1-27 14 /--append-list=\"language:Papiamento\"/ 45 | >> upload.sh"

#set the creator
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia metadata/ 1 1-27 14 /--modify=\"creator:Lago Oil and Transport Co. Ltd.\"/ 45 | >> upload.sh"

#set the subject
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia metadata/ 1 1-27 14 /--modify=\"subject:company publications\"/ 45 | >> upload.sh "

#add the other subjects
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia metadata/ 1 1-27 14 /--append-list=\"subject:Aruba\"/ 45 | >> upload.sh "
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia metadata/ 1 1-27 14 /--append-list=\"subject:Lago Oil & Transport Co. Ltd.\"/ 45 | >> upload.sh "
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia metadata/ 1 1-27 14 /--append-list=\"subject:oil industry\"/ 45 | >> upload.sh "
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia metadata/ 1 1-27 14 /--append-list=\"subject:refineries\"/ 45 | >> upload.sh "
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia metadata/ 1 1-27 14 /--append-list=\"subject:community\"/ 45 | >> upload.sh "
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia metadata/ 1 1-27 14 /--append-list=\"subject:events\"/ 45 | >> upload.sh "
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia metadata/ 1 1-27 14 /--append-list=\"subject:people\"/ 45 | >> upload.sh "
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia metadata/ 1 1-27 14 /--append-list=\"subject:sports\"/ 45 | >> upload.sh "
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia metadata/ 1 1-27 14 /--append-list=\"subject:Standard Oil of New Jersey\"/ 45 | >> upload.sh "

#description
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia metadata/ 1 1-27 13 /--modify=\"description:Aruba Esso News, A bi-weekly publication by Lago Oil & Transport Co. Ltd, San Nicolas, Aruba, in English and Papiamento. Digitized and made available online by Biblioteca Nacional Aruba.\"/ 41 | >> upload.sh"

#title
java org.netrexx.njpipes.pipes.runner "literal ls -1 | command | locate /images.zip/ | specs 1-27 1 | getEssoMonth | >> upload.sh"

#date
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia metadata/ 1 1-27 14 /--modify=\"date:/ 45 18-27 60 /\"/ 70| >> upload.sh"

#delete if we need to start over
pipe "literal ls -1 | command | locate /images.zip/ | specs /ia delete/ 1 1-27 12 /--all -H x-archive-keep-old-version:0/ 40 | > delete.sh"


 
