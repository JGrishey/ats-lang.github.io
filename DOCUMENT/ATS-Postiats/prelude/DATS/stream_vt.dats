(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
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
*)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/DATS/CODEGEN/list.atxt
** Time of generation: Sun Jul 31 10:16:08 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: gmhwxiATgmailDOTcom *)
(* Start time: July, 2012 *)

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
implement
{a}(*tmp*)
stream_vt_is_nil(xs) =
(
case+ !xs of
| ~stream_vt_nil() => true
| ~stream_vt_cons(_, xs) => (~xs; false)
)
implement
{a}(*tmp*)
stream_vt_is_cons(xs) =
  not(stream_vt_is_nil<a>(xs))
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
stream_vt_make_nil
  ((*void*)) = $ldelay(stream_vt_nil)
//
implement
{a}(*tmp*)
stream_vt_make_sing(x) =
(
//
$ldelay
(
stream_vt_cons(x, $ldelay(stream_vt_nil))
) (* $ldelay *)
//
) (* stream_vt_make_sing *)
//
implement
{a}(*tmp*)
stream_vt_make_con(xs_con) =
(
//
$ldelay
(
  xs_con
, $effmask_wrt(stream_vt_con_free<a>(xs_con))
)
//
) (* end of [stream_vt_make_con] *)
//
(* ****** ****** *)
//
// HX-2014-04-07:
// This is a wild implementation!
//
implement
{a}(*tmp*)
stream_vt2t(xs) = let
//
fun
aux (
  xs: stream_vt(a)
) :<!laz> stream(a) = let
//
val xs = $UN.castvwtp0{ptr}(xs)
//
in
//
$delay
(
let
  val xs =
    $UN.castvwtp0{stream_vt(a)}(xs)
  val xs_con = !xs
in
  case+ xs_con of
  | ~stream_vt_nil
      ((*void*)) => stream_nil(*void*)
    // end of [stream_vt_nil]
  | @stream_vt_cons
      (x, xs1) => let
      val xs1_val = xs1
      val ((*void*)) = (xs1 := aux (xs1_val))
    in
      $UN.castvwtp0{stream_con(a)}((view@x, view@xs1 | xs_con))
    end // end of [stream_cons]
end
)
end // end of [aux]
//
in
  aux (xs)
end // end of [stream_vt2t]

(* ****** ****** *)

local
//
// HX-2012:
// casting stream_vt_cons to list_cons
//
extern
castfn
stream2list_vt_cons
  {l0,l1,l2:addr}
(
  stream_vt_cons_unfold (l0, l1, l2)
) :<> list_vt_cons_unfold (l0, l1, l2)

in (* in-of-local *)

implement
{a}(*tmp*)
stream2list_vt(xs) = let
//
fun
loop (
  xs: stream_vt a
) :<!laz> List0_vt (a) = let
  val xs_con = !xs
in
  case+ xs_con of
  | ~stream_vt_nil
      ((*void*)) => list_vt_nil()
    // end of [stream_vt_nil]
  | @stream_vt_cons
      (x, xs1) => let
      val xs1_ = xs1
      val xs_con =
        stream2list_vt_cons(xs_con)
      // end of [val]
      val ((*void*)) = (xs1 := loop(xs1_))
    in
      fold@ (xs_con); xs_con
    end // end of [stream_vt_cons]
end // end of [loop]
//
in
  loop (xs)
end // end of [stream2list_vt]

end // end of [local]

(* ****** ****** *)
//
implement
{a}(*tmp*)
stream_vt_free(xs) = ~(xs)
//
implement
{a}(*tmp*)
stream_vt_con_free
  (xs_con) =
(
  case+ xs_con of
  | ~stream_vt_nil() => () | ~stream_vt_cons(_, xs) => ~xs
) (* stream_vt_con_free *)
//
(* ****** ****** *)

implement
{a}(*tmp*)
stream_vt_take
  (xs, n) = let
