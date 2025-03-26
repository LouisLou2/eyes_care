//
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoBackgroundPage extends StatefulWidget {
//   const VideoBackgroundPage({super.key});
//
//   @override
//   State<VideoBackgroundPage> createState() => _VideoBackgroundPageState();
// }
//
// class _VideoBackgroundPageState extends State<VideoBackgroundPage> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//   bool _showTitle = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset('assets/vid/223.mp4') // 这里替换为你的视频路径
//       ..setLooping(true)  // 设置视频循环播放
//       ..setVolume(0)      // 设置音量为 0，确保只有视频显示
//       ..initialize().then((_) {
//         // 初始化完成后开始播放
//         setState(() {
//           _controller.play(); // 自动播放
//         });
//       });
//
//     _initializeVideoPlayerFuture = _controller.initialize();
//
//     // 监听视频播放进度
//     _controller.addListener(() {
//       if (_controller.value.position.inSeconds >= 1 && !_showTitle) {
//         setState(() {
//           _showTitle = true;  // 1.5秒时显示标题
//         });
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();  // 确保资源被释放
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // 获取屏幕宽度和高度
//     return Scaffold(
//       body: Stack(
//         children: [
//           // 使用 FutureBuilder 来确保视频初始化完成后才显示
//           FutureBuilder(
//             future: _initializeVideoPlayerFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return GestureDetector(
//                   onTap: () {
//                     // 控制视频的播放和暂停
//                     if (_controller.value.isPlaying) {
//                       _controller.pause();
//                     } else {
//                       _controller.play();
//                     }
//                   },
//                   child: SizedBox.expand(
//                     child: FittedBox(
//                       fit: BoxFit.cover,
//                       child: SizedBox(
//                         width: _controller.value.size.width ?? 0,
//                         height: _controller.value.size.height ?? 0,
//                         child: VideoPlayer(_controller),
//                       ),
//                     ),
//                   ),
//                 );
//               } else {
//                 return Center(child: CircularProgressIndicator());  // 等待加载时显示进度条
//               }
//             },
//           ),
//           // 视频播放后 1.5 秒显示网页标题
//           // if (_showTitle)
//           //   Positioned(
//           //     top: 20,
//           //     left: 20,
//           //     child: Text(
//           //       '我的网页标题',  // 你的网站标题
//           //       style: TextStyle(
//           //         color: Colors.white,
//           //         fontSize: 32,
//           //         fontWeight: FontWeight.bold,
//           //         shadows: [
//           //           Shadow(offset: Offset(2, 2), blurRadius: 10, color: Colors.black),  // 添加阴影效果
//           //         ],
//           //       ),
//           //     ),
//           //   ),
//         ],
//       ),
//     );
//   }
// }

import 'package:animate_do/animate_do.dart';
import 'package:eyescare/features/main_page/page/menu_sub_page.dart';
import 'package:eyescare/features/main_page/page/model3d_page.dart';
import 'package:eyescare/features/main_page/page/specialty_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBackgroundPage extends StatefulWidget {
  const VideoBackgroundPage({super.key});

  @override
  State<VideoBackgroundPage> createState() => _VideoBackgroundPageState();
}

class _VideoBackgroundPageState extends State<VideoBackgroundPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/vid/223_1.mp4') // 这里替换为你的视频路径
      ..setLooping(true)  // 设置视频循环播放
      ..setVolume(0)      // 设置音量为 0，确保只有视频显示
      ..initialize().then((_) {
        _controller.play(); // 自动播放
      });

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();  // 确保资源被释放
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕宽度和高度
    return ListView.builder(
      itemCount: 2,
      // itemExtent: MediaQuery.of(context).size.height,
      itemBuilder: (context, index) {
        if (index == 0){
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width, maxHeight: 1000),
            child: MenuSubPage(),
          );
        }
        if (index == 1){
          return SpecialtyPage();
        }
        return null;
      },
    );
  }
}
