//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 testcolor;

void main()
{
		
	gl_FragColor = ( vec4(testcolor) * texture2D(gm_BaseTexture,v_vTexcoord) );	

}