//
fun
loop
(
  xs: stream_vt(a)
, rem: int, res: &ptr? >> List0_vt(a)
) : void =
(
if
(rem > 0)
then (
case+ !xs of
| ~stream_vt_nil
    () =>
  (
    res := list_vt_nil()
  )
| ~stream_vt_cons
    (x, xs) => () where
  {
    val () =
    res :=
    list_vt_cons{a}{0}(x, _)
    val+
    list_vt_cons(_, res1) = res
    val () = loop(xs, rem-1, res1)
//
    prval ((*folded*)) = fold@(res)
//
  } (* end of [stream_vt_cons] *)
) else (
  stream_vt_free(xs); res := list_vt_nil()
) (* end of [if] *)
) (* end of [loop] *)
//
in
  let var res: ptr in loop(xs, n, res); res end
end // end of [stream_vt_take]

(* ****** ****** *)
//
implement
{a}(*tmp*)
stream_vt_drop_exn
  (xs, n) = let
//
fun aux
  : $d2ctype(stream_vt_drop_exn<a>) =
lam (xs, n) =>
(
//
if
n > 0
then (
//
case+ !xs of
| ~stream_vt_cons
    (_, xs) => aux(xs, n-1)
  // end of [stream_vt_cons]
| ~stream_vt_nil
    ((*void*)) => $raise StreamSubscriptExn()
  // end of [stream_vt_nil]
//
) (* end of [then] *)
else (xs) // end of [else]
//
) (* end of [lam] *)
//
in
  aux (xs, n)
end // end of [stream_vt_drop_exn]
//
implement
{a}(*tmp*)
stream_vt_drop_opt
  (xs, n) = let
//
fun aux
  : $d2ctype(stream_vt_drop_opt<a>) =
lam (xs, n) =>
(
//
if
n > 0
then (
//
case+ !xs of
| ~stream_vt_cons
    (_, xs) => aux(xs, n-1)
| ~stream_vt_nil
    ((*void*)) => None_vt((*void*))
//
) (* end of [then] *)
else Some_vt{stream_vt(a)}(xs) // [else]
//
) (* end of [lam] *)
//
in
  aux (xs, n)
end // end of [stream_vt_drop_opt]
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
stream_vt_head(xs) =
(
case+ !xs of
| ~stream_vt_cons (x, xs) =>
    let val () = stream_vt_free(xs) in x end
| ~stream_vt_nil ((*void*)) => $raise StreamSubscriptExn()
) (* end of [stream_vt_head] *)
//
implement
{a}(*tmp*)
stream_vt_tail(xs) =
(
case+ !xs of
| ~stream_vt_cons (x, xs) => (xs)
| ~stream_vt_nil ((*void*)) => $raise StreamSubscriptExn()
) (* end of [stream_vt_tail] *)
//
(* ****** ****** *)

implement
{a}(*tmp*)
stream_vt_uncons(xs0) =
(
case+ !xs0 of
| ~stream_vt_cons
    (x, xs) => (xs0 := xs; x)
| ~stream_vt_nil () => let
    val () =
      xs0 := $ldelay (stream_vt_nil)
    // end of [val]
  in
    $raise StreamSubscriptExn((*void*))
  end // end of [stream_vt_nil]
) (* end of [stream_vt_uncons] *)

implement
{a}(*tmp*)
stream_vt_uncons_opt(xs0) =
(
case+ !xs0 of
| ~stream_vt_cons
    (x, xs) =>
  (
    xs0 := xs; Some_vt(x)
  )
| ~stream_vt_nil() => let
    val () =
      xs0 := $ldelay(stream_vt_nil) in None_vt()
    // end of [val]
  end // end of [stream_vt_nil]
) (* end of [stream_vt_uncons_opt] *)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_vt_length(xs0) = let
//
fun
loop
(
  xs: stream_vt(a), n: intGte(0)
) : intGte(0) =
(
  case+ !xs of
  | ~stream_vt_nil() => n
  | ~stream_vt_cons(_, xs) => loop(xs, n+1)
) (* end of [loop] *)
//
in
  $effmask_all(loop(xs0, 0))
end // end of [stream_vt_length]

(* ****** ****** *)

implement
{a}(*tmp*)
stream_vt_nth_exn
  (xs, n) =
  loop(xs, n) where
{
//
fun
loop:
$d2ctype
(
  stream_vt_nth_exn<a>
) = lam(xs, n) =>
(
  case+ !xs of
  | ~stream_vt_nil() =>
      $raise StreamSubscriptExn()
  | ~stream_vt_cons(x, xs) =>
      if n = 0 then (~xs; x) else loop(xs, pred(n))
) (* end of [loop] *)
//
} (* end of [stream_vt_nth_exn] *)

