import 'package:eyescare/features/piazza/entity/comment.dart';
import 'package:eyescare/features/piazza/entity/post.dart';
import 'package:flutter/material.dart';

final class PostProv extends ChangeNotifier {
  final List<Post> posts = [
    Post(
      doctorName: "陈医生",
      doctorSpecialty: "视网膜专家",
      doctorAvatar: "assets/image/doctor1-min.png",
      postTime: "2 小时前",
      image: Image.asset("assets/image/f1.png"),
      title: "伴黄斑水肿的糖尿病视网膜病变",
      description: "有趣的糖尿病视网膜病变伴黄斑水肿病例。请注意黄斑区域周围的渗出物和小出血点。在这个阶段，您会推荐哪种治疗方法？",
      likes: 24,
      comments: [
        Comment(
          doctorName: "约翰逊医生",
          doctorAvatar: "assets/image/doctor1-min.png",
          content: "鉴于涉及黄斑，我建议使用抗 VEGF 注射。是否已经检查了 OCT 扫描？",
          timeAgo: "1 小时前",
        ),
        Comment(
          doctorName: "罗德里格斯医生",
          doctorAvatar: "assets/image/f1.png",
          content: "同意使用抗 VEGF。还建议尽可能加强血糖控制。患者的 HbA1c 是多少？",
          timeAgo: "45 分钟前",
        ),
      ],
    ),
    Post(
      doctorName: "威尔逊医生",
      doctorSpecialty: "青光眼专家",
      doctorAvatar: "assets/image/doctor1-min.png",
      postTime: "昨天",
      //imageUrl: "assets/image/f1.png",
      title: "可疑的视盘",
      description: "可疑的视盘，杯盘比增加。测量的眼压为 26mmHg。患者抱怨轻微头痛，但尚未检测到视野缺损。您会开始治疗还是观察？",
      likes: 18,
      comments: [
        Comment(
          doctorName: "朴医生",
          doctorAvatar: "assets/avatars/doctor5.png",
          content: "我会从前列腺素类似物开始治疗并一个月后复查。尽管视野正常，但视盘确实令人担忧。",
          timeAgo: "10 小时前",
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