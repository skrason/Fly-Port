shader_type canvas_item;
render_mode unshaded;

uniform float darkness = 1.0;
uniform float mixFactor : hint_range(0.0, 1.0) = 1.0;

void fragment(){
	COLOR = texture(TEXTURE, UV);
	vec3 original = COLOR.rgb;
	vec3 grayscale = vec3(COLOR.r * 0.2126 + COLOR.g * 0.7152 + COLOR.b * 0.0722) / darkness;
	COLOR.rgb = mix(original, grayscale, mixFactor);
}