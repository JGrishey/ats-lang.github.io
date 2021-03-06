/***********************************************************************/
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/***********************************************************************/

/* (*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2013 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
**
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
**
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*) */

/* ****** ****** */

/*
** Source:
** $PATSHOME/libc/CATS/CODEGEN/time.atxt
** Time of generation: Wed Sep 23 16:09:13 2015
*/

/* ****** ****** */

/*
(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: March, 2013 *)
*/

/* ****** ****** */

#ifndef ATSLIB_LIBC_CATS_TIME
#define ATSLIB_LIBC_CATS_TIME

/* ****** ****** */

#include <time.h>

/* ****** ****** */

typedef time_t atslib_time_type ;
typedef struct tm atslib_tm_struct_type ;

/* ****** ****** */

typedef clock_t atslib_clock_type ;

/* ****** ****** */

typedef struct timespec atslib_timespec_type ;

/* ****** ****** */

#define atslib_difftime difftime

/* ****** ****** */

#define atslib_time_get() time((time_t*)0)

ATSinline()
atstype_bool
atslib_time_getset
(
  atstype_ref tval
) {
  return (time((time_t*)tval) >= 0 ? atsbool_true : atsbool_false) ;
} // end of [atslib_time_getset]

/* ****** ****** */

#define atslib_ctime ctime
#define atslib_ctime_r ctime_r

/* ****** ****** */

ATSinline()
atstype_int
atslib_tm_get_sec
  (atstype_ptr tm) {
  return ((struct tm*)tm)->tm_sec ;
} // end of [atslib_tm_get_sec]

ATSinline()
atstype_int
atslib_tm_get_min
  (atstype_ptr tm) {
  return ((struct tm*)tm)->tm_min ;
} // end of [atslib_tm_get_min]

ATSinline()
atstype_int
atslib_tm_get_hour
  (atstype_ptr tm) {
  return ((struct tm*)tm)->tm_hour ;
} // end of [atslib_tm_get_hour]

ATSinline()
atstype_int
atslib_tm_get_mday
  (atstype_ptr tm) {
  return ((struct tm*)tm)->tm_mday ;
} // end of [atslib_tm_get_mday]

ATSinline()
atstype_int
atslib_tm_get_mon
  (atstype_ptr tm) {
  return ((struct tm*)tm)->tm_mon ;
} // end of [atslib_tm_get_mon]

ATSinline()
atstype_int
atslib_tm_get_year
  (atstype_ptr tm) {
  return ((struct tm*)tm)->tm_year ;
} // end of [atslib_tm_get_year]

ATSinline()
atstype_int
atslib_tm_get_wday
  (atstype_ptr tm) {
  return ((struct tm*)tm)->tm_wday ;
} // end of [atslib_tm_get_wday]

ATSinline()
atstype_int
atslib_tm_get_yday
  (atstype_ptr tm) {
  return ((struct tm*)tm)->tm_yday ;
} // end of [atslib_tm_get_yday]

ATSinline()
atstype_int
atslib_tm_get_isdst
  (atstype_ptr tm) {
  return ((struct tm*)tm)->tm_isdst ;
} // end of [atslib_tm_get_isdst]

/* ****** ****** */

#define atslib_mktime mktime

/* ****** ****** */

#define atslib_asctime asctime

/* ****** ****** */

#define atslib_gmtime gmtime
#define atslib_gmtime_r gmtime_r

/* ****** ****** */

#define atslib_localtime localtime
#define atslib_localtime_r localtime_r

/* ****** ****** */

#define atslib_tzset tzset

/* ****** ****** */

#define atslib_clock clock

#define atslib_clock_getres clock_getres

/* ****** ****** */

#define atslib_clock_gettime clock_gettime
#define atslib_clock_settime clock_settime

/* ****** ****** */

#endif // ifndef ATSLIB_LIBC_CATS_TIME

/* ****** ****** */

/* end of [time.cats] */
