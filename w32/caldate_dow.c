#include "caldate.h"

int caldate_dow(mjd)
long mjd;
{
  int dow=(mjd + 3) % 7;
  return dow+((dow<0)?7:0);
}
