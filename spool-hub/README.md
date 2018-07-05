####Design Intent

I was looking for a spool hub that could fit different size spools while, other than e.g. stepped hubs, maintaining the same width of the spool when mounted. I also wanted it to lock reliably into the spool, print quickly and with little material.
As this thing was constructed in [openSCAD](http://www.openscad.org/documentation.html) you can adapt it to your requirements in [Customizer](https://www.thingiverse.com/apps/customizer/run?thing_id=2334107).

The clamp in the picture is this one: https://www.thingiverse.com/thing:2356396.

#### Customizing

If you adapt the hub to your spool sizes make the diameter bigger than the maximum hole size you want it to fit. As a rule of thumb about 5-10% plus. This guarantees that the springs have enough tension to lock it in.

#### Learnings

- The design shows that even PLA can be used to create quite robust springs as long as they are long, relatively thin and printed with perimeters only.
- It was quite a trigonometry challenge to calculate the position of the root fillet in the back of the vane :-).



####FAQ - What does "customizable" mean?

Customizable means that you can modify the model by changing the parameters that define it. In case of this thing you can modify for example its main diameter the diameter of its center bore and much more just by changing the respective numbers in the Customizer App.
The beautiful thing with parametric models is that you can adapt something to your needs without understanding the underlying design principles. Give it a try by clicking ["Open in Customizer"](https://www.thingiverse.com/apps/customizer/run?thing_id=2334107).


The design prints well with rigid PLA. Actually I found PLA optimal for this. PETG is to malleable.

Make sure to slice the vanes as 100% perimeters/walls if they have infill / top / bottom layers they are not flexible. By default they are 4x extrusion width wide so the correct setting would be 2 perimeters/walls.

I print without part cooling for optimal layer adhesion and to have a somewhat malleable part for pressing in the bearing.

If you print a type of this thing with a bearing. Press in the bearing right after the print finishes and it is still slightly soft.

Happy Printing.