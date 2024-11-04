import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;

  BottomNavBar({
    required this.selectedIndex,
  });

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void _onItemTapped(int index) {
    setState(() {
      // Navigator.pushNamed(
      //   context,
      //   [
      //     '/home',
      //     '/search',
      //     '/create_image',
      //     '/chats',
      //     '/profile'
      //   ][index],
      // );
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/home');
          break;
        case 1:
          Navigator.pushNamed(context, '/search');
          break;
        case 2:
          Navigator.pushNamed(context, '/create_image');
          break;
        case 3:
          Navigator.pushNamed(context, '/chats');
          break;
        case 4:
          Navigator.pushNamed(context, '/profile');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/icons/home.svg',
            width: 20,
            height: 20,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/icons/search.svg',
            width: 20,
            height: 20,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: CustomStackIcon(),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/icons/chats.svg',
            width: 20,
            height: 20,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/icons/profile.svg',
            width: 20,
            height: 20,
          ),
          label: '',
        ),
      ],
    );
  }
}

class CustomStackIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF00D6),
                Color(0xFFFF4D00),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        ),
      ],
    );
  }
}