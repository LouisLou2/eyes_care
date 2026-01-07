import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class SelectImagePage extends StatefulWidget {
  const SelectImagePage({super.key});

  @override
  State<SelectImagePage> createState() => _SelectImagePageState();
}

class _SelectImagePageState extends State<SelectImagePage> {

  Image? _image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          splashColor: Colors.deepOrangeAccent.withOpacity(0.3),
          onTap: () async {
            _image = await ImagePickerWeb.getImageAsWidget();
            if (_image != null) {
              setState(() {});
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: _image == null ? _buildUploadArea() : ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FittedBox(
              fit: BoxFit.cover,
              child: _image!,
            )
          ),
        ),
      ),
    );
  }

  Widget _buildUploadArea() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.cloud_upload_outlined,
          size: 60,
          color: Colors.blue[400],
        ),
        const SizedBox(height: 15),
        Text(
          '点击上传图片',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '支持 JPG, PNG, HEIC (最大 10MB)',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}