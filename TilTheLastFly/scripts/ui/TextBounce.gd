tool
extends RichTextEffect
class_name RichTextBounce


var bbcode = "bounce"

const SPLITTERS = [ord(" "), ord("."), ord(",")]

var _char = 0
var _last = 999

func _process_custom_fx(char_fx):
	if char_fx.absolute_index < _last or char_fx.character in SPLITTERS:
		_char = char_fx.absolute_index
		
	_last = char_fx.absolute_index
	
	var speed = char_fx.env.get("speed", 6.0)
	var strength = char_fx.env.get("strength", 6.0)
	
	var t = abs(sin(char_fx.elapsed_time * speed + _char * PI * 0.025)) * strength
	var angle = deg2rad(char_fx.env.get("angle", 0))
	char_fx.offset.x += sin(angle) * t
	char_fx.offset.y += cos(angle) * t
	
	return true
