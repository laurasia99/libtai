/*xltest.c - test conversion of Excel serial numbers to dates*/

#include <stdio.h>
#include "caldate.h"

int main(int argc,char**argv){
  long d;
  struct caldate cd;
  for(int i=1;i<argc;++i){
    if(1!=sscanf(argv[i],"%ld",&d))
      fprintf(stderr,"'%s' is not an integer\n",argv[i]);
    else{
      caldate_fromxl(&cd,d);
      printf("%s -> %02d/%02d/%d\n",argv[i],cd.day,cd.month,cd.year);
    }
  }
  return 0;
}
