
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class Model3dWidget extends StatelessWidget {

  final Flutter3DController controller = Flutter3DController();

  Model3dWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.sizeOf(context);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center, // 中心位置
              radius: 1.0, // 渐变的范围
              colors: [
                Colors.grey, // 渐变开始颜色：灰色
                Colors.black, // 渐变结束颜色：黑色
              ],
              stops: [0.0, 1.0], // 渐变起始和结束的比例
            ),
          ),
          child: Center(
            child: //The 3D viewer widget for glb and gltf format
            Flutter3DViewer(
              //If you pass 'true' the flutter_3d_controller will add gesture interceptor layer
              //to prevent gesture recognizers from malfunctioning on iOS and some Android devices.
              //the default value is true
              activeGestureInterceptor: true,
              //If you don't pass progressBarColor, the color of defaultLoadingProgressBar will be grey.
              //You can set your custom color or use [Colors.transparent] for hiding loadingProgressBar.
              progressBarColor: Colors.orange,
              //You can disable viewer touch response by setting 'enableTouch' to 'false'
              enableTouch: true,
              //This callBack will return the loading progress value between 0 and 1.0
              onProgress: (double progressValue) {
                debugPrint('model loading progress : $progressValue');
              },
              //This callBack will call after model loaded successfully and will return model address
              onLoad: (String modelAddress) {
                debugPrint('model loaded : $modelAddress');
                // controller.setCameraOrbit(5, 15, 30);
              },
              //this callBack will call when model failed to load and will return failure error
              onError: (String error) {
                debugPrint('model failed to load : $error');
              },
              //You can have full control of 3d model animations, textures and camera
              controller: controller,
              src: 'assets/3d/model.gltf', //3D model with different animations
              //src: 'assets/sheen_chair.glb', //3D model with different textures
              //src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb', // 3D model from URL
            ),
          ),
        ),
      ),
    );
  }
}