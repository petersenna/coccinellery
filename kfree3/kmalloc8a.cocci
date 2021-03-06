//
//  Introduce missing kfree
//
// Target:  Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r exists@
local idexpression x;
expression E;
identifier f,f1,l;
position p1,p2,p3;
@@

x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
<... when != x
     when != if (...) { <+...x...+> }
     when != (x) == NULL
     when != (x) != NULL
     when != (x) == 0
     when != (x) != 0
(
goto@p3 l;
|
x->f1 = E
|
 (x->f1 == NULL || ...)
|
 f(...,x->f1,...)
)
...>
(
 return <+...x...+>;
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
p3 << r.p3;
@@

file = p1[0].file
line1 = p1[0].line
colb1 = p1[0].column
cole1 = p1[0].column_end
line2 = p2[0].line
colb2 = p2[0].column
cole2 = p2[0].column_end
line3 = p3[0].line
colb3 = p3[0].column
cole3 = p3[0].column_end
print "* TODO [[view:%s::face=ovl-face1::linb=%s::colb=%s::cole=%s][ALLOC: %s::%s]]" % (file,line1,colb1,cole1,file,line1)
print "[[view:%s::face=ovl-face2::linb=%s::colb=%s::cole=%s][return with no kfree: %s]]" % (file,line2,colb2,cole2,line2)
print "[[view:%s::face=ovl-face3::linb=%s::colb=%s::cole=%s][via goto: %s]]" % (file,line3,colb3,cole3,line3)
print "in function %s" % (p1[0].current_element)
cocci.include_match(False)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

file = p1[0].file
line1 = p1[0].line
colb1 = p1[0].column
cole1 = p1[0].column_end
line2 = p2[0].line
colb2 = p2[0].column
cole2 = p2[0].column_end
print "* TODO [[view:%s::face=ovl-face1::linb=%s::colb=%s::cole=%s][ALLOC: %s::%s]]" % (file,line1,colb1,cole1,file,line1)
print "[[view:%s::face=ovl-face2::linb=%s::colb=%s::cole=%s][return with no kfree: %s]]" % (file,line2,colb2,cole2,line2)
print "in function %s" % (p1[0].current_element)
