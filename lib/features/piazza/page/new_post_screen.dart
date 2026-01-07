import 'package:eyescare/features/piazza/entity/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class NewPostDialog extends StatefulWidget {
  final Function(Post)? onPost;
  final String doctorName;
  final String doctorSpecialty;
  final String doctorAvatar;

  const NewPostDialog({
    super.key,
    this.onPost,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.doctorAvatar,
  });

  @override
  State<NewPostDialog> createState() => _NewPostDialogState();
}

class _NewPostDialogState extends State<NewPostDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final int _maxCharacters = 500;
  Image? _selectedImage;
  bool _isPostButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _titleController.addListener(_updatePostButtonState);
    _descriptionController.addListener(_updatePostButtonState);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _updatePostButtonState() {
    final newState = _titleController.text.trim().isNotEmpty &&
        _descriptionController.text.trim().isNotEmpty &&
        _descriptionController.text.length <= _maxCharacters;
    if (newState != _isPostButtonEnabled) {
      setState(() {
        _isPostButtonEnabled = newState;
      });
    }
  }

  Future<void> _pickImage() async {
    var image = (await ImagePickerWeb.getImageAsWidget());
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
    });
  }

  String _generateTimestamp() {
    final now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} "
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.white30),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.6,
          maxWidth: MediaQuery.of(context).size.width * 0.5,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContent(),
              if (_selectedImage != null) ...[
                SizedBox(height: 16),
                _buildAttachmentPreview(),
              ],
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  CircleAvatar(
                    backgroundImage: widget.doctorAvatar.startsWith('http')
                        ? NetworkImage(widget.doctorAvatar) as ImageProvider
                        : AssetImage(widget.doctorAvatar),
                    radius: 24,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctorName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      ),
                      Text(
                        widget.doctorSpecialty,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _isPostButtonEnabled
                    ? () {
                  final post = Post(
                    doctorName: widget.doctorName,
                    doctorSpecialty: widget.doctorSpecialty,
                    doctorAvatar: widget.doctorAvatar,
                    postTime: _generateTimestamp(),
                    image: _selectedImage,
                    title: _titleController.text,
                    description: _descriptionController.text,
                    likes: 0,
                    comments: [],
                  );
                  widget.onPost?.call(post);
                  Navigator.of(context).pop(true);
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: const Text('发布'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: "标题",
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.deepOrange, width: 2),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
            ),
            maxLines: null,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200),
            child: TextField(
              controller: _descriptionController,
              maxLines: 20,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: "分享案例或者发起讨论...",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.deepOrange, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.deepOrange),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.deepOrange),
                ),
              ),
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAttachmentPreview() {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: _selectedImage,
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: _removeImage,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.close, size: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final int currentLength = _descriptionController.text.length;
    final bool isOverLimit = currentLength > _maxCharacters;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.photo_on_rectangle),
                    onPressed: _pickImage,
                    tooltip: '添加图像',
                    color: Colors.deepOrangeAccent,
                  ),
                  IconButton(
                    icon: const Icon(Icons.tag),
                    onPressed: () {/* Add hashtag functionality */},
                    tooltip: '添加标签',
                    color: Colors.deepOrangeAccent,
                  ),
                ],
              ),
              Row(
                children: [
                  if (isOverLimit) ...[
                    Text(
                      '${currentLength - _maxCharacters}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ] else if (currentLength >= _maxCharacters - 50) ...[
                    Text(
                      '${_maxCharacters - currentLength}',
                      style: TextStyle(
                        color: currentLength >= _maxCharacters - 20
                            ? Colors.orange
                            : Colors.grey,
                      ),
                    ),
                  ],
                  const SizedBox(width: 8),
                  if (currentLength > 0)
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        value: currentLength / _maxCharacters,
                        strokeWidth: 2,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          isOverLimit ? Colors.red :
                          currentLength >= _maxCharacters - 20 ? Colors.orange : Colors.blue,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}