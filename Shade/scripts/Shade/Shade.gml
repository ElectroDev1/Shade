#macro __NO_SHADER "NO SHADE"

globalvar __currentShade;
__currentShade = __NO_SHADER;

//Uniform types
enum UNIFORMTYPES {
	f,
	f_array,
	i,
	i_array,
	matrix,
	matrix_array
}

function __Shade_trace(msg){
	show_debug_message("SHADE - '"+name+"' - "+msg)	
}

function __buildShade(shd) constructor {
	
	//Info
	shader = shd;
	name = shader_get_name(shd);
	unis = { };
	samplers = { };
	
	__Shade_trace("Built");
	
	//Scripts--------------------------
	
	//Set and reset
	static set = function(){
		shader_set(shader);	
		__currentShade = name;
	}
	
	static reset = function(){
		shader_reset();	
		__currentShade = __NO_SHADER;
	}
	
	//Uniforms
	static loadUniform = function(uni_name){
		__Shade_trace("Loading uniform of name '"+uni_name+"'")
		unis[$ uni_name] = shader_get_uniform(shader,uni_name);
	}
	
	static applyUniform = function(uni_name,value,type=UNIFORMTYPES.f){
		
		if(__currentShade != name){ return -1; }
		
		if(!variable_struct_exists(unis,uni_name)){ loadUniform(uni_name); }
		
		var _uni = unis[$ uni_name];
		
		switch(type){
		
			case UNIFORMTYPES.f:			shader_set_uniform_f(_uni, value); break;
			case UNIFORMTYPES.f_array:		shader_set_uniform_f_array(_uni, value); break;
			case UNIFORMTYPES.i:			shader_set_uniform_i(_uni, value); break;
			case UNIFORMTYPES.i_array:		shader_set_uniform_i_array(_uni, value); break;
			case UNIFORMTYPES.matrix:		shader_set_uniform_matrix(_uni); break;
			case UNIFORMTYPES.matrix_array: shader_set_uniform_matrix_array(_uni, value); break;
			
		}
			
	}
	
	//Texture sampling
	static loadSampler = function(sampler_name){
		
		__Shade_trace("Loading sampler index of name '"+sampler_name+"'");
		samplers[$ sampler_name] = shader_get_sampler_index(shader, sampler_name);
	}
	
	static applyTexture = function(sampler_name,texture,subimg=0){
		
		if(__currentShade != name){ return -1; }
		
		if(!variable_struct_exists(samplers,sampler_name)){ loadSampler(sampler_name); }
		
		texture_set_stage(samplers[$ sampler_name], sprite_get_texture(texture, subimg));
		
	}
	
}

function Shade(shader) {
	
	var shname = shader_get_name(shader);
	
	if(asset_get_index(shname) != shader){
		return false;	
	}

	return new __buildShade(shader);

}