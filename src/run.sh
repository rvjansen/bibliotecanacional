rm *.zip
cp ~/apps/bibliotecanacional/src/ArubaanseCourant.class .
cp ~/apps/bibliotecanacional/src/IncrementalUpload*.class .
cp ~/apps/bibliotecanacional/src/Complete.class .
java Complete >renam2.sh
source renam2.sh
java ArubaanseCourant
java IncrementalUpload
source upload.sh
