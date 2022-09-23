

//Base reference
draw_sprite_stretched(Sprite1,0,50,50,450,450);



//Build shader
if(!myShader){myShader = Shade(shd_test);}

//Set shader
myShader.set();

	//Apply uniforms
	myShader.applyUni( "testcolor", 
						[ 0.9, 0.75, 0.1, 0.5 ] 
						,UniTypes.f_array 
	);
					
	myShader.applyUni( "testpos", 
						[300,20], 
						UniTypes.f_array 
	);


	draw_sprite_stretched(Sprite1,0,50,50,450,450);

myShader.reset();