import 'package:flutter/material.dart';
import 'package:l3/social_media/post.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({
    required this.post, 
    super.key
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = [];
  bool _isLiked = false;

  void likedPost() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  void addComment() {
    final String comment = _commentController.text.trim();
    if (comment.isNotEmpty) {
      setState(() {
        _comments.add(comment);
        _commentController.clear();
      });
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 233, 105, 125),
              child: Text(widget.post.userName[0].toUpperCase(),
              style: const TextStyle(color: Colors.white)),
            ),
            title: Text(widget.post.userName,
            style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("Just Now"),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(widget.post.caption),
          ),

          Image.network(
            widget.post.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
            errorBuilder: (BuildContext context, dynamic error, StackTrace? stackTrace) {
              return const SizedBox(
                child: Center(
                  child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                ),
              );
            },
          ),

          Row(
            children: [
              TextButton.icon(
                onPressed: likedPost,
                icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border, color: _isLiked ? Colors.red : null),
                label: Text(_isLiked ? 'Liked' : 'Like'),
              ),
              Text('${_comments.length} Comments'),
            ],
          ),

          for (final String comment in _comments)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(comment),
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: const InputDecoration(
                      hintText: 'Add a comment...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: addComment,
                  icon: const Icon(Icons.send),
                  color: const Color.fromARGB(255, 255, 150, 229),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}