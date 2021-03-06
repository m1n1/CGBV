//
// Fragment Shader f�r den morphologischen Operator 
// Dilatation
// Angepasst f�r Core Profile
// ---------------------------------
//
// @author: Prof. Dr. Alfred Nischwitz
// @lecturer: Prof. Dr. Alfred Nischwitz
//
// (c)2011 Hochschule M�nchen, HM
//
// ---------------------------------
#version 400


smooth in vec2 texCoords;			// pixelbezogene Texturkoordinate
out vec4 fragColor;					// Ausgabewert mit 4 Komponenten zwischen 0.0 und 1.0
uniform samplerRect textureMap;		// Sampler f�r die Texture Map
uniform vec4 param1;				// param1.x +=F5, -=F6, param1.y +=F7, -=F8, param1.z +=F9, -=F10, param1.w +=F11, -=F12

void main() {
	vec4 maxValue = vec4(0,0,0,1);
	float size = abs(param1.z) + 1;
	
	for(float x = -size; x < size; x++) {
		for(float y = -size; y < size; y++) {
			vec4 color = texture(textureMap, texCoords + vec2(x,y));
			maxValue = max(color, maxValue);
		}
	}

    fragColor =	maxValue;
}