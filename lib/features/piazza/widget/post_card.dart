import 'package:eyescare/features/piazza/entity/comment.dart';
import 'package:eyescare/features/piazza/entity/post.dart';
import 'package:eyescare/features/piazza/widget/comment_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PostCard extends StatefulWidget {
  final Post post;
  final Function(Comment) onAddComment;

  const PostCard({
    super.key,
    required this.post,
    required this.onAddComment,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final TextEditingController _commentController = TextEditingController();
  bool _isExpanded = false;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white12,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.post.doctorAvatar),
                  radius: 20,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.doctorName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      widget.post.doctorSpecialty,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  widget.post.postTime,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            ShadBadge(
              foregroundColor: Colors.greenAccent,
              backgroundColor: Colors.greenAccent.withOpacity(0.2),
              child: Text('Active'),
            ),
            const SizedBox(height: 8),
            Text(
              widget.post.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(widget.post.description),
            const SizedBox(height: 16),
            if (widget.post.image != null)
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: widget.post.image,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox.shrink(),
                  ),
                ],
              ),
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton.outlined(
                  padding: const EdgeInsets.all(8),
                  onPressed: () {},
                  icon: Row(
                    spacing: 3,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(CupertinoIcons.hand_thumbsup, size: 20),
                      const SizedBox(width: 4),
                      Text('${widget.post.likes}'),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.outlined(
                  padding: const EdgeInsets.all(8),
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  icon: Row(
                    spacing: 3,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(CupertinoIcons.chat_bubble_text, size: 20),
                      const SizedBox(width: 4),
                      Text('${widget.post.comments.length}'),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.outlined(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border, size: 20),
                ),
                const Spacer(),
                IconButton.outlined(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.deepOrangeAccent,
                    backgroundColor: Colors.deepOrangeAccent.withOpacity(0.2),
                    overlayColor: Colors.deepOrangeAccent,
                    side: const BorderSide(color: Colors.deepOrangeAccent),
                  ),
                  icon: const Icon(Icons.share_outlined, size: 20),
                ),
              ],
            ),
            if (_isExpanded) ...[
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.post.comments.length,
                itemBuilder: (context, index) {
                  final comment = widget.post.comments[index];
                  return CommentWidget(comment: comment);
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/image/doctor1-min.png",),
                    radius: 16,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: const InputDecoration(
                        hintText: 'Add a comment...',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(CupertinoIcons.arrow_up_circle, size: 30,),
                    color: Colors.deepOrangeAccent,
                    onPressed: () {
                      if (_commentController.text.trim().isNotEmpty) {
                        widget.onAddComment(
                          Comment(
                            doctorName: "Dr. Current User",
                            doctorAvatar: "assets/image/doctor1-min.png",
                            content: _commentController.text,
                            timeAgo: "Just now",
                          ),
                        );
                        _commentController.clear();
                      }
                    },
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}