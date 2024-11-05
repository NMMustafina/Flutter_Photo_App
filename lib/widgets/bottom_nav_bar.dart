import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class CustomStackIcon extends StatelessWidget {
  const CustomStackIcon({super.key});

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
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFF00D6),
                Color(0xFFFF4D00),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        const Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        ),
      ],
    );
  }
}
