#ifndef CALDATE_H
#define CALDATE_H

struct caldate {
  long year;
  int month;
  int day;
} ;

extern unsigned int caldate_fmt();
extern unsigned int caldate_scan();

extern void caldate_frommjd();
extern long caldate_mjd();
extern void caldate_normalize();

extern void caldate_easter();

extern int caldate_isleap();
extern int caldate_validate();
extern int caldate_dow();
extern int caldate_doy();

#endif
