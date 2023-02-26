#!/bin/bash

repo_tag=sammyne/arm64-asm-playground:alpha

docker run --rm -it   \
  -v $PWD:/workspace  \
  -w /workspace       \
  $repo_tag bash
  