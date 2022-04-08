import 'package:flutter/material.dart';
import 'package:taniku/view/profilescreen.dart';


class navdraw extends StatelessWidget {
  const navdraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
              icon: Icons.account_circle_rounded,
              text: 'Profile',
              onTap: () {
                Navigator.pop(context);
                 Navigator.push(context, MaterialPageRoute(builder: (_) => const profilemenu()));
              }),
          // _drawerItem(
          //     icon: Icons.group,
          //     text: 'Grid',
          //     onTap: () {
          //       Navigator.pop(context);
          //       Navigator.push(context, MaterialPageRoute(builder: (_) => const grid()));
          //     }),
          // _drawerItem(
          //     icon: Icons.access_time,
          //     text: 'Stack',
          //     onTap: () {
          //       Navigator.pop(context);
          //       Navigator.push(context, MaterialPageRoute(builder: (_) => const stack()));
          //     }),
          // _drawerItem(
          //     icon: Icons.delete,
          //     text: 'Logout',
          //     onTap: () {
          //       Navigator.pop(context);
          //       Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
          //     }),
          const Divider(height: 25, thickness: 1),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Labels",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
              icon: Icons.bookmark,
              text: 'Family',
              onTap: () => print('Tap Family menu')),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return const UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child: Image(
          image: AssetImage('assets/flutter.png'), fit: BoxFit.cover),
    ),
    otherAccountsPictures: [
      ClipOval(
        child: Image(
            image: AssetImage('assets/google.png'), fit: BoxFit.cover),
      ),
      ClipOval(
        child: Image(
            image: AssetImage('assets/ghost.png'), fit: BoxFit.cover),
      )
    ],
    accountName: Text(''),
    accountEmail: Text(''),
  );
}

Widget _drawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}