implement
{a}(*tmp*)
stream_vt_nth_opt
  (xs, n) =
  loop(xs, n) where
{
//
fun
loop:
$d2ctype
(
  stream_vt_nth_opt<a>
) = lam(xs, n) =>
(
  case+ !xs of
  | ~stream_vt_nil() => None_vt()
  | ~stream_vt_cons(x, xs) =>
      if n = 0 then (~xs; Some_vt(x)) else loop(xs, pred(n))
) (* end of [loop] *)
//
} (* end of [stream_vt_nth_opt] *)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_vt_append
  (xs, ys) =
  auxmain(xs, ys) where
{
//
fun
auxmain:
$d2ctype
(
stream_vt_append<a>
) =
lam(xs, ys) => $ldelay(
//
let
//
val xs_con = !xs
//
in
//
case+ xs_con of
| ~stream_vt_nil() => !ys
| @stream_vt_cons(x, xs) => let
    val () =
    (
      xs := auxmain(xs, ys)
    ) (* end of [val] *)
    prval () = fold@{a}(xs_con) in xs_con
  end // end of [stream_vt_cons]
//
end : stream_vt_con(a) // end-of-let
,
(~(xs); ~(ys))
//
) (* end of [auxmain] *)
//
} (* end of [stream_vt_append] *)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_vt_concat
  (xss) =
  auxmain(xss) where {
//
vtypedef
stream1_vt = stream_vt(a)
vtypedef
stream2_vt = stream_vt(stream1_vt)
//
fun
auxmain
(
  xss: stream2_vt
) : stream1_vt = $ldelay
(
(
  case+ !xss of
  | ~stream_vt_nil
       () => stream_vt_nil()
    // end of [stream_vt_nil]
  | ~stream_vt_cons
       (xs, xss) =>
      !(stream_vt_append<a>(xs, auxmain(xss)))
    // end of [stream_vt_cons]
) : stream_vt_con(a)
,
  ~(xss)
)
//
} (* end of [stream_vt_concat] *)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_vt_foreach
  (xs) = let
//
var env: void = ((*void*))
//
in
  stream_vt_foreach_env<a><void> (xs, env)
end // end of [stream_vt_foreach]

implement
{a}{env}(*tmp*)
stream_vt_foreach_env
  (xs, env) = let
//
fun
loop
(
  xs: stream_vt(a)
, env: &env >> env
) : stream_vt_con(a) = let
//
val xs_con = !xs
//
in
//
case+ xs_con of
| @stream_vt_cons
    (x, xs1) => let
    val test =
    stream_vt_foreach$cont<a>(x, env)
  in
    if test
      then let
        val xs1 = xs1
        val ((*void*)) =
        stream_vt_foreach$fwork<a>(x, env)
        val ((*freed*)) = free@{a}(xs_con)
      in
        loop(xs1, env)
      end else let
        prval((*folded*)) = fold@(xs_con) in xs_con
      end // end of [if]
  end // end of [stream_vt_cons]
| ~stream_vt_nil((*void*)) => stream_vt_nil()
//
end // end of [loop]
//
in
  loop(xs, env)
end // end of [stream_vt_foreach_env]

implement(a,env)
stream_vt_foreach$cont<a><env>(x0, env) = true(*cont*)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_vt_foreach_cloptr
  (xs, fwork) = let
//
fun
loop :
$d2ctype
(
  stream_vt_foreach_cloptr<a>
) =
lam(xs, fwork) => let
  val xs_con = !xs
in
//
case+ xs_con of
| ~stream_vt_nil() =>
    cloptr_free
      ($UN.castvwtp0{cloptr0}(fwork))
    // cloptr_free
| @stream_vt_cons(x, xs) =>
    let val xs = xs in
      fwork(x); free@{a?}(xs_con); loop(xs, fwork)
    end // end of [let]
end // end of [let] // end of [lam]
//
in
  loop(xs, fwork)
end // end of [stream_vt_foreach_cloptr]

