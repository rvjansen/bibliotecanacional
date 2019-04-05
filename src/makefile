#
# makefile for bibliotecanacional tools
#

COMPILE_COMMAND=java org.netrexx.process.NetRexxC
COMPILE_FLAGS=-comments -sourcedir -time -compact -warnexit0
ANTLR_COMPILE_COMMAND=java -jar lib/antlr-4.5.3-complete.jar
JAVA_COMPILE_COMMAND=java org.eclipse.jdt.internal.compiler.batch.Main
JAVA_COMPILE_FLAGS=-warn:-unusedPrivate -warn:-unusedLocal -warn:unavoidableGenericProblems -Xemacs -source 1.6

.nrx.class:
	$(COMPILE_COMMAND) $< $(COMPILE_FLAGS)
#	$(JAVA_COMPILE_COMMAND) $(JAVA_COMPILE_FLAGS) $*.java

NRX_SRC		:= $(wildcard *.nrx)
NRX_OBJS	:= $(NRX_SRC:.nrx=.class)
JAVA_SRC	:= $(wildcard *.java)
JAVA_OBJS	:= $(JAVA_SRC:.java=.class)
PLFILES		:= $(wildcard *.pl)

.SUFFIXES: .nrx .nry .njp .class .skel .xsl .java .pl .g

#
# target all compiles the netrexx and java code
#
all::	Zip.class \
	$(NRX_OBJS)

#
# target clean removes compiled products
#
.PHONY: clean
clean: 
	rm -f *.class
	rm -f *.java	
	rm -f *.crossref
	rm -f *.bak
	find . -name "*.nrx" | awk '{$$2 = $$1 ; sub ( /\.nrx/,".java",$$1 ) ; print $$1 }' | xargs rm -f



