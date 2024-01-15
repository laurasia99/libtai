#include "caldate.h"

int caldate_isleap(long year)
{
  return (year%400==0)||((year%100!=0)&&(year%4==0));
}
