//
//  Use release_mem_region after request_mem_region
//
// Target:  Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression E1,E2,E3;
@@

request_mem_region(E1,E2,E3)
...
?- release_region(E1,E2)
+ release_mem_region(E1,E2)

@@
expression E1,E2,E3;
@@

request_region(E1,E2,E3)
...
?- release_mem_region(E1,E2)
+ release_region(E1,E2)
