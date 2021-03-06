//
//  Release mutex in error handling code
//
// Target:  Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression l;
@@

mutex_lock(l);
... when != mutex_unlock(l)
    when any
    when strict
(
if (...) { ... when != mutex_unlock(l)
+   mutex_unlock(l);
    return ...;
}
|
mutex_unlock(l);
)