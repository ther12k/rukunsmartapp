import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReceiptUpload extends StatefulWidget {
  final Function(String) onUpload;

  const ReceiptUpload({super.key, required this.onUpload});

  @override
  // ignore: library_private_types_in_public_api
  _ReceiptUploadState createState() => _ReceiptUploadState();
}

class _ReceiptUploadState extends State<ReceiptUpload> {
  String? _imagePath;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_imagePath != null)
          Image.asset(_imagePath!, height: 200)
        else
          const Icon(Icons.image, size: 100),
        ElevatedButton(
          onPressed: _pickImage,
          child: const Text('Select Receipt Image'),
        ),
        if (_imagePath != null)
          ElevatedButton(
            onPressed: () => widget.onUpload(_imagePath!),
            child: const Text('Upload Receipt'),
          ),
      ],
    );
  }
}
