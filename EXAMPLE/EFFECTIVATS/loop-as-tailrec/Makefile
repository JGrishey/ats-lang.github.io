#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc

######

all::

######

all:: \
tailrec
tailrec: \
tailrec.dats ; $(PATSCC) -tcats $@ $<

######

ATSHOMEQ="$(ATSHOME)"
ATSCC=$(ATSHOMEQ)/bin/atscc
ATSDOC=$(ATSHOMEQ)/bin/atsdoc

######

INPATH :=
INPATH += -I$(PATSHOME)/src
INPATH += -IATS $(PATSHOME) -IATS $(ATSHOME)

LDPATH :=
LDPATH += -L$(PATSHOME)/utils/libatsopt
LDPATH += -L$(PATSHOME)/utils/libatsynmark

LIBRARY :=
LIBRARY := -latsynmark -latsdoc -latsopt -lats -lgmp

######
#
main.exe: \
main_atxt.dats ; \
$(ATSCC) \
  -D_ATS_GCATS \
  $(INPATH) -o $@ $< $(LDPATH) $(LIBRARY)
#
main_atxt.dats: main.atxt; \
$(ATSDOC) --outcode $@ -i main.atxt > main_atxt.txt
#
######

main.html: main.exe ; ./main.exe > $@

######

upload_main: \
  main.html ; \
  scp main.html \
  ats-hwxi,ats-lang@web.sourceforge.net:htdocs/EXAMPLE/EFFECTIVATS/loop-as-tailrec/

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) main_atxt.txt
clean:: ; $(RMF) main_atxt.dats
clean:: ; $(RMF) main_atxt_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) main.exe
cleanall:: ; $(RMF) main.html

######

###### end of [Makefile] ######
