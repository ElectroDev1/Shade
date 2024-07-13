# Shade
 A small wrapper for gamemaker that makes shaders faster to use, especially uniforms and their typical long function names and use of multiple events
<hr>

# Setting up
 Once you have imported the .yymps into your project using Shade is as simple as 3 lines.<br>
```
if(!myShade) myShade = Shade(* shader asset *);
  
myShade.set();
  
  * draw *
   
myShade.reset();
```

This is the same as using shader_set() and then using shader_reset(), nothing much different. The cool part comes with uniforms!

<br>

# Uniforms

Every Shade element stores a list of uniform ids, and you have full control on which are loaded with `loadUniform(* uniform name *)`, 
to apply a value to an uniform, you then use `applyUniform(* uniform name *, * value *, [variable type])`<br>
```
myShade.loadUniform("u_time");

myShade.applyUniform("u_time", current_time, UNIFORMTYPES.f);
```

`loadUniform()` is not necessary since `applyUniform()` will load the uniform id if it wasn't loeaded before, but you can use it if you want.
<br>

 ### UNIFORMTYPES list

  * f             -   float
  * f_array       -   float array
  * i             -   int
  * i_array       -   int array
  * matrix        -   transform matrix
  * matrix_array  -   transform matrix array
  
 <br>
 
 # Samplers
 
  Samplers / textures work the same way as uniforms, but instead use `loadSampler(* sampler name *)` and `applyTexture(* sampler name *, * texture *, * image index *)`<br>
  ```
  myShade.loadSampler("s_grass");
  
  // use the spr_grass sprite on index 1
  myShade.applyTexture("s_grass", spr_grass, 1);
  ```
