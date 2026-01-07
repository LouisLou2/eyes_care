import 'package:eyescare/const/resource_manager.dart';
import 'package:eyescare/shared/widget/clickable_text.dart';
import 'package:eyescare/shared/widget/plain_button.dart';
import 'package:eyescare/shared/widget/plain_outlined_button.dart';
import 'package:eyescare/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MenuSubPage extends StatefulWidget {
  const MenuSubPage({super.key});

  @override
  State<StatefulWidget> createState() => _MenuSubPageState();
}

class _MenuSubPageState extends State<MenuSubPage> {

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  List<String> images = [
    'assets/image/doctor1-min.png',
    'assets/image/doctor2-min.png',
    'assets/image/doctor3-min.png',
    'assets/image/doctor4-min.png',
  ];

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(ResourceManager.mainPageBackVid) // 这里替换为你的视频路径
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
    return Stack(
      children: [
        // 使用 FutureBuilder 来确保视频初始化完成后才显示
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4), // 灰蒙层的颜色和透明度
                        BlendMode.darken, // 使用 `darken` 模式来让视频变暗
                      ),
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());  // 等待加载时显示进度条
            }
          },
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 90,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/image/logo.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 11,
                      child: Row(
                        // 现在为背景文字按钮
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.2)),
                              shape: WidgetStateProperty.all(
                                CircleBorder(),
                              ),
                              side: WidgetStateProperty.all(
                                BorderSide(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                              ),
                              padding: WidgetStateProperty.all(
                                EdgeInsets.all(10),
                              ),
                            ),
                            child: Icon(
                              Icons.apps_outlined,
                              color: Colors.white,
                            ),
                          ),
                          PlainTextButton(
                            text: '主页',
                            onPressed: () {
                            },
                          ),
                          PlainTextButton(
                            text: '关于我们',
                            onPressed: () {
                            },
                          ),
                          PlainTextButton(
                            text: '专家',
                            onPressed: () {
                            },
                          ),
                          PlainTextButton(
                            text: '服务',
                            onPressed: () {
                            },
                          ),
                          PlainTextButton(
                            text: '价格',
                            onPressed: () {
                            },
                          ),
                          PlainTextButton(
                            text: '社区',
                            onPressed: () {
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: PlainOutlinedButton(
                          text: '联系我们',
                          padding: 10,
                          onPressed: () {
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 9,
                    child: Text(
                      '利用高级眼底成像与人工智能诊断变革眼科护理',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppStyle.fontFamily2,
                      ),
                      softWrap: true,
                    ),
                  ),
                  Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            child: Stack(
                              children: [
                                for (int i = 0; i < images.length; i++)
                                  Positioned(
                                    top: 30,
                                    left: i * 30 + 260, // 每个图像向右偏移30px
                                    child: ClipOval(
                                      child: Image.asset(
                                        images[i],
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                Positioned(
                                  top: 80,
                                  left: 260, // 文本位置偏移
                                  child: Text(
                                    '超过1万满意客户',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 2,
                    child: PlainOutlinedButton(
                      text: '体验工作室',
                      padding: 15,
                      size: 17,
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign_in');
                      },
                    ),
                  ),
                  Expanded(
                    flex: 14,
                    child: SizedBox(),
                  ),
                ],
              ),
              SizedBox(height: 140),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '新闻',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppStyle.fontFamily2,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClickableText(
                            text: '我们始终关注前沿技术，致力于推动医疗创新。',
                            size: 16,
                            decorationThickness: 2,
                            color: Colors.white,
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 0.5,
                            height: 40,
                          ),
                          ClickableText(
                            text: '我们的专业团队为您提供高效的解决方案，确保持久的健康保障。',
                            size: 16,
                            decorationThickness: 2,
                            color: Colors.white,
                          ),
                        ],
                      )
                  ),
                  Expanded(
                    flex: 9,
                    child: SizedBox(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}