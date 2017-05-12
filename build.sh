echo "Configuring and building MultiCol-SLAM ..."
#cd ../../../
echo $(pwd)
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j 4
