extends CanvasLayer

var	last_distance	: int
var	timeout			: int = 0

func	setDistance(distance : int):
	if timeout > 300:
		$Label.text = str("stoped")
		return
	if last_distance == distance:
		timeout += 1
	else:
		timeout = 0
	last_distance = distance
	$Label.text = str(distance ,"m")
