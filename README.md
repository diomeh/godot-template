# Godot Project Template

This repository is a Godot 4 template project serving as a baseline for development.
It is intended to give a clean starting point for building a playable game or prototype with a modular structure, consistent project settings, and a straightforward workflow for adding gameplay systems, scenes, tools, and assets.

## Overview

This project is designed as a reusable foundation for new Godot work. It includes a basic game structure, editor tooling, and a layout that is easy to extend as the project grows.

The project organization follows a familiar Godot convention:

- `src/` for gameplay code and scenes
- `assets/` for art, audio, and visual content
- `addons/` for editor enhancements
- `tools/` for project-wide configuration scripts and editor utilities
- `project.godot` as the project entry point

## Credits

This template is inspired by the project structure and conventions used in the Fat Earth Studios tutorial demo repository:

- https://github.com/fat-earth-studios/tutorial-demo-repo

The work here is a reusable baseline for learning and development, and it is not a direct fork of that repository.

## Requirements

Before opening the project, make sure you have:

- Godot 4.7 or newer
- Git
- Optional: Git LFS if your team uses large asset files

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/diomeh/godot-template
   ```

2. Open the project in Godot:
   - Launch Godot
   - Select the project folder
   - Open project

3. Confirm the project loads correctly.
   - The main scene is configured in `project.godot`
   - Engine settings and editor conventions can be applied through the helper script in `tools/editor/apply_project_settings.gd`

4. Start developing.
   - Add game scenes under `src/`
   - Place art and audio under `assets/`
   - Keep reusable systems in `src/core/` and gameplay logic in `src/gameplay/`

## Recommended Workflow

- Keep project settings and editor conventions centralized
- Favor clear folder organization and small, focused scripts
- Use scenes and scripts consistently to avoid tightly-coupled systems
- Add new systems gradually rather than building everything into one root script

## Project Structure

```text
.
├── addons/
├── assets/
├── src/
│   ├── core/
│   ├── debug/
│   ├── gameplay/
│   ├── levels/
│   ├── resources/
│   ├── shaders/
│   └── ui/
├── tools/
├── project.godot
├── default_bus_layout.tres
├── LICENSE
├── README.md
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
└── .gitignore
```

## Contributing

Contributions are welcome. Please review the contribution guidelines in [CONTRIBUTING.md](CONTRIBUTING.md) before submitting changes.

## Code of Conduct

This project follows the Contributor Covenant Code of Conduct. See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for the full policy and the original reference:

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for the full text.

## Notes

This repository is intended as a clean baseline and starting point for development. It can be modified, extended, and adapted to fit your own game idea or team workflow.
