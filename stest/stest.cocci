//
//  Put NULL test before dereference
//
// Target:  Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r@
expression E1,E2;
identifier fld;
statement S1,S2;
@@

E1 = E2->fld;
(
if (E1 == NULL) S1 else S2
|
*if (E2 == NULL) S1 else S2
)
