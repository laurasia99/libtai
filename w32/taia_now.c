#include <windows.h>
#include "taia.h"

void taia_now(t)
struct taia *t;
{
  SYSTEMTIME st;
  ULARGE_INTEGER lt; /* 64-bit; 100-nanoseconds (10^-7) since 1 January 1601 */
  GetSystemTime(&st);
  SystemTimeToFileTime(&st,(LPFILETIME)&lt);
/* Number of seconds from 1 January 1601 to 1 January 1970
 *  - 89 leap years 89(24*3+17)
 *  - 135,139 days (370*365+89)
 *  - 3,243,336 hours
 *  -            11,676,009,600 seconds
 *  - 4,611,686,018,427,387,914 offset per djb taia_now()
 *  - 4,611,686,030,103,397,514 adjusted TAI offset
 */
  t->sec.x = 4611686030103397514ULL + lt.QuadPart/10000000ULL;
  t->nano = 100*lt.QuadPart + 50;
  t->atto = 0;
}

#if 0 /* Original djb code - unix */
#include <sys/types.h>
#include <sys/time.h>
#include "taia.h"

/* XXX: breaks tai encapsulation */

void taia_now(t)
struct taia *t;
{
  struct timeval now;
  gettimeofday(&now,(struct timezone *) 0);
  t->sec.x = 4611686018427387914ULL + (uint64) now.tv_sec;
  t->nano = 1000 * now.tv_usec + 500;
  t->atto = 0;
}
#endif
