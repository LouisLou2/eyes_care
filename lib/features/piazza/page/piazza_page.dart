import 'package:eyescare/features/piazza/entity/comment.dart';
import 'package:eyescare/features/piazza/entity/post.dart';
import 'package:eyescare/features/piazza/prov/post_prov.dart';
import 'package:eyescare/features/piazza/widget/active_specialists.dart';
import 'package:eyescare/features/piazza/widget/new_post_card.dart';
import 'package:eyescare/features/piazza/widget/post_card.dart';
import 'package:eyescare/features/piazza/widget/trending_topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class RightSidebar extends StatelessWidget {
  const RightSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trending Topics',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TrendingTopic(
            title: 'OCT Interpretation',
            count: '328 discussions',
            color: Colors.blue[100]!,
          ),
          TrendingTopic(
            title: 'Glaucoma Management',
            count: '245 discussions',
            color: Colors.green[100]!,
          ),
          TrendingTopic(
            title: 'AMD Treatment',
            count: '192 discussions',
            color: Colors.orange[100]!,
          ),
          const SizedBox(height: 30),
          const Text(
            'Active Specialists',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            spacing: 16,
            children: [
              ActiveSpecialist(
                name: 'Dr. Sarah Chen',
                specialty: 'Retinal Specialist',
                avatar: 'assets/image/doctor1-min.png',
                isOnline: true,
              ),
              ActiveSpecialist(
                name: 'Dr. Michael Johnson',
                specialty: 'Glaucoma Specialist',
                avatar: 'assets/image/doctor2-min.png',
                isOnline: true,
              ),
              ActiveSpecialist(
                name: 'Dr. Emily Rodriguez',
                specialty: 'Cornea Specialist',
                avatar: 'assets/image/doctor3-min.png',
                isOnline: false,
              ),
              ActiveSpecialist(
                name: 'Dr. James Wilson',
                specialty: 'Neuro-ophthalmology',
                avatar: 'assets/image/doctor4-min.png',
                isOnline: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MedicalFeedScreen extends StatefulWidget {
  const MedicalFeedScreen({super.key});

  @override
  State<MedicalFeedScreen> createState() => _MedicalFeedScreenState();
}

class _MedicalFeedScreenState extends State<MedicalFeedScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          // Main Feed
          Expanded(
            child: ChangeNotifierProvider(
             create: (context) => PostProv(),
              child: Scaffold(
                appBar: AppBar(
                  title: NewPostCard(),
                  toolbarHeight: 180,
                  centerTitle: true,
                  surfaceTintColor: Colors.transparent,
                  actionsPadding: EdgeInsets.zero,
                ),
                body: Selector<PostProv, int>(
                  selector: (context, postProv) => postProv.posts.length,
                  builder: (context, postsLen, child) {
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: postsLen, // Posts + New Post Card
                      itemBuilder: (context, index) {
                        final posts = Provider.of<PostProv>(context,listen: false).posts;
                        final post = posts[index];
                        return PostCard(
                          post: post,
                          onAddComment: (comment) {
                            setState(() {
                              post.comments.add(comment);
                            });
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ),
          // Right Sidebar
          RightSidebar(),
        ],
      ),
    );
  }
}