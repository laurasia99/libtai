#include "caldate.h"

/*Excel dates: 1/1/1900 has serial number 1*/
void caldate_fromxl(cd,xlserial)
struct caldate *cd;
long xlserial;
{
  cd->year=1900;
  cd->month=1;
  cd->day=xlserial-1;
  caldate_normalize(cd);
}
