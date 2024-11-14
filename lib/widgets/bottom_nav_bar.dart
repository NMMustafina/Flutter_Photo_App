import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_app/widgets/widgets.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/discover');
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
          Navigator.pushNamed(context, '/account');
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
        const BottomNavigationBarItem(
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
