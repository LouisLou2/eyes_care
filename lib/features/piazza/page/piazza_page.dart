import 'package:eyescare/features/piazza/entity/comment.dart';
import 'package:eyescare/features/piazza/entity/post.dart';
import 'package:eyescare/features/piazza/widget/active_specialists.dart';
import 'package:eyescare/features/piazza/widget/new_post_card.dart';
import 'package:eyescare/features/piazza/widget/post_card.dart';
import 'package:eyescare/features/piazza/widget/trending_topic.dart';
import 'package:flutter/material.dart';

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
  final List<Post> posts = [
    Post(
      doctorName: "Dr. Sarah Chen",
      doctorSpecialty: "Retinal Specialist",
      doctorAvatar: "assets/image/doctor1-min.png",
      postTime: "2 hours ago",
      imageUrl: "assets/image/doctor1-min.png",
      title: "Diabetic Retinopathy with Macular Edema",
      description: "Interesting case of diabetic retinopathy with macular edema. Note the exudates around the macula region and the small hemorrhages. What treatment approach would you recommend at this stage?",
      likes: 24,
      comments: [
        Comment(
          doctorName: "Dr. Michael Johnson",
          doctorAvatar: "assets/image/doctor1-min.png",
          content: "I would suggest anti-VEGF injections given the macular involvement. Have you checked the OCT scans?",
          timeAgo: "1 hour ago",
        ),
        Comment(
          doctorName: "Dr. Emily Rodriguez",
          doctorAvatar: "assets/image/f1.png",
          content: "Agreed with anti-VEGF. Also recommend tighter glycemic control if possible. What's the patient's HbA1c?",
          timeAgo: "45 minutes ago",
        ),
      ],
    ),
    Post(
      doctorName: "Dr. James Wilson",
      doctorSpecialty: "Glaucoma Specialist",
      doctorAvatar: "assets/image/doctor1-min.png",
      postTime: "Yesterday",
      imageUrl: "assets/image/f1.png",
      title: "Suspicious Optic Disc",
      description: "Suspicious optic disc with increased cup-to-disc ratio. IOP measured at 26mmHg. Patient complains of mild headaches but no visual field defects detected yet. Would you initiate treatment or observe?",
      likes: 18,
      comments: [
        Comment(
          doctorName: "Dr. Lisa Park",
          doctorAvatar: "assets/avatars/doctor5.png",
          content: "I would start with prostaglandin analogs and recheck in a month. The disc does look concerning despite the normal fields.",
          timeAgo: "10 hours ago",
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          // Main Feed
          Expanded(
            child: ListView.builder(
              itemCount: posts.length + 1, // Posts + New Post Card
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const NewPostCard();
                } else {
                  final post = posts[index - 1];
                  return PostCard(
                    post: post,
                    onAddComment: (comment) {
                      setState(() {
                        post.comments.add(comment);
                      });
                    },
                  );
                }
              },
            ),
          ),
          // Right Sidebar
          RightSidebar(),
        ],
      ),
    );
  }
}