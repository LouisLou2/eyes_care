import 'package:eyescare/features/piazza/entity/comment.dart';
import 'package:eyescare/features/piazza/entity/post.dart';
import 'package:flutter/material.dart';

final class PostProv extends ChangeNotifier {
  final List<Post> posts = [
    Post(
      doctorName: "Dr. Sarah Chen",
      doctorSpecialty: "Retinal Specialist",
      doctorAvatar: "assets/image/doctor1-min.png",
      postTime: "2 hours ago",
      image: Image.asset("assets/image/f1.png"),
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
      //imageUrl: "assets/image/f1.png",
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

  void addPost(Post post) {
    posts.add(post);
    notifyListeners();
  }

  void removePost(Post post) {
    posts.remove(post);
    notifyListeners();
  }
}