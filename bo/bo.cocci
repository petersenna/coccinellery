//
//  use BUG_ON
//
// Target:  Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
identifier x;
@@

-if (x) BUG();
+BUG_ON(x);

@@
identifier x;
@@

-if (!x) BUG();
+BUG_ON(!x);