(* ****** ****** *)

implement
{a}(*tmp*)
stream_vt_filter
  (xs) = auxmain(xs) where
{
//
fun
auxmain
(
xs: stream_vt(a)
) : stream_vt(a) = $ldelay
(
//
let
  val xs_con = !xs
in
//
case+ xs_con of
| ~stream_vt_nil
    ((*_*)) => stream_vt_nil()
  // end of [stream_vt_nil]
| @stream_vt_cons
    (x, xs1) => let
    val test =
      stream_vt_filter$pred<a>(x)
    // end of [val]
  in
    if test
      then let
        val () =
        xs1 := auxmain(xs1)
      in
        fold@{a}(xs_con); xs_con
      end // end of [then]
      else let
        val xs1 = xs1
      in
        free@{a}(xs_con); !(auxmain(xs1))
      end // end of [else]
    // end of [if]
  end // end of [stream_vt_cons]
//
end : stream_vt_con(a) // end of [let]
//
,
//
~(xs) // called when the stream is freed
//
) (* end of auxmain *)
//
} (* end of [stream_vt_filter] *)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_vt_filter_fun
  (xs, pred) = let
//
implement{a2}
stream_vt_filter$pred(x) = let
//
val p = addr@(x)
val (pf, fpf | p) = $UN.ptr0_vtake{a}(p)
val test = pred(!p)
prval ((*void*)) = fpf (pf)
//
in
  test
end // end of [stream_vt_filter$pred]
//
in
  stream_vt_filter<a>(xs)
end // end of [stream_vt_filter_fun]

(* ****** ****** *)

implement
{a}(*tmp*)
stream_vt_filter_cloptr
(
  xs, pred
) = auxmain(xs, pred) where
{
//
fun
auxmain
(
//
xs: stream_vt(a), pred: (&a) -<cloptr> bool
//
) : stream_vt(a) = $ldelay
(
//
let
  val xs_con = !xs
in
//
case+ xs_con of
| ~stream_vt_nil
    ((*_*)) => let
    val () =
    cloptr_free
      ($UN.castvwtp0{cloptr0}(pred))
    // end of [val]
  in
    stream_vt_nil(*void*)
  end // end of [stream_vt_nil]
| @stream_vt_cons
    (x, xs1) => let
    val test = pred(x)
  in
    if test
      then let
        val () =
        xs1 := auxmain(xs1, pred)
      in
        fold@{a}(xs_con); xs_con
      end // end of [then]
      else let
        val xs1 = xs1
      in
        free@{a}(xs_con); !(auxmain(xs1, pred))
      end // end of [else]
    // end of [if]
  end // end of [stream_vt_cons]
//
end : stream_vt_con(a) // end of [let]
//
,
//
(~xs; cloptr_free($UN.castvwtp0{cloptr0}(pred)))
//
) (* end of auxmain *)
//
} (* end of [stream_vt_filter_cloptr] *)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_vt_filterlin
  (xs) = auxmain(xs) where
{
//
fun
auxmain
(
xs: stream_vt(a)
) : stream_vt(a) = $ldelay
(
//
let
  val xs_con = !xs
in
//
case+ xs_con of
| ~stream_vt_nil
    ((*_*)) => stream_vt_nil()
  // end of [stream_vt_nil]
| @stream_vt_cons
    (x, xs1) => let
    val test =
      stream_vt_filterlin$pred<a>(x)
    // end of [val]
  in
    if test
      then let
        val () =
        xs1 := auxmain(xs1)
      in
        fold@{a}(xs_con); xs_con
      end // end of [then]
      else let
        val () =
          stream_vt_filterlin$clear<a>(x)
        // end of [val]
      in
        let val xs1 = xs1 in free@{a}(xs_con); !(auxmain(xs1)) end
      end // end of [else]
    // end of [if]
  end // end of [stream_vt_cons]
//
end : stream_vt_con(a) // end of [let]
//
,
//
~(xs) // called when the stream is freed
//
) (* end of auxmain *)
//
} (* end of [stream_vt_filterlin] *)

(* ****** ****** *)

implement
{a}{b}(*tmp*)
stream_vt_map(xs) = let
//
fun
auxmain (
//
xs: stream_vt(a)
//
) : stream_vt(b) = $ldelay
(
//
let
  val xs_con = !xs
in
//
case+
xs_con
of // case+
//
| ~stream_vt_nil
    ((*void*)) => stream_vt_nil()
  // end of [stream_vt_nil]
| @stream_vt_cons(x, xs) => let
    val y =
    stream_vt_map$fopr<a><b> (x)
    val xs = xs
    val ((*void*)) = free@ (xs_con)
  in
    stream_vt_cons{b}(y, auxmain(xs))
  end (* end of [stream_vt_con] *)
//
end : stream_vt_con(b)
//
,
//
~(xs) // called when the stream is freed
//
) (* end of [auxmain] *)
//
in
  auxmain(xs)
end // end of [stream_vt_map]

(* ****** ****** *)

implement
{a}{b}(*tmp*)
stream_vt_map_fun
  (xs, fopr) = let
//
implement
{a2}{b2}
stream_vt_map$fopr
  (x) = res where
{
//
prval() = __assert(x) where
{
  extern praxi __assert(x: &a2 >> a2?!): void
}
val (
  pf, fpf | p_x
) = $UN.ptr0_vtake{a}(addr@x)
val res = $UN.castvwtp0{b2}(fopr(!p_x))
prval() = $UN.castview0{void}(@(fpf, pf))
//
} (* end of [stream_vt_map$fopr] *)
//
in
  stream_vt_map<a><b> (xs)
end // end of [stream_vt_map_fun]

(* ****** ****** *)

implement
{a}{b}(*tmp*)
stream_vt_map_cloptr
  (xs, fopr) = let
//
fun
auxmain:
$d2ctype(stream_vt_map_cloptr<a><b>) =
lam(xs, fopr) => $ldelay
(
let
  val xs_con = !xs
in
  case+ xs_con of
  | ~stream_vt_nil
      () => let
    //
      val () =
      cloptr_free
      (
        $UN.castvwtp0{cloptr0}(fopr)
      )
    //
    in
      stream_vt_nil()
    end // end of [stream_vt_nil]
  | @stream_vt_cons
      (x, xs) => let
      val y = fopr(x)
      val xs = xs
      val () = free@{a?}(xs_con)
    in
      stream_vt_cons(y, auxmain(xs, fopr))
    end // end of [stream_vt_cons]
end : stream_vt_con(b)
,
(~xs; cloptr_free($UN.castvwtp0{cloptr0}(fopr)))
) (* end of [auxmain] *)
//
in
  auxmain(xs, fopr)
end // end of [stream_vt_map_cloptr]

(* ****** ****** *)

implement
{a1,a2}{b}
stream_vt_map2
  (xs1, xs2) =
  auxmain(xs1, xs2) where
{
//
fun
auxmain
(
  xs1: stream_vt(a1)
, xs2: stream_vt(a2)
) : stream_vt(b) = $ldelay
(
let
  val xs1_con = !xs1
in
//
case+ xs1_con of
| ~stream_vt_nil
    ((*_*)) => (~(xs2); stream_vt_nil())
  // end of [stream_vt_nil]
| @stream_vt_cons
    (x1, xs1) => let
    val xs2_con = !xs2
  in
    case+ xs2_con of
    | ~stream_vt_nil
        ((*_*)) => let
        val xs1 = xs1
        val () = free@ (xs1_con)
      in
        ~(xs1); stream_vt_nil ()
      end // end of [stream_vt_nil]
    | @stream_vt_cons
        (x2, xs2) => let
        val y =
        stream_vt_map2$fopr<a1,a2><b> (x1, x2)
        val xs1 = xs1
        and xs2 = xs2
        val () = free@ (xs1_con)
        and () = free@ (xs2_con)
      in
        stream_vt_cons{b}
          (y, stream_vt_map2<a1,a2><b> (xs1, xs2))
        // end of [stream_vt_cons]
      end // end of [stream_vt_cons]
  end // end of [stream_vt_cons]
//
end : stream_vt_con(b)
,
//
(~(xs1); ~(xs2))
//
// called when the stream is freed
//
) (* $ldelay] *) // end of [auxmain]
//
} (* end of [stream_vt_map2] *)

(* ****** ****** *)

