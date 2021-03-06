//
//  Drop if around WARN_ON
//
// Target:  Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression e;
@@

(
if(<+...e(...)...+>) WARN_ON(1);
|
- if (e) WARN_ON(1);
+ WARN_ON(e);
)

@@
expression e;
@@

(
if(<+...e(...)...+>) WARN_ON_ONCE(1);
|
- if (e) WARN_ON_ONCE(1);
+ WARN_ON_ONCE(e);
)