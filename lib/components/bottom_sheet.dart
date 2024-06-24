import 'package:flutter/material.dart';

class BottomSheetComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Image(
              image: AssetImage(
                'lib/assets/link.png',
              ),
              height: 35,
            ),
            title: Text(
              'Invite',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image(
              image: AssetImage(
                'lib/assets/user-add.png',
              ),
              height: 35,
            ),
            title: Text(
              'Add member',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image(
              image: AssetImage(
                'lib/assets/user-add-1.png',
              ),
              height: 35,
            ),
            title: Text(
              'Add Group',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
