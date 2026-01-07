import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActiveSpecialist extends StatelessWidget {
  final String name;
  final String specialty;
  final String avatar;
  final bool isOnline;

  const ActiveSpecialist({
    super.key,
    required this.name,
    required this.specialty,
    required this.avatar,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.white12,
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(avatar),
              radius: 20,
            ),
            if (isOnline)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
          ],
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(
          specialty,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        trailing: IconButton(
          icon: const Icon(
            CupertinoIcons.chat_bubble_text,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent,
          ),
        ),
      ),
    );
  }
}