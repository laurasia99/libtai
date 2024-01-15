#ifndef CALDATE_H
#define CALDATE_H

struct caldate {
  long year;
  int month;
  int day;
} ;

/*ANSI prototypes*/
unsigned int caldate_fmt(char*,struct caldate*);
unsigned int caldate_scan(char*,struct caldate*);

void caldate_frommjd(struct caldate*,long day,int*pwday,int*pyday);
long caldate_mjd(struct caldate*cd);
void caldate_normalize(struct caldate*);

void caldate_easter(struct caldate*);

int caldate_isleap(long year);
int caldate_verify(struct caldate*);
int caldate_dow(long mjd);
int caldate_doy(long mjd);

void caldate_fromxl(struct caldate*,long);

#endif
