/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-8-4: 18h:57m
**
*/

/* ATSextcode_beg() */
//
function
patsopt_services_initize
  (key)
{
//
var
source = 
document.getElementById(key+"_source");
var
output = 
document.getElementById(key+"_output");
//
output.rows = source.rows;
output.cols = source.cols;
//
var
source2 = 
document.getElementById(key+"_source2");
source2.style.overflow = "auto";
source2.style.maxWidth = String(source.clientWidth)+"px";
source2.style.maxHeight = String(source.clientHeight)+"px";
//
var
output2 = 
document.getElementById(key+"_output2");
output2.style.overflow = "auto";
output2.style.maxWidth = String(source.clientWidth)+"px";
output2.style.maxHeight = String(source.clientHeight)+"px";
//
} /* end of [patsopt_services_initize] */
//
/* ATSextcode_end() */

/* ATSextcode_beg() */
function
pats2xhtml_toggle_onclick
  (key)
{
//
var toggle =
document.getElementById(key+"_table_tr1").hidden
//
if
(toggle)
{
document.getElementById
  (key+"_table_tr1").hidden = false;
document.getElementById
  (key+"_table_tr2").hidden = (true);
return (0) ; // indicating success
} else {
return pats2xhtml_eval_onclick(key);
} /* end of [if] */
//
} /* end of [pats2xhtml_toggle_onclick] */
/* ATSextcode_end() */

/* ATSextcode_beg() */
function
patsopt_tc_do_reply
  (key, reply)
{
//
var
comparr =
JSON.parse(decodeURIComponent(reply));
//
var comparr0 = comparr[0];
var comparr1 = comparr[1];
//
document.getElementById(key+"_output").value = comparr1;
document.getElementById(key+"_table_tr1").hidden = false;
document.getElementById(key+"_table_tr2").hidden = (true);
//
/*
if(comparr0---0) { alert("Patsopt_tc passed!"); }
*/
if(comparr0 > 0) { alert("Patsopt_tc failed!"); }
//
return comparr0;
} /* patsopt_tc_do_reply */
/* ATSextcode_end() */

/* ATSextcode_beg() */
function
patsopt_cc_do_reply
  (key, reply)
{
//
var
comparr =
JSON.parse(decodeURIComponent(reply));
//
var comparr0 = comparr[0];
var comparr1 = comparr[1];
//
document.getElementById(key+"_output").value = comparr1;
document.getElementById(key+"_table_tr1").hidden = false;
document.getElementById(key+"_table_tr2").hidden = (true);
//
if(comparr0 > 0) { alert("Patsopt_cc failed!"); }
//
return comparr0;
} /* patsopt_cc_do_reply */
/* ATSextcode_end() */

/* ATSextcode_beg() */
function
patsopt_cc2js_do_reply
  (key, reply)
{
//
var
comparr =
JSON.parse(decodeURIComponent(reply));
//
var comparr0 = comparr[0];
var comparr1 = comparr[1];
//
document.getElementById(key+"_output").value = comparr1;
document.getElementById(key+"_table_tr1").hidden = false;
document.getElementById(key+"_table_tr2").hidden = (true);
//
if(comparr0===0) { eval(comparr1); }
if(comparr0 > 0) { alert("Patsopt_cc2js failed!"); }
//
return comparr0;
} /* patsopt_cc2js_do_reply */
/* ATSextcode_end() */

/* ATSextcode_beg() */
function
pats2xhtml_eval_do_reply
  (key, reply)
{
//
var
comparr =
JSON.parse(decodeURIComponent(reply));
var comparr0 = comparr[0];
var comparr1 = comparr[1];
//
if(comparr0===0)
{
//
document.getElementById
  (key+"_source2").textContent = pats_key2source(key);
//
document.getElementById(key+"_output2").innerHTML = comparr1;
//
document.getElementById(key+"_table_tr1").hidden = true;
document.getElementById(key+"_table_tr2").hidden = false;
//
} /* end of [if] */
//
if(comparr0 > 0) {
//
var
output =
document.getElementById(key+"_output");
output.value/*text*/ = "Pats2xhtml failed!\n\n" + comparr1;
//
} /* end of [if] */
//
return comparr0;
} /* pats2xhtml_eval_do_reply */
/* ATSextcode_end() */

function
__patsfun_9__9__1__closurerize(env0, env1)
{
  return [function(cenv) { return __patsfun_9__9__1(cenv[1], cenv[2]); }, env0, env1];
}


function
__patsfun_23__23__1__closurerize(env0, env1)
{
  return [function(cenv) { return __patsfun_23__23__1(cenv[1], cenv[2]); }, env0, env1];
}


function
__patsfun_37__37__1__closurerize(env0, env1)
{
  return [function(cenv) { return __patsfun_37__37__1(cenv[1], cenv[2]); }, env0, env1];
}


function
__patsfun_51__51__1__closurerize(env0, env1)
{
  return [function(cenv) { return __patsfun_51__51__1(cenv[1], cenv[2]); }, env0, env1];
}


function
patsopt_tc_onclick(arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_patsopt_tc_onclick
  atslangweb_service_trigger_patsopt_tcats__3__1(arg0);
  return/*_void*/;
} // end-of-function


function
atslangweb_service_trigger_patsopt_tcats__3__1(arg0)
{
//
// knd = 0
  var tmp7__1
  var tmplab, tmplab_js
//
  // __patsflab_service_trigger_patsopt_tcats
  tmp7__1 = atslangweb_service_trigger_getval__0__1(arg0);
  atslangweb_patsopt_tcats_rpc__8__1(arg0, tmp7__1);
  return/*_void*/;
} // end-of-function


function
atslangweb_service_trigger_getval__0__1(arg0)
{
//
// knd = 0
  var tmpret0__1
  var tmplab, tmplab_js
//
  // __patsflab_service_trigger_getval
  tmpret0__1 = pats_key2source(arg0);
  return tmpret0__1;
} // end-of-function


function
atslangweb_patsopt_tcats_rpc__8__1(env0, arg0)
{
//
// knd = 0
  var tmp12__1
  var tmp17__1
  var tmp20__1
  var tmp21__1
  var tmplab, tmplab_js
//
  // __patsflab_patsopt_tcats_rpc
  tmp12__1 = ats2js_Ajax_XMLHttpRequest_new();
  ats2js_Ajax_XMLHttpRequest_set_onreadystatechange(tmp12__1, __patsfun_9__9__1__closurerize(tmp12__1, env0));
  tmp17__1 = atslangweb_patsopt_tcats_rpc__cname__4__1();
  ats2js_Ajax_XMLHttpRequest_open(tmp12__1, "POST", tmp17__1, true);
  ats2js_Ajax_XMLHttpRequest_setRequestHeader(tmp12__1, "Content-type", "application/x-www-form-urlencoded");
  tmp21__1 = ats2jspre_encodeURIComponent(arg0);
  tmp20__1 = ats2jspre_string_append("mycode=", tmp21__1);
  ats2js_Ajax_XMLHttpRequest_send_1(tmp12__1, tmp20__1);
  return/*_void*/;
} // end-of-function


function
__patsfun_9__9__1(env0, env1)
{
//
// knd = 0
  var tmp15__1
  var tmp16__1
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_9
  tmp15__1 = ats2js_Ajax_XMLHttpRequest_is_ready_okay(env0);
  if(tmp15__1) {
    tmp16__1 = ats2js_Ajax_XMLHttpRequest_get_responseText(env0);
    atslangweb_patsopt_tcats_rpc__reply__5__1(env1, tmp16__1);
  } else {
    // ATSINSmove_void
  } // endif
  return/*_void*/;
} // end-of-function


function
atslangweb_patsopt_tcats_rpc__reply__5__1(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_patsopt_tcats_rpc__reply
  atslangweb_service_trigger_do_reply__2__1(env0, arg0);
  return/*_void*/;
} // end-of-function


function
atslangweb_service_trigger_do_reply__2__1(arg0, arg1)
{
//
// knd = 0
  var tmp3__1
  var tmplab, tmplab_js
//
  // __patsflab_service_trigger_do_reply
  tmp3__1 = patsopt_tc_do_reply(arg0, arg1);
  // ATSINSmove_void
  return/*_void*/;
} // end-of-function


function
atslangweb_patsopt_tcats_rpc__cname__4__1()
{
//
// knd = 0
  var tmpret5__1
  var tmplab, tmplab_js
//
  // __patsflab_patsopt_tcats_rpc__cname
  tmpret5__1 = "http://www.ats-lang.org/SERVER/MYCODE/atslangweb_patsopt_tcats_0_.php";
  return tmpret5__1;
} // end-of-function


function
patsopt_cc_onclick(arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_patsopt_cc_onclick
  atslangweb_service_trigger_patsopt_ccats__17__1(arg0);
  return/*_void*/;
} // end-of-function


function
atslangweb_service_trigger_patsopt_ccats__17__1(arg0)
{
//
// knd = 0
  var tmp43__1
  var tmplab, tmplab_js
//
  // __patsflab_service_trigger_patsopt_ccats
  tmp43__1 = atslangweb_service_trigger_getval__0__2(arg0);
  atslangweb_patsopt_ccats_rpc__22__1(arg0, tmp43__1);
  return/*_void*/;
} // end-of-function


function
atslangweb_service_trigger_getval__0__2(arg0)
{
//
// knd = 0
  var tmpret0__2
  var tmplab, tmplab_js
//
  // __patsflab_service_trigger_getval
  tmpret0__2 = pats_key2source(arg0);
  return tmpret0__2;
} // end-of-function


function
atslangweb_patsopt_ccats_rpc__22__1(env0, arg0)
{
//
// knd = 0
  var tmp48__1
  var tmp53__1
  var tmp56__1
  var tmp57__1
  var tmplab, tmplab_js
//
  // __patsflab_patsopt_ccats_rpc
  tmp48__1 = ats2js_Ajax_XMLHttpRequest_new();
  ats2js_Ajax_XMLHttpRequest_set_onreadystatechange(tmp48__1, __patsfun_23__23__1__closurerize(tmp48__1, env0));
  tmp53__1 = atslangweb_patsopt_ccats_rpc__cname__18__1();
  ats2js_Ajax_XMLHttpRequest_open(tmp48__1, "POST", tmp53__1, true);
  ats2js_Ajax_XMLHttpRequest_setRequestHeader(tmp48__1, "Content-type", "application/x-www-form-urlencoded");
  tmp57__1 = ats2jspre_encodeURIComponent(arg0);
  tmp56__1 = ats2jspre_string_append("mycode=", tmp57__1);
  ats2js_Ajax_XMLHttpRequest_send_1(tmp48__1, tmp56__1);
  return/*_void*/;
} // end-of-function


function
__patsfun_23__23__1(env0, env1)
{
//
// knd = 0
  var tmp51__1
  var tmp52__1
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_23
  tmp51__1 = ats2js_Ajax_XMLHttpRequest_is_ready_okay(env0);
  if(tmp51__1) {
    tmp52__1 = ats2js_Ajax_XMLHttpRequest_get_responseText(env0);
    atslangweb_patsopt_ccats_rpc__reply__19__1(env1, tmp52__1);
  } else {
    // ATSINSmove_void
  } // endif
  return/*_void*/;
} // end-of-function


function
atslangweb_patsopt_ccats_rpc__reply__19__1(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_patsopt_ccats_rpc__reply
  atslangweb_service_trigger_do_reply__16__1(env0, arg0);
  return/*_void*/;
} // end-of-function


function
atslangweb_service_trigger_do_reply__16__1(arg0, arg1)
{
//
// knd = 0
  var tmp39__1
  var tmplab, tmplab_js
//
  // __patsflab_service_trigger_do_reply
  tmp39__1 = patsopt_cc_do_reply(arg0, arg1);
  // ATSINSmove_void
  return/*_void*/;
} // end-of-function


function
atslangweb_patsopt_ccats_rpc__cname__18__1()
{
//
// knd = 0
  var tmpret41__1
  var tmplab, tmplab_js
//
  // __patsflab_patsopt_ccats_rpc__cname
  tmpret41__1 = "http://www.ats-lang.org/SERVER/MYCODE/atslangweb_patsopt_ccats_0_.php";
  return tmpret41__1;
} // end-of-function


