
//Build shader
if(!myShader){myShader = Shade(shd_test);}

//Base reference
draw_sprite_stretched(Sprite1,0,50,50,450,450);


//Set shader
myShader.set();

//Apply uniforms
myShader.applyUni( "testcolor", 
					[0.9,0.75,(current_time*0.001)%2,0.5+sin(current_time*0.005)*0.2] 
					,UniTypes.f_array );
					
myShader.applyUni( "testpos", [300,20], UniTypes.f_array );


	draw_sprite_stretched(Sprite1,0,50,50,450,450);

myShader.reset();