import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  final String username;

  const ProfileWidget({
    super.key,
    required this.username,
  });

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool showAdditionalDetails = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User info
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  child: Text(
                    widget.username[0].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Mobile Development',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Limit and website
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Limit',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'www.legal.com',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Course',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'BMT',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Toggle additional details
            InkWell(
              onTap: () {
                setState(() {
                  showAdditionalDetails = !showAdditionalDetails;
                });
              },
              child: Row(
                children: [
                  Text(
                    showAdditionalDetails ? 'Hide Additional Details' : 'Show Additional Details',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(
                    showAdditionalDetails
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            if (showAdditionalDetails) ...[
              const SizedBox(height: 16),
              const Text(
                'Programming Languages',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Text('C#'),
                  Spacer(),
                  Text('Framework'),
                  Spacer(),
                  Text('Level'),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: const [
                  Icon(Icons.check_box, size: 20, color: Colors.green),
                  SizedBox(width: 8),
                  Text('Flutter'),
                  Spacer(),
                  Icon(Icons.star, size: 20, color: Colors.amber),
                  SizedBox(width: 8),
                  Text('designer'),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}