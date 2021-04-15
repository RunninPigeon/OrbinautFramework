// ================================= //
	/* Screen Palette Shader
			by MicG       */
// ================================= //

	varying vec2 v_vTexcoord;
	varying vec4 v_vColour;
	varying vec2 v_vPosition;

	uniform sampler2D u_dynPalTex;
	uniform vec3 u_dynUvs;
	uniform vec2 u_dynPixelSize;
	uniform float u_palId[16];	// Max colours on the dynamic palette list. Increase if needed

	uniform sampler2D u_wetPalTex;
	uniform vec3 u_wetUvs;
	uniform vec2 u_wetPixelSize;
	uniform float u_water;
	uniform vec3 u_waterCol;
	
	uniform float u_step;
	uniform bool u_mode;
	uniform int u_color;

	vec4 findAltColor(vec4 inCol, vec3 corner, vec2 pixelSize, sampler2D sampler, bool isWater) 
	{
	    vec2 testPos;
	    for (float i = corner.y; i < corner.z; i += pixelSize.y) 
		{
			testPos = vec2(corner.x, i);
			if (distance(texture2D(sampler, testPos), inCol) == 0.) 
			{
				float Index = (isWater == true ? 1. : u_palId[int((i - corner.y) / pixelSize.y)]);
				testPos = vec2(corner.x + pixelSize.x * floor(Index + 1.), i);
				return mix(texture2D(sampler, vec2(testPos.x - pixelSize.x, testPos.y)), texture2D(sampler, testPos), fract(Index));
			}
	    }
	    return inCol;
	}

	float SubA(float Val1, float Val2) // Appear
	{
		return (u_color == 1 ? 
			Val1 + max(Val2 - Val1 - u_step + 252., 0.): 
			Val1 - max(Val2 + Val1 - u_step, 0.));
	}

	float SubD(float Val1, float Val2) // Disappear
	{ 
		float Diff = max(756. - u_step - Val2, 0.);
		return Val1 + Diff * (u_color == 1 ? 1. : -1.);
	}

	float Flsh(float Val1) // Appear
	{
		return max(252. - u_step, Val1);
	}

	void main() 
	{
	
		#region	Change color
		////////////////////
		vec4 col = texture2D(gm_BaseTexture, v_vTexcoord);
		DoAlphaTest(col);
		col = findAltColor(col, u_dynUvs, u_dynPixelSize, u_dynPalTex, false);
		if ((u_water != 0.) && (u_water >= 224. - v_vPosition.y))
		{
			//col.rgb += u_waterCol / 255.;
			//col.rgb = 1. - col.rgb;
			//col.rgb = mix(col.rgb, u_waterCol / 255., 0.5);
			col = findAltColor(col, u_wetUvs, u_wetPixelSize, u_wetPalTex, true);
		}
		#endregion
	
		#region Fade
		////////////
		col.rgb = min(col.rgb * 255., 252.);
		vec3 OutCol;
	
		if (u_color == 2) 
		{
			OutCol = u_mode == true ? 
			vec3(Flsh(col.r), Flsh(col.g), Flsh(col.b)):
			min(col.rgb + max(252. - u_step, 0.), 252.);
		} 
		else 
		{
			OutCol = u_color == 1 ? 
			u_mode == true ? 
				vec3(SubA(col.r, 504. - col.b - col.g), SubA(col.g, 252. - col.b), SubA(col.b, 0.)): 
				vec3(SubD(col.r, 0.), SubD(col.g, 252. - col.r), SubD(col.b, 504. - col.r - col.g)):
			u_mode == true ? 
				vec3(SubA(col.r, col.b + col.g), SubA(col.g, col.b), SubA(col.b, 0.)): 
				vec3(SubD(col.r, 0.), SubD(col.g, col.r), SubD(col.b, col.r + col.g));
		}
		#endregion
	
		// Output
		gl_FragColor = vec4(OutCol / 255., col.a) * v_vColour;
	}