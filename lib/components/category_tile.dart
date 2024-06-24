import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String text;
  const CategoryTile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 0,
      ),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
