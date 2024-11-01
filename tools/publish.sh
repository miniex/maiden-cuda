#!/bin/bash

crates=(
    maidenx_cpu_core
    maidenx_cuda_core
    maidenx_macro_utils

    maidenx_core
    maidenx_cuda_kernels

    maidenx_tensor
    
    maidenx_nn/macros
    maidenx_nn

    maidenx_math

    maidenx_internal
)

if [ -n "$(git status --porcelain)" ]; then
    echo "You have local changes!"
    exit 1
fi

pushd crates

for crate in "${crates[@]}"
do
  echo "Publishing ${crate}"
  cp ../LICENSE-MIT "$crate"
  cp ../LICENSE-APACHE "$crate"
  pushd "$crate"
  git add LICENSE-MIT LICENSE-APACHE
  cargo publish --no-verify --allow-dirty
  popd
  sleep 20
done

popd

echo "Publishing root crate"
cargo publish --allow-dirty

echo "Cleaning local state"
git reset HEAD --hard
