#!/bin/bash
BASEDIR=$PWD
PREFIX=${BASEDIR}/llama_cpp_install

module load cmake


cd llama.cpp
echo "Building llama.cpp"
mkdir -p build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DLLAMA_RPC=ON ..
make -j 8 VERBOSE=1
make install
export LD_LIBRARY_PATH=$PREFIX/lib64:$LD_LIBRARY_PATH
cd $BASEDIR/llama.cpp
cd examples/rpc
rm -rf build
mkdir -p build && cd build 
export LDFLAGS=$(echo -L${PREFIX}/lib64)
export INC=$(echo -I${PREFIX}/include)
cmake -DCMAKE_CXX_FLAGS=${INC} \
-DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS} -lggml-rpc -lggml-cpu -lggml-base" \
-DCMAKE_INSTALL_PREFIX=$PREFIX ..
make -j 1 VERBOSE=1
cp rpc-server $PREFIX/bin

cd $BASEDIR