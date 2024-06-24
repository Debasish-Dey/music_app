import 'package:flutter/material.dart';

class PersonTile extends StatefulWidget {
  const PersonTile({super.key});

  @override
  _PersonTileState createState() => _PersonTileState();
}

class _PersonTileState extends State<PersonTile> {
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('lib/assets/weeknd.jpg'),
            radius: 25,
          ),
          const SizedBox(width: 14),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yashika',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '29, India',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isFollowing = !_isFollowing;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _isFollowing ? Colors.grey : Colors.pink,
              foregroundColor: Colors.white,
              fixedSize: const Size.fromWidth(110),
            ),
            child: Text(_isFollowing ? 'Following' : 'Add'),
          ),
        ],
      ),
    );
  }
}
