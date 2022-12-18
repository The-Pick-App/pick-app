import 'package:flutter/material.dart';
import 'package:pickapp/theme/palette/pallette.dart';

class ButtomBar extends StatefulWidget {
  const ButtomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ButtomBar> createState() => _ButtomBarState();
}

class _ButtomBarState extends State<ButtomBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add, size: 50),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Hesap",
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Pallete.mainColor,
      onTap: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
    );
  }
}