function
patsopt_cc2js_onclick(arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_patsopt_cc2js_onclick
  atslangweb_service_trigger_patsopt_cc2js__31__1(arg0);
  return/*_void*/;
} // end-of-function


function
atslangweb_service_trigger_patsopt_cc2js__31__1(arg0)
{
//
// knd = 0
  var tmp79__1
  var tmplab, tmplab_js
//
  // __patsflab_service_trigger_patsopt_cc2js
  tmp79__1 = atslangweb_service_trigger_getval__0__3(arg0);
  atslangweb_patsopt_atscc2js_rpc__36__1(arg0, tmp79__1);
  return/*_void*/;
} // end-of-function


function
atslangweb_service_trigger_getval__0__3(arg0)
{
//
// knd = 0
  var tmpret0__3
  var tmplab, tmplab_js
//
  // __patsflab_service_trigger_getval
  tmpret0__3 = pats_key2source(arg0);
  return tmpret0__3;
} // end-of-function


function
atslangweb_patsopt_atscc2js_rpc__36__1(env0, arg0)
{
//
// knd = 0
  var tmp84__1
  var tmp89__1
  var tmp92__1
  var tmp93__1
  var tmplab, tmplab_js
//
  // __patsflab_patsopt_atscc2js_rpc
  tmp84__1 = ats2js_Ajax_XMLHttpRequest_new();
  ats2js_Ajax_XMLHttpRequest_set_onreadystatechange(tmp84__1, __patsfun_37__37__1__closurerize(tmp84__1, env0));
  tmp89__1 = atslangweb_patsopt_atscc2js_rpc__cname__32__1();
  ats2js_Ajax_XMLHttpRequest_open(tmp84__1, "POST", tmp89__1, true);
  ats2js_Ajax_XMLHttpRequest_setRequestHeader(tmp84__1, "Content-type", "application/x-www-form-urlencoded");
  tmp93__1 = ats2jspre_encodeURIComponent(arg0);
  tmp92__1 = ats2jspre_string_append("mycode=", tmp93__1);
  ats2js_Ajax_XMLHttpRequest_send_1(tmp84__1, tmp92__1);
  return/*_void*/;
} // end-of-function


function
__patsfun_37__37__1(env0, env1)
{
//
// knd = 0
  var tmp87__1
  var tmp88__1
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_37
  tmp87__1 = ats2js_Ajax_XMLHttpRequest_is_ready_okay(env0);
  if(tmp87__1) {
    tmp88__1 = ats2js_Ajax_XMLHttpRequest_get_responseText(env0);
    atslangweb_patsopt_atscc2js_rpc__reply__33__1(env1, tmp88__1);
  } else {
    // ATSINSmove_void
  } // endif
  return/*_void*/;
} // end-of-function


function
atslangweb_patsopt_atscc2js_rpc__reply__33__1(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_patsopt_atscc2js_rpc__reply
  atslangweb_service_trigger_do_reply__30__1(env0, arg0);
  return/*_void*/;
} // end-of-function


function
atslangweb_service_trigger_do_reply__30__1(arg0, arg1)
{
//
// knd = 0
  var tmp75__1
  var tmplab, tmplab_js
//
  // __patsflab_service_trigger_do_reply
  tmp75__1 = patsopt_cc2js_do_reply(arg0, arg1);
  // ATSINSmove_void
  return/*_void*/;
} // end-of-function


function
atslangweb_patsopt_atscc2js_rpc__cname__32__1()
{
//
// knd = 0
  var tmpret77__1
  var tmplab, tmplab_js
//
  // __patsflab_patsopt_atscc2js_rpc__cname
  tmpret77__1 = "http://www.ats-lang.org/SERVER/MYCODE/atslangweb_patsopt_atscc2js_0_.php";
  return tmpret77__1;
} // end-of-function


function
pats2xhtml_eval_onclick(arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_pats2xhtml_eval_onclick
  atslangweb_service_trigger_pats2xhtml_eval__45__1(arg0);
  return/*_void*/;
} // end-of-function


