class_name TestLevelAssetFree
extends BaseLevel
## Asset-free prototype level used to verify the project foundation.

@onready var player_spawn_marker: Marker2D = $Entities/PlayerSpawn
@onready var player_camera: Camera2D = $Entities/PlayerCamera


func get_default_player_spawn() -> Vector2:
	return player_spawn_marker.global_position


func get_player_camera() -> Camera2D:
	return player_camera
