import 'package:eyescare/features/main_page/page/menu_sub_page.dart';
import 'package:eyescare/features/main_page/page/specialty_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBackgroundPage extends StatefulWidget {
  const VideoBackgroundPage({super.key});

  @override
  State<VideoBackgroundPage> createState() => _VideoBackgroundPageState();
}

class _VideoBackgroundPageState extends State<VideoBackgroundPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
