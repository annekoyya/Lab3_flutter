import 'package:flutter/material.dart';
import 'package:l3/social_media/create_post_sheet.dart';
import 'package:l3/social_media/post.dart';
import 'package:l3/social_media/post_card.dart';

class SocialMediaPage extends StatefulWidget {
  final String userName;

  const SocialMediaPage({super.key, required this.userName});

  @override
  State<SocialMediaPage> createState() => _SocialMediaPageState();
}

class _SocialMediaPageState extends State<SocialMediaPage> {
  final List<Post> _posts = [
    const Post(
      userName: 'John Doe',
      caption: 'Enjoying the sunny weather!',
      imageUrl: 'images/pic1.jpeg',
    ),
    const Post(
      userName: 'Jane Smith',
      caption: 'Had a great time at the concert!',
      imageUrl: 'images/pic2.jpeg',
    ),
  ];

  Future<void> _createPost() async {
    final Post? newPost = await showModalBottomSheet<Post>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return CreatePostSheet(userName: widget.userName);
      },
    );
    if (newPost != null) {
      setState(() {
        _posts.insert(0, newPost);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _posts.isEmpty
          ? const Center(
              child: Text('No posts available.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return PostCard(post: _posts[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createPost,
        backgroundColor: const Color.fromARGB(255, 149, 76, 175),
        foregroundColor: Colors.white,
        tooltip: 'Create Post',
        child: const Icon(Icons.add),
      ),
    );
  }
}