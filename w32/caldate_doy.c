#include "caldate.h"

int caldate_doy(mjd)
long mjd;
{
  struct caldate cd; /* Req'd by caldate_frommjd() */
  int doy;
  caldate_frommjd(&cd,mjd,0,&doy);
  return doy;
}
