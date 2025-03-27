import 'package:eyescare/features/piazza/entity/comment.dart';
import 'package:flutter/material.dart';

class Post {
  final String doctorName;
  final String doctorSpecialty;
  final String doctorAvatar;
  final String postTime;
  final Image? image;
  final String title;
  final String description;
  int likes;
  final List<Comment> comments;

  Post({
    required this.doctorName,
    required this.doctorSpecialty,
    required this.doctorAvatar,
    required this.postTime,
    this.image,
    required this.title,
    required this.description,
    required this.likes,
    required this.comments,
  });
}