#include "caldate.h"

static int days[12]={31,28,31,30,31,30,31,31,30,31,30,31};

int caldate_verify(cd)
struct caldate *cd;
{
  return(cd->month>0&&cd->month<=12&&cd->day>0
     &&cd->day<=days[cd->month-1]+((cd->month==2)?caldate_isleap(cd->year):0));
}
