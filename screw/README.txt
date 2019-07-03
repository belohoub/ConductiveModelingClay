                   .:                     :,                                          
,:::::::: ::`      :::                   :::                                          
,:::::::: ::`      :::                   :::                                          
.,,:::,,, ::`.:,   ... .. .:,     .:. ..`... ..`   ..   .:,    .. ::  .::,     .:,`   
   ,::    :::::::  ::, :::::::  `:::::::.,:: :::  ::: .::::::  ::::: ::::::  .::::::  
   ,::    :::::::: ::, :::::::: ::::::::.,:: :::  ::: :::,:::, ::::: ::::::, :::::::: 
   ,::    :::  ::: ::, :::  :::`::.  :::.,::  ::,`::`:::   ::: :::  `::,`   :::   ::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  :::::: ::::::::: ::`   :::::: ::::::::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  .::::: ::::::::: ::`    ::::::::::::::: 
   ,::    ::.  ::: ::, ::`  ::: ::: `:::.,::   ::::  :::`  ,,, ::`  .::  :::.::.  ,,, 
   ,::    ::.  ::: ::, ::`  ::: ::::::::.,::   ::::   :::::::` ::`   ::::::: :::::::. 
   ,::    ::.  ::: ::, ::`  :::  :::::::`,::    ::.    :::::`  ::`   ::::::   :::::.  
                                ::,  ,::                               ``             
                                ::::::::                                              
                                 ::::::                                               
                                  `,,`


http://www.thingiverse.com/thing:1731893
OpenSCAD Screw Holes by carloverse is licensed under the Creative Commons - Attribution license.
http://creativecommons.org/licenses/by/3.0/

# Summary

WARNING: I have no 3D printer - this module still needs tuning based upon experiments.
Any help with this will be appreciated.

This provides a module to drill holes for screws.

Usage:

<PRE>
include &lt;screw_holes.scad&gt;
 
difference()
{
  solid_object();
  // Drill a hole for a DIN965 M3 screw of length 20 mm,
  // with 10 mm thread.
  screw_hole(DIN965, M3, 20, 10);

  // Drill a M4 hole through the 30 mm thick object, with a countersunk
  // head with a 90 degree angle that is 8 mm wide at the top and 4 mm
  // high.
  translate([-10, 10, 0])
    screw_hole([8, 4, 90], M4, 30);
}
</PRE>

The top of the head of the screw will be in the xy-plane, with the screw extending into the positive z direction.

Note that angles larger than 90 degrees might only be printable if the
top of the screw is at the top, or you'd need support while printing it,
in which case you might as well drill the hole afterwards.

The following global variables can optionally be changed after the include:

<pre><code>screw_hole_fn = 32;                      // Number of segments for a full circle.
screw_hole_length_extend = 0.1;          // Extra length of the non-threaded part of the screw extends.
screw_hole_height_extend = 0.1;          // Extra distance the hole extends above the surface.
screw_hole_cylinderhead_spacing = 0.1;   // Extra radius of hole around screw head.
screw_hole_countersunk_delta = 0.2;      // Extra depth of countersunk screw hole.
</code></pre>

The following standards are currently understood:

DIN912, DIN963, DIN965, DIN34811, ISO4762, ISO2009, ISO7046, ISO14581 and ISO10642.