implement
{a1,a2}{b}
stream_vt_map2_fun
  (xs1, xs2, fopr) = let
//
implement
{a12,a22}{b2}
stream_vt_map2$fopr
  (x1, x2) = res where
{
//
val (
  pf1, fpf1 | p_x1
) = $UN.ptr0_vtake{a1}(addr@x1)
and (
  pf2, fpf2 | p_x2
) = $UN.ptr0_vtake{a2}(addr@x2)
//
val res =
  $UN.castvwtp0{b2}(fopr(!p_x1, !p_x2))
//
prval() = fpf1 (pf1) and () = fpf2 (pf2)
//
} (* end of [stream_vt_map2$fopr] *)
//
in
  stream_vt_map2<a1,a2><b> (xs1, xs2)
end // end of [stream_vt_map2_fun]

(* ****** ****** *)

implement
{a}(*tmp*)
stream_vt_tabulate
(
// argumentless
) = aux (0) where
{
//
fun aux
(
i : intGte(0)
) : stream_vt(a) =
(
  $ldelay(
    stream_vt_cons{a}(stream_vt_tabulate$fopr<a>(i), aux(i+1))
  ) (* $ldelay *)
) (* end of [aux] *)
//
} (* end of [stream_vt_tabulate] *)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_vt_labelize(xs) = let
//
vtypedef ia = @(intGte(0), a)
//
fun
auxmain
(
  i: intGte(0), xs: stream_vt(a)
) : stream_vt(ia) = $ldelay
(
(
case+ !xs of
| ~stream_vt_nil
    () => stream_vt_nil()
  // end of [stream_vt_nil]
| ~stream_vt_cons
    (x, xs) =>
    stream_vt_cons((i, x), auxmain(i+1, xs))
  // end of [stream_vt_cons]
) : stream_vt_con(ia)
,
~(xs) // called when the stream is freed!
) (* end of [auxmain] *)
//
in
  auxmain(0, xs)
end // end of [stream_vt_labelize]

(* ****** ****** *)

implement
{env}{a}
stream_vt_unfold
(
  st0, fopr
) = aux(st0) where
{
//
fun aux
(
  st: env
) : stream_vt(a) = $ldelay
(
let
  var st = st;
  val x0 = fopr(st)
in
  stream_vt_cons{a}(x0, aux(st))
end // end of [aux]
)
//
} (* end of [stream_vt_unfold] *)

implement
{env}{a}
stream_vt_unfold_opt
(
  st0, fopr
) = aux(st0) where
{
//
fun aux
(
  st: env
) : stream_vt(a) = $ldelay
(
let
  var st = st;
  val opt = fopr(st)
in
  case+ opt of
  | ~None_vt() => stream_vt_nil()
  | ~Some_vt(x0) => stream_vt_cons{a}(x0, aux(st))
end : stream_vt_con(a) // end of [aux]
)
//
} (* end of [stream_vt_unfold_opt] *)

(* ****** ****** *)

implement
{x,y}(*tmp*)
cross_stream_vt_list
  (xs0, ys0) = let
//
fun
auxmain
(
  xs: stream_vt(x)
) : stream_vt(@(x, y)) = $ldelay
(
(
case+ !xs of
| ~stream_vt_nil
    () => stream_vt_nil()
| ~stream_vt_cons
    (x, xs) => !(auxmain2(x, xs, ys0))
) : stream_vt_con(@(x, y))
,
(~xs) // called when the stream is freed
) (* end of [auxmain] *)
//
and
auxmain2
(
  x0: x
, xs: stream_vt(x), ys: List(y)
) : stream_vt(@(x, y)) = $ldelay
(
(
case+ ys of
| list_nil() => !(auxmain(xs))
| list_cons(y, ys) =>
    stream_vt_cons((x0, y), auxmain2(x0, xs, ys))
) : stream_vt_con(@(x, y))
,
~(xs) // called when the stream is freed
) (* end of [auxmain2] *)
//
in
  auxmain(xs0)
end // end of [cross_stream_vt_list]

(* ****** ****** *)

implement
{x,y}(*tmp*)
cross_stream_vt_list_vt
  (xs0, ys0) = let
//
val ys0 =
  $UN.castvwtp0{ptr}(ys0)
