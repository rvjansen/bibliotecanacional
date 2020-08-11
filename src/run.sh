rm *.zip
cp ~/apps/bibliotecanacional/src/ArubaanseCourant.class .
cp ~/apps/bibliotecanacional/src/IncrementalUpload*.class .
source rename.sh
java ArubaanseCourant
java IncrementalUpload
source upload.sh
