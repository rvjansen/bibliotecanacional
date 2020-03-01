#!/usr/bin/env zsh

rm meta.sh
rm description.sh

cp ~/bibliotecanacional/src/getAweMonth.class .
#add eng as a language

#append Papiamento as a language
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--modify=\"language:Papiamento\"/ nextword | >> meta.sh"

#set the creator
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--modify=\"creator:The Media Group\"/ nextword | >> meta.sh"

#set the subject
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--modify=\"subject:newspapers\"/ nextword | >> meta.sh "

#add the other subjects
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:Aruba\"/ nextword | >> meta.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:corant\"/ nextword | >> meta.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:periodico\"/ nextword | >> meta.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:publicacion diario\"/ nextword | >> meta.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:dagblad\"/ nextword | >> meta.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:krant\"/ nextword | >> meta.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:Oranjestad\"/ nextword | >> meta.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:papiamento\"/ nextword | >> meta.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:noticia\"/ nextword | >> meta.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:local\"/ nextword | >> meta.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:politica\"/ nextword | >> meta.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:suceso\"/ nextword | >> meta.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:deporte\"/ nextword | >> meta.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:internacional\"/ nextword | >> meta.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:news\"/ nextword | >> meta.sh "
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--append-list=\"subject:current events\"/ nextword | >> meta.sh "

#description
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--modify=\"description:&lt;div&gt;&lt;a href=&quot;http:\/\/bna.aw\/digital\/?col=arubanewspapers&quot; rel=&quot;nofollow&quot;&gt;Coleccion Revista/Corant&lt;/a&gt;, Biblioteca Nacional Aruba&lt;\/div&gt;&lt;div&gt;&lt;br \/&gt;&lt;\/div&gt;&lt;div&gt;Awe Mainta&lt;\/div&gt;&lt;div&gt;&quot;E Corant di Toko&quot;&lt;\/div&gt;&lt;div&gt;Publica pa Victor &quot;Toko&quot; Winklaar, Oranjestad Aruba&lt;\/div&gt;&lt;div&gt;&lt;br \/&gt;&lt;\/div&gt;&lt;div&gt;&lt;br \/&gt;&lt;\/div&gt;Republished online by &lt;a href=&quot;http:\/\/www.archive.org\/details\/bibliotecanacionalaruba&quot; rel=&quot;nofollow&quot;&gt;Biblioteca Nacional Aruba&lt;\/a&gt; as part of the National Digital Collection with the publisher&quot;s permission. All rights remain reserved by the publisher.\"/ nextword | >> description.sh "

#title
java org.netrexx.njpipes.pipes.runner "literal ls -1 | command | locate /.pdf/ | specs 1-28 1 | getAweMonth | >> meta.sh"


#set the printer
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 14 /--modify=\"printer:Oranjestad: Imprenta Nacional Arubano\"/ nextword | >> meta.sh"

#date
pipe "literal ls -1 | command | locate /.pdf/ | specs /ia metadata/ 1 1-28 nextword /--modify=\"date:/ nextword 19-28 next /\"/ 67| >> meta.sh"



 
chmod +x meta.sh
chmod +x description.sh
