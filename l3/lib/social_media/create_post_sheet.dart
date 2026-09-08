import 'package:flutter/material.dart';
import 'package:l3/social_media/post.dart';

class CreatePostSheet extends StatefulWidget {
  final String userName;


  const CreatePostSheet({
    required this.userName,
    super.key});

  @override
  State<CreatePostSheet> createState() => _CreatePostSheetState ();
}

class _CreatePostSheetState extends State<CreatePostSheet> {
  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();


  void submitPost() {
    final String caption = _captionController.text.trim();
    final String imageUrl = _imageController.text.trim();

    if (caption.isNotEmpty || imageUrl.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Complete both fields before submitting.  ')),
      );
      return;
    }


    final Post newPost = Post(
      userName: widget.userName,
      caption: caption,
      imageUrl: imageUrl,
    );
  Navigator.pop(context, newPost);
    
  }
  @override

  void dispose() {
    _captionController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left:20,
        right:20,
        top:20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
    ),
      child: Column(
        children: [
          const Text('Create Post', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),

          TextField(
            controller: _imageController,
            decoration: const InputDecoration(
              labelText: 'Image URL',
              prefixIcon: Icon(Icons.text_fields),
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 100,
            child: TextField(
              controller: _captionController,
              maxLines: null,
              expands: true,
              decoration: const InputDecoration(
                labelText: 'Caption',
                prefixIcon: Icon(Icons.text_fields),
                border: OutlineInputBorder(),
              ),
            ),
          ),

        ]
      )
    );
  }
}