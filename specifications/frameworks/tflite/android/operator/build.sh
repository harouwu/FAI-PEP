#!/bin/sh

# the configure must be run once beforehand
pushd `pwd`
cd "$1"

# build benchmark binary
# assuming the configure has set up the NDK and SDK correctly
bazel build -c opt \
  --config=android_arm \
  --cxxopt='--std=c++11' \
  --copt=-DTFLITE_PROFILING_ENABLED \
  tensorflow/contrib/lite/tools/benchmark:benchmark_model

popd

cp "$1/bazel-bin/tensorflow/contrib/lite/tools/benchmark/benchmark_model" "$2"
