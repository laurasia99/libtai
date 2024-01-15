Downloaded from https://cr.yp.to/libtai.html
NMake used for Windows compilation

2021-06-03 Incomplete support for full library - only the bits I need
            - TAI64 supported; TAI64NA not

I believe that there is an error in the libtai-0.60 caldate_frommjd()
function, and the calculation of the day of the year. This error can
be seen when calculating the day of the year of 1 March 1900, which
should be 59 (since 1900 is not a leap year), however (the unfixed)
caldate_frommjd() function returns 60.

The fix is to change line #31 in caldate_fmjd.c:
  yday = (day < 306);
to:
  /* Adjust 4-year cycle of leap years */
  yday = ((year%400==0)||(year%100!=0))&&(day < 306);

The modified file is w32\caldate_fmjd.c (c.f. orig\caldate_fmjd.c).
