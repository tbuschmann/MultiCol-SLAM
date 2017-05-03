if [ ! -d indoor_dynamic ]; then
   #get dataset 
   curl http://www2.ipf.kit.edu/%7Epcv2016/downloads/indoor_dynamic.zip > indoor_dynamic.zip && unzip indoor_dynamic
   rm indoor_dynamic.zip
fi

xhost +local:root # docker display permission

docker run -it -e DISPLAY=$DISPLAY \
--device=/dev/dri:/dev/dri \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $(pwd)/indoor_dynamic:/indoor_dynamic \
txaqb/multicol-slam \
./Examples/Lafida/multi_col_slam_lafida ./Examples/small_orb_omni_voc_9_6.yml  ./Examples/Lafida/Slam_Settings_indoor1.yaml ./Examples/Lafida/ /indoor_dynamic

xhost -local:root 
