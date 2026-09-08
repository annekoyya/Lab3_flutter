// profile.dart
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String username;

  const ProfilePage({
    super.key,
    required this.username,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showAdditionalInfo = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'images/pic.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.username,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Mobile Developer',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildInfoBox(Icons.person, 'Username', widget.username),
                    const SizedBox(height: 12),
                    _buildInfoBox(Icons.email, 'Email', 'annika@gmail.com'),
                    const SizedBox(height: 12),
                    _buildInfoBox(Icons.school, 'Course', 'BSCS'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildExpandableButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableButton() {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              showAdditionalInfo = !showAdditionalInfo;
            });
          },
          icon: Icon(
            showAdditionalInfo 
                ? Icons.keyboard_arrow_up 
                : Icons.keyboard_arrow_down,
          ),
          label: Text(
            showAdditionalInfo 
                ? 'Hide Additional Info' 
                : 'Show Additional Info',
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 171, 122, 255),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        if (showAdditionalInfo) ...[
          const SizedBox(height: 16),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildInfoBox(Icons.code, 'Programming Language', 'Dart'),
                  const SizedBox(height: 12),
                  _buildInfoBox(Icons.phone_android, 'Framework', 'Flutter'),
                  const SizedBox(height: 12),
                  _buildInfoBox(Icons.star, 'Level', 'Beginner'),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildInfoBox(IconData icon, String label, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color.fromARGB(255, 255, 125, 205),
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}