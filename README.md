# gba-dev

A hermetic GBA development environment in Docker. No local toolchain install needed — everything runs inside the container.

## What's inside

- [devkitPro](https://devkitpro.org/) devkitARM toolchain
- `gba-dev` package set (libtonc, libgba, etc.)
- `clangd` for IDE intellisense
- zsh + oh-my-zsh (eastwood theme, autosuggestions, syntax highlighting)

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

## Build the image

```sh
docker build -t gba-dev .
```

## Day-to-day dev (VS Code dev container)

Copy `.devcontainer/devcontainer.json` from this repo into the root of your GBA project:

```sh
cp /path/to/gba-dev/.devcontainer/devcontainer.json your-project/.devcontainer/devcontainer.json
```

Then open your project in VS Code and select **Reopen in Container** when prompted. You'll get:

- Full devkitARM toolchain in the container
- clangd intellisense via the [clangd extension](https://marketplace.visualstudio.com/items?itemName=llvm-vs-code-extensions.vscode-clangd)

> The dev container uses the local `gba-dev` image, so build it first.

## Headless / CI builds

Use `build.sh` to run `make` inside the container against any project directory:

```sh
./build.sh [path/to/project]
```

If no path is given, it defaults to the current directory. The script mounts the project into the container and runs `make`, then exits cleanly.
