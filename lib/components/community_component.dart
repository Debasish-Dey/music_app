import 'package:flutter/material.dart';

class CommunityComponent extends StatelessWidget {
  const CommunityComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 193, 27, 15),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The weeknd',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Proxima Nova',
                ),
              ),
              Row(
                children: [
                  Text(
                    'Community • ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '+11K Members',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.share_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
