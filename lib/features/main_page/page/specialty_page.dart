import 'package:eyescare/features/main_page/entity/image_desc.dart';
import 'package:eyescare/shared/widget/hero_layout_card.dart';
import 'package:eyescare/style/app_style.dart';
import 'package:flutter/material.dart';

class SpecialtyPage extends StatefulWidget {
  const SpecialtyPage({super.key});

  @override
  State<StatefulWidget> createState() => _SpecialtyPageState();
}

class _SpecialtyPageState extends State<SpecialtyPage> {

  final CarouselController controller = CarouselController();
  final List<ImageDesc> imageDescs = <ImageDesc>[
    ImageDesc('assets/image/precision.png','Precision Diagnostics', 'SAdvanced AI algorithms analyze fundus images with exceptional accuracy, providing doctors with reliable probability assessments for various ocular conditions, helping reduce diagnostic errors and improving treatment decision-making.'),
    ImageDesc('assets/image/instant.png','Instant Analysis', 'Sponsored | Season 1 Now Streaming', ),
    ImageDesc('assets/image/workflow.png','Clinical Workflow Integration', 'Sponsored | Season 1 Now Streaming',),
    ImageDesc('assets/image/multi.png', 'Multi-condition Detection', 'content_based_color_scheme_4.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Container(
            color: Colors.black,
            padding: const EdgeInsets.only(left: 60),
            height: 70,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/image/logo.png',
                width: 100,
                height: 100,
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Really Something,',
            style: TextStyle(
              fontSize: 38,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: AppStyle.fontFamily2,
            ),
          ),
          Text(
            'Not Just the Idea of Something.',
            style: TextStyle(
              fontSize: 38,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: AppStyle.fontFamily2,
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: size.width / 1.8,
            child: Text(
              'Our cutting-edge AI-powered retinal diagnostic platform revolutionizes eye healthcare by combining precision diagnostics with instant analysis capabilities. The system processes fundus images with exceptional accuracy, delivering comprehensive probability assessments for multiple ocular conditions simultaneously—including diabetic retinopathy, glaucoma, and macular degeneration—all within seconds.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontFamily: AppStyle.fontFamily2,
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            height: 420,
            width: size.width / 1.5,
            child: CarouselView.weighted(
              controller: controller,
              itemSnapping: true,
              flexWeights: const <int>[1, 3, 3,1],
              children: imageDescs.map((ImageDesc imageDesc) {
                return HeroLayoutCard(
                  imageDesc: imageDesc,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

enum Image1Info {
  image0('The Flow', 'Sponsored | Season 1 Now Streaming', 'content_based_color_scheme_1.png'),
  image1(
    'Through the Pane',
    'Sponsored | Season 1 Now Streaming',
    'content_based_color_scheme_2.png',
  ),
  image2('Iridescence', 'Sponsored | Season 1 Now Streaming', 'content_based_color_scheme_3.png'),
  image3('Sea Change', 'Sponsored | Season 1 Now Streaming', 'content_based_color_scheme_4.png'),
  image4('Blue Symphony', 'Sponsored | Season 1 Now Streaming', 'content_based_color_scheme_5.png'),
  image5('When It Rains', 'Sponsored | Season 1 Now Streaming', 'content_based_color_scheme_6.png');

  const Image1Info(this.title, this.subtitle, this.url);
  final String title;
  final String subtitle;
  final String url;
}