/***********************************************************************/
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/***********************************************************************/

/* (*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2015 Hongwei Xi, ATS Trustful Software, Inc.
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
** $PATSHOME/prelude/CATS/CODEGEN/memory.atxt
** Time of generation: Tue Nov 17 16:34:23 2015
*/

/* ****** ****** */

/*
(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: January, 2013 *)
*/

/* ****** ****** */

#ifndef ATSLIB_PRELUDE_CATS_MEMORY
#define ATSLIB_PRELUDE_CATS_MEMORY

/* ****** ****** */

#define atspre_minit_gc ATS_MINIT

/* ****** ****** */

#define atspre_mfree_gc ATS_MFREE

/* ****** ****** */

#define atspre_malloc_gc ATS_MALLOC

/* ****** ****** */

#define atspre_calloc_gc ATS_CALLOC
#define atspre_realloc_gc ATS_REALLOC

/* ****** ****** */

#endif // ifndef ATSLIB_PRELUDE_CATS_MEMORY

/* ****** ****** */

/* end of [memory.cats] */
