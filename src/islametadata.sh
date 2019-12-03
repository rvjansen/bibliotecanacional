#!/usr/bin/env zsh

# upload a directory of .pdf files
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia upload/ 1 1-29 11 /--metadata=\"mediatype:texts\" --metadata=\"collection:arubagovernment\" --metadata=\"collection:arubanewspapers\" --metadata=\"collection:bibliotecanacionalaruba\"/ 42 1-* 199 | > upload.sh"

#add eng as a language
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-29 14 /--modify=\"language:Papiamento\"/ 45 | >> upload.sh"

#set the creator
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-29 14 /--modify=\"creator:Gabinete Wever-Croes\"/ 45 | >> upload.sh"

#set the subject
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-29 14 /--modify=\"subject:government publications\"/ 45 | >> upload.sh "

#add the other subjects
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-29 14 /--append-list=\"subject:Aruba\"/ 45 | >> upload.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-29 14 /--append-list=\"subject:government\"/ 45 | >> upload.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-29 14 /--append-list=\"subject:noticiero\"/ 45 | >> upload.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-29 14 /--append-list=\"subject:periodicals\"/ 45 | >> upload.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-29 14 /--append-list=\"subject:newsletters\"/ 45 | >> upload.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-29 14 /--append-list=\"subject:Gabinete Wever-Croes\"/ 45 | >> upload.sh "

#description
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-29 13 /--modify=\"description:Isla Online, A daily publication by the Aruban Government. Collection Biblioteca Nacional Aruba.\"/ 45 | >> upload.sh"

#title
java org.netrexx.njpipes.pipes.runner "literal ls -1 | command | locate /.pdf/ | specs 1-29 1 | getIslaMonth | >> upload.sh"

#date
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-29 14 /--modify=\"date:/ 45 20-29 60 /\"/ 70| >> upload.sh"

#delete if we need to start over
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia delete/ 1 1-29 12 /--all -H x-archive-keep-old-version:0/ 40 | > delete.sh"


 