//
fun
auxmain
(
  xs: stream_vt(x)
) : stream_vt(@(x, y)) = $ldelay
(
(
case+ !xs of
| ~stream_vt_nil
    ((*void*)) => stream_vt_nil()
| ~stream_vt_cons(x, xs) =>
    !(auxmain2(x, xs, $UN.cast{List(y)}(ys0)))
) : stream_vt_con(@(x, y))
,
(~xs; list_vt_free<y>($UN.castvwtp0{List_vt(y)}(ys0)))
) (* end of [auxmain] *)
//
and
auxmain2
(
  x0: x
, xs: stream_vt(x), ys: List(y)
) : stream_vt(@(x, y)) = $ldelay
(
(
case+ ys of
| list_nil() => !(auxmain(xs))
| list_cons(y, ys) =>
    stream_vt_cons((x0, y), auxmain2(x0, xs, ys))
) : stream_vt_con(@(x, y))
,
(~xs; list_vt_free<y>($UN.castvwtp0{List_vt(y)}(ys0)))
) (* end of [auxmain2] *)
//
in
  auxmain(xs0)
end // end of [cross_stream_vt_list_vt]

(* ****** ****** *)
//
implement
{a}(*tmp*)
stream_vt_fprint
  (xs, out, n) = let
//
fun
loop1
(
  xs: stream_vt(a), i: int
) : void = (
//
case+ !xs of
| ~stream_vt_nil() => ()
| ~stream_vt_cons(x, xs) =>
  (
    (if i > 0 then stream_vt_fprint$sep<>(out)); fprint_val<a>(out, x); loop1(xs, i+1)
  ) (* end of [stream_vt_cons] *)
//
) (* end of [loop1] *)
//
fun
loop2
(
  xs: stream_vt(a), i: int
) : void = (
//
if (
i < n
) then (
//
case+ !xs of
| ~stream_vt_nil() => ()
| ~stream_vt_cons(x, xs) =>
  (
    (if i > 0 then stream_vt_fprint$sep<>(out)); fprint_val<a>(out, x); loop2(xs, i+1)
  ) (* end of [stream_vt_cons] *)
//
) else ~(xs) // end of [if]
//
)
(* end of [loop2] *)
//
val () =
  stream_vt_fprint$beg(out)
//
val () =
(
  if n < 0
    then loop1(xs, 0(*i*)) else loop2(xs, 0(*i*))
  // end of [val]
) : void // end of [val]
//
val () =
  stream_vt_fprint$end(out)
//
in
  // nothing
end // end of [stream_vt_fprint]
//
implement
{}(*tmp*)
stream_vt_fprint$beg(out) = fprint_string(out, "(")
implement
{}(*tmp*)
stream_vt_fprint$end(out) = fprint_string(out, ")")
implement
{}(*tmp*)
stream_vt_fprint$sep(out) = fprint_string(out, ", ")
//
(* ****** ****** *)

local
//
datavtype streamer
  (a:vt@ype+) = STREAMER of (stream_vt(a))
//
assume streamer_vtype (a:vt0p) = streamer (a)
//
in (* in-of-local *)

implement
{}(*tmp*)
streamer_vt_make (xs) = STREAMER (xs)

implement
{}(*tmp*)
streamer_vt_free
  (xser) = let val+~STREAMER(xs) = xser in ~xs end
// end of [streamer_free]

implement
{a}(*tmp*)
streamer_vt_eval_exn
  (xser) = let
//
val+@STREAMER(xs) = xser
//
in
//
case+ !xs of
| ~stream_vt_cons
    (x, xs2) =>
  (
    xs := xs2; fold@(xser); x
  ) (* end of [stream_vt_cons] *)
| ~stream_vt_nil
    ((*void*)) => let
    prval () =
     __assert (view@xs) where
    {
      extern
      praxi __assert{l:addr}(!ptr@l >> stream_vt(a)@l): void
    } (* end of [prval] *)
    prval () = fold@(xser)
  in
    $raise StreamSubscriptExn()
  end (* end of [stream_vt_nil] *)
//
end // end of [stream_eval_exn]

end // end of [local]

(* ****** ****** *)

(* end of [stream_vt.dats] *)
