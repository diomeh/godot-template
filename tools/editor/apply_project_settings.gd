@tool
extends EditorScript

## Applies the baseline project settings used by this project.
const PROJECT_SETTINGS : Dictionary = {
	"display/window/size/viewport_width": 640,
	"display/window/size/viewport_height": 360,
	"display/window/stretch/mode": "canvas_items",
	"display/window/stretch/aspect": "keep",
	"display/window/stretch/scale_mode": "integer",
	"application/config/version": "0.1.0",
	"display/window/size/window_width_override": 1280,
	"display/window/size/window_height_override": 720,
	"rendering/viewport/hdr_2d": true,
	"rendering/textures/canvas_textures/default_texture_filter": Viewport.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_NEAREST
}

const PHYSICS_2D_LAYERS : Dictionary = {
	1: "World",
	2: "Player",
	3: "Enemy",
	4: "Interactable",
}

const RENDER_2D_LAYERS : Dictionary = {
	1: "World",
	2: "Sky Glow",
	3: "Ember Glow",
}

const EDITOR_LAYOUT_SOURCE_PATH : String = "res://tools/editor/editor_layout.cfg"
const EDITOR_LAYOUT_DIRECTORY_PATH : String = "res://.godot/editor"
const EDITOR_LAYOUT_TARGET_PATH : String = "res://.godot/editor/editor_layout.cfg"

const DIRECTORIES : Array[String] = [
	"res://addons",
	"res://assets",
	"res://assets/art",
	"res://assets/art/characters",
	"res://assets/art/characters/enemies",
	"res://assets/art/characters/npcs",
	"res://assets/art/characters/player",
	"res://assets/art/ui",
	"res://assets/art/ui/fonts",
	"res://assets/art/ui/icons",
	"res://assets/art/ui/splash_screen",
	"res://assets/art/world",
	"res://assets/art/world/backgrounds",
	"res://assets/art/world/props",
	"res://assets/art/world/tilesets",
	"res://assets/audio",
	"res://assets/audio/music",
	"res://assets/audio/sfx",
	"res://src",
	"res://src/core",
	"res://src/core/autoload",
	"res://src/core/main_game",
	"res://src/core/debug",
	"res://src/gameplay",
	"res://src/gameplay/camera",
	"res://src/gameplay/enemies",
	"res://src/gameplay/interactables",
	"res://src/gameplay/player",
	"res://src/levels",
	"res://src/resources",
	"res://src/resources/enemy_definitions",
	"res://src/resources/item_definitions",
	"res://src/shaders",
	"res://src/ui",
]


func _run() -> void:
	_apply_project_settings()
	_apply_layer_names()
	_ensure_directories()
	_apply_editor_layout()

	var error : Error = ProjectSettings.save()

	if error == OK:
		print("Project setup settings saved.")
	else:
		push_error("Project settings could not be saved. Error: " + str(error))


func _apply_project_settings() -> void:
	for setting_path: String in PROJECT_SETTINGS:
		ProjectSettings.set_setting(setting_path, PROJECT_SETTINGS[setting_path])


func _apply_layer_names() -> void:
	for layer_number: int in PHYSICS_2D_LAYERS:
		ProjectSettings.set_setting(
			"layer_names/2d_physics/layer_%d" % layer_number,
			PHYSICS_2D_LAYERS[layer_number]
		)

	for layer_number: int in RENDER_2D_LAYERS:
		ProjectSettings.set_setting(
			"layer_names/2d_render/layer_%d" % layer_number,
			RENDER_2D_LAYERS[layer_number]
		)


func _ensure_directories() -> void:
	for directory_path: String in DIRECTORIES:
		var error : Error = DirAccess.make_dir_recursive_absolute(directory_path)

		if error != OK and error != ERR_ALREADY_EXISTS:
			push_error("Could not create directory %s. Error: %s" % [directory_path, str(error)])


func _apply_editor_layout() -> void:
	var source_file: FileAccess = FileAccess.open(EDITOR_LAYOUT_SOURCE_PATH, FileAccess.READ)

	if source_file == null:
		push_error("Could not read editor layout %s. Error: %s" % [EDITOR_LAYOUT_SOURCE_PATH, str(FileAccess.get_open_error())])
		return

	var layout_contents: String = source_file.get_as_text()
	var layout_directory_path: String = ProjectSettings.globalize_path(EDITOR_LAYOUT_DIRECTORY_PATH)
	var directory_error: Error = DirAccess.make_dir_recursive_absolute(layout_directory_path)

	if directory_error != OK and directory_error != ERR_ALREADY_EXISTS:
		push_error("Could not create editor layout directory. Error: " + str(directory_error))
		return

	var target_file: FileAccess = FileAccess.open(
		ProjectSettings.globalize_path(EDITOR_LAYOUT_TARGET_PATH),
		FileAccess.WRITE
	)

	if target_file == null:
		push_error("Could not save editor layout. Error: " + str(FileAccess.get_open_error()))
		return

	target_file.store_string(layout_contents)
	print("Editor layout applied. Restart Godot to load it.")
