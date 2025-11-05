## Repository Setup

### Prerequisites

- Git and Bash (Git Bash on Windows is fine)
- Flutter via FVM
- uv (Python package/devenv manager)

Install if needed:

- FVM: https://fvm.app/documentation/getting-started/installation
- uv: https://docs.astral.sh/uv/getting-started/installation/

### 1) Bootstrap

From the repo root, run the bootstrap helper script:

```bash
./bootstrap.sh
```

After you run the bootstrap and restart VS Code, the IDE automatically uses the pinned Flutter/Dart from FVM and the Python virtualenv managed by uv.

- Inside the VS Code terminal, just run plain commands:

  - `flutter ...`, `dart ...` (no `fvm` prefix needed)
  - `python ...` (no `uv run` needed)

- Outside VS Code (or if PATH/env differs):
  - Use `fvm flutter ...` / `fvm dart ...` to ensure the pinned SDK.
  - Activate the venv or use `uv run python ...` for Python.

### 2) Get Flutter dependencies

```bash
cd app
flutter pub get
```

### 3) Run codegen (recommended during development)

Use the VS Code task "build_runner_watch" or run:

```bash
cd app
dart run build_runner watch --delete-conflicting-outputs
```

### 4) Launch the app

In another terminal:

```bash
cd app
flutter run
```

## Helper folder `scripts/`

Contains utility scripts that automate local dev tasks and CI/CD workflows.

### Scripting conventions

- You must write scripts in Bash and/or Python.
- Run from repo root unless the script says otherwise.
- Scripts should be designed to be safe to re-run.
