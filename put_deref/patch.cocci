//
//  Move of_node_put
//
// Target:  Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r exists@
expression n,E;
identifier fld;
iterator I;
statement S;
@@

* of_node_put(n)
... when != n = E
    when != I(n,...) S
* n->fld
