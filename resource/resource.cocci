//
//  Convert release_resource to release_region/release_mem_region
//
// Target:  Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression x,E;
@@

(
*x = request_region(...)
|
*x = request_mem_region(...)
)
... when != release_region(x)
    when != release_mem_region(x)
    when != x = E
* release_resource(x);
