# libtai-0.60 - Windows compilation
# Public domain code originally written by Daniel Bernstein (Unix)
#
# 2021-06-03 Incomplete support for full library - only the bits I need
#             - TAI64 supported; TAI64NA not

!IF !EXIST(obj)
!IF [mkdir obj] != 0
!ERROR Creating obj subdirectory
!ENDIF
!ENDIF

LIBTAIx=obj/tai_add.o obj/tai_now.o obj/tai_pack.o obj/tai_sub.o \
	obj/tai_unpack.o obj/taia_add.o obj/taia_approx.o obj/taia_fmtfrac.o \
	obj/taia_frac.o obj/taia_half.o obj/taia_less.o obj/taia_now.o \
	obj/taia_pack.o obj/taia_sub.o obj/taia_tai.o obj/taia_unpack.o \
	obj/caldate_fmt.o obj/caldate_scan.o obj/caldate_fmjd.o \
	obj/caldate_mjd.o obj/caldate_norm.o obj/caldate_ster.o \
	obj/leapsecs_read.o obj/leapsecs_init.o obj/leapsecs_add.o \
	obj/leapsecs_sub.o obj/caltime_fmt.o obj/caltime_scan.o \
	obj/caltime_tai.o obj/caltime_utc.o

LIBTAI=obj/tai_add.obj obj/tai_now.obj obj/tai_pack.obj obj/tai_sub.obj \
	obj/tai_unpack.obj obj/taia_add.obj obj/taia_approx.obj obj/taia_fmtfrac.obj \
	obj/taia_frac.obj obj/taia_half.obj obj/taia_less.obj obj/taia_now.obj \
	obj/taia_pack.obj obj/taia_sub.obj obj/taia_tai.obj obj/taia_unpack.obj \
	obj/leapsecs_read.obj obj/leapsecs_init.obj obj/leapsecs_add.obj \
	obj/leapsecs_sub.obj
LIBCALDATE=obj/caldate_fmt.obj obj/caldate_scan.obj obj/caldate_fmjd.obj \
	obj/caldate_mjd.obj obj/caldate_norm.obj obj/caldate_ster.obj \
    obj/caldate_isleap.obj obj/caldate_verify.obj obj/caldate_dow.obj \
	obj/caldate_doy.obj obj/caldate_fxl.obj
LIBCALTIME=obj/caltime_fmt.obj obj/caltime_scan.obj obj/caltime_tai.obj \
	obj/caltime_utc.obj

OTHEROBJS=obj/check.obj obj/easter.obj obj/leapsecs.obj \
	obj/nowutc.obj obj/yearcal.obj

PROGRAMSx=check.exe easter.exe leapsecs.exe nowutc.exe yearcal.exe
PROGRAMS=easter.exe leapsecs.exe yearcal.exe xltest.exe

all: $(LIBTAI) $(LIBCALDATE) $(LIBCALTIME) $(PROGRAMS)

libtai.lib: $(LIBTAI)
	lib /nologo /out:$@ $**
libcaldate.lib: $(LIBCALDATE)
	lib /nologo /out:$@ $**
libcaltime.lib: $(LIBCALTIME)
	lib /nologo /out:$@ $**

# Programs
check.exe: obj/check.obj libtai.lib
	link /nologo /out:$@ $**
easter.exe: obj/easter.obj libcaldate.lib
	link /nologo /out:$@ $**
leapsecs.exe: obj/leapsecs.obj libtai.lib libcaldate.lib
	link /nologo /out:$@ $**
nowutc.exe: obj/nowutc.obj libtai.lib
	link /nologo /out:$@ $**
# Day 0 sunday
yearcal.exe: obj/yearcal.obj libcaldate.lib
	link /nologo /out:$@ $**
xltest.exe: obj/xltest.obj libcaldate.lib
	link /nologo /out:$@ $**

COBJFLAGS=/nologo /c -Iw32 -Iorig

# Original (unaltered) sources
obj/tai_add.obj: orig/tai_add.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
# tai_now - warning issued
obj/tai_now.obj: orig/tai_now.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/tai_pack.obj: orig/tai_pack.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/tai_sub.obj: orig/tai_sub.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/tai_unpack.obj: orig/tai_unpack.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/taia_add.obj: orig/taia_add.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/taia_approx.obj: orig/taia_approx.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/taia_fmtfrac.obj: orig/taia_fmtfrac.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/taia_frac.obj: orig/taia_frac.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/taia_half.obj: orig/taia_half.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/taia_less.obj: orig/taia_less.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/taia_pack.obj: orig/taia_pack.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/taia_sub.obj: orig/taia_sub.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/taia_tai.obj: orig/taia_tai.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/taia_unpack.obj: orig/taia_unpack.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/caldate_fmt.obj: orig/caldate_fmt.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/caldate_scan.obj: orig/caldate_scan.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/caldate_mjd.obj: orig/caldate_mjd.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/caldate_norm.obj: orig/caldate_norm.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/caldate_ster.obj: orig/caldate_ster.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/leapsecs_init.obj: orig/leapsecs_init.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/leapsecs_add.obj: orig/leapsecs_add.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/leapsecs_sub.obj: orig/leapsecs_sub.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/caltime_fmt.obj: orig/caltime_fmt.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/caltime_scan.obj: orig/caltime_scan.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/caltime_tai.obj: orig/caltime_tai.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/caltime_utc.obj: orig/caltime_utc.c
	$(CC) $(COBJFLAGS) /Fo$@ $**

obj/check.obj: orig/check.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/easter.obj: orig/easter.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/leapsecs.obj: orig/leapsecs.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/nowutc.obj: orig/nowutc.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/yearcal.obj: orig/yearcal.c
	$(CC) $(COBJFLAGS) /Fo$@ $**

# Modified sources
obj/caldate_fmjd.obj: w32/caldate_fmjd.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/taia_now.obj: w32/taia_now.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/leapsecs_read.obj: w32/leapsecs_read.c
	$(CC) $(COBJFLAGS) /Fo$@ $**

# Additional sources
obj/caldate_isleap.obj: w32/caldate_isleap.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/caldate_verify.obj: w32/caldate_verify.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/caldate_dow.obj: w32/caldate_dow.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/caldate_doy.obj: w32/caldate_doy.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/caldate_fxl.obj: w32/caldate_fxl.c
	$(CC) $(COBJFLAGS) /Fo$@ $**
obj/xltest.obj: w32/xltest.c
	$(CC) $(COBJFLAGS) /Fo$@ $**

clean:
	del /q obj\*.*
	del /q $(PROGRAMS)