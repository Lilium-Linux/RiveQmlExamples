# RiveQmlExamples

`RiveQmlExamples` is a standalone Qt 6 consumer project for the `RiveQml` module.

## Included examples

- `brightness-control`
- `animated-icons`

## Build

Requirements:

- CMake 3.24+
- Qt 6.8+
- C++20 toolchain
- a sibling checkout of `RiveQML`, or an installed `RiveQml` CMake package

Typical local setup with sibling repositories:

```bash
cmake -S . -B build -G Ninja \
  -DCMAKE_PREFIX_PATH=/path/to/qt

cmake --build build
```

If `RiveQml` is not installed as a package, this project will automatically use a sibling checkout located at `../RiveQML`.

The examples are validated on Linux as well as macOS. On Linux, the sibling `RiveQML` checkout now renders through the Skia raster backend.