function
atslangweb_service_trigger_pats2xhtml_eval__45__1(arg0)
{
//
// knd = 0
  var tmp115__1
  var tmplab, tmplab_js
//
  // __patsflab_service_trigger_pats2xhtml_eval
  tmp115__1 = atslangweb_service_trigger_getval__0__4(arg0);
  atslangweb_pats2xhtml_eval_rpc__50__1(arg0, 1, tmp115__1);
  return/*_void*/;
} // end-of-function


function
atslangweb_service_trigger_getval__0__4(arg0)
{
//
// knd = 0
  var tmpret0__4
  var tmplab, tmplab_js
//
  // __patsflab_service_trigger_getval
  tmpret0__4 = pats_key2source(arg0);
  return tmpret0__4;
} // end-of-function


function
atslangweb_pats2xhtml_eval_rpc__50__1(env0, arg0, arg1)
{
//
// knd = 0
  var tmp120__1
  var tmp125__1
  var tmp128__1
  var tmp129__1
  var tmp130__1
  var tmp131__1
  var tmp132__1
  var tmp133__1
  var tmplab, tmplab_js
//
  // __patsflab_pats2xhtml_eval_rpc
  tmp120__1 = ats2js_Ajax_XMLHttpRequest_new();
  ats2js_Ajax_XMLHttpRequest_set_onreadystatechange(tmp120__1, __patsfun_51__51__1__closurerize(tmp120__1, env0));
  tmp125__1 = atslangweb_pats2xhtml_eval_rpc__cname__46__1();
  ats2js_Ajax_XMLHttpRequest_open(tmp120__1, "POST", tmp125__1, true);
  ats2js_Ajax_XMLHttpRequest_setRequestHeader(tmp120__1, "Content-type", "application/x-www-form-urlencoded");
  tmp128__1 = ats2jspre_String(arg0);
  tmp132__1 = ats2jspre_string_append("stadyn=", tmp128__1);
  tmp131__1 = ats2jspre_string_append(tmp132__1, "&");
  tmp130__1 = ats2jspre_string_append(tmp131__1, "mycode=");
  tmp133__1 = ats2jspre_encodeURIComponent(arg1);
  tmp129__1 = ats2jspre_string_append(tmp130__1, tmp133__1);
  ats2js_Ajax_XMLHttpRequest_send_1(tmp120__1, tmp129__1);
  return/*_void*/;
} // end-of-function


function
__patsfun_51__51__1(env0, env1)
{
//
// knd = 0
  var tmp123__1
  var tmp124__1
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_51
  tmp123__1 = ats2js_Ajax_XMLHttpRequest_is_ready_okay(env0);
  if(tmp123__1) {
    tmp124__1 = ats2js_Ajax_XMLHttpRequest_get_responseText(env0);
    atslangweb_pats2xhtml_eval_rpc__reply__47__1(env1, tmp124__1);
  } else {
    // ATSINSmove_void
  } // endif
  return/*_void*/;
} // end-of-function


function
atslangweb_pats2xhtml_eval_rpc__reply__47__1(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_pats2xhtml_eval_rpc__reply
  atslangweb_service_trigger_do_reply__44__1(env0, arg0);
  return/*_void*/;
} // end-of-function


function
atslangweb_service_trigger_do_reply__44__1(arg0, arg1)
{
//
// knd = 0
  var tmp111__1
  var tmplab, tmplab_js
//
  // __patsflab_service_trigger_do_reply
  tmp111__1 = pats2xhtml_eval_do_reply(arg0, arg1);
  // ATSINSmove_void
  return/*_void*/;
} // end-of-function


function
atslangweb_pats2xhtml_eval_rpc__cname__46__1()
{
//
// knd = 0
  var tmpret113__1
  var tmplab, tmplab_js
//
  // __patsflab_pats2xhtml_eval_rpc__cname
  tmpret113__1 = "http://www.ats-lang.org/SERVER/MYCODE/atslangweb_pats2xhtml_eval_0_.php";
  return tmpret113__1;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
