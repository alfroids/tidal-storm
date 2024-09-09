extends CanvasModulate

const MINUTES_PER_DAY = 1440
const INGAME_TO_REAL_MINUTE_DURATION = (2 * PI)/MINUTES_PER_DAY

@export var gradient: GradientTexture1D # Hence we can change color via code
@export var _ingame_speed = 300.0 # Adjust the speed of the cycle 
@export var _start_time = 12.0 # Control when the cycle will start

var time: float = 0.0 # Variable to track the time

func _ready():
	time = _start_time

func _process(delta: float) -> void:
	time += delta * _ingame_speed * INGAME_TO_REAL_MINUTE_DURATION
	var value = (sin(time + 0.5 * PI) + 1.0) / 2.0 
	self.color = gradient.gradient.sample(value) # Color change-CanvasModulate
