# STM32 F446 Test Project

## Build Environment
This project uses a containerized build system to ensure consistency across environments.

### Prerequisites
- **Docker Desktop** (Windows/Mac) or Docker Engine (Linux).
- **Git** (to clone the repository).

### Required Files for Distribution
To build the project, teammates need the source code and the following scripts located in the root directory:
- `build_headless.bat`: The main build wrapper script.
- `post_build.sh`: Helper script used inside the container for binary generation.

### Project Initialization
1. Create a new STM32 project using **STM32CubeMX**.
2. copy `build_headless.bat` and `post_build.sh` to project folder.
3. Configure the project settings as needed and generate the code.

### How to Build
1. Open a terminal in the project root.
2. Run the build script:
   ```cmd
   .\build_headless.bat
   ```
   **Note**: On the first run, this will automatically pull the Docker image `paniti/stm32-builder:v1.0` from Docker Hub.

### IDE Setup (VS Code)
A `.vscode/tasks.json` file is configured for this project.
- Open the folder in VS Code.
- Press `Ctrl+Shift+B` to trigger the build.

### Docker Image
The build environment uses the image `paniti/stm32-builder:v1.0`. The `Dockerfile` is included in the repo for reference but is not required to run the build.
- **STM32CubeIDE Version**: 2.0.0
