import 'package:flutter/material.dart';
import 'package:stockallref/theme/theme.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function() action;
  final Function() action2;
  final Function() action3;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.action,
    required this.action2,
    required this.action3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavButton(
            mainIndex: 0,
            action: action,
            currentIndex: currentIndex,
            icon: Icons.home,
            title: 'Home',
          ),
          BottomNavButton(
            mainIndex: 1,
            action: action2,
            currentIndex: currentIndex,
            icon: Icons.menu,
            title: 'Shops',
          ),
          BottomNavButton(
            mainIndex: 2,
            action: action3,
            currentIndex: currentIndex,
            icon: Icons.person,
            title: 'Profile',
          ),
          BottomNavButton(
            mainIndex: 3,
            action: () {},
            currentIndex: currentIndex,
            icon: Icons.logout,
            title: 'Logout',
          ),
        ],
      ),
    );
  }
}

class BottomNavButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() action;
  final int currentIndex;
  final int mainIndex;

  const BottomNavButton({
    super.key,
    required this.icon,
    required this.title,
    required this.action,
    required this.currentIndex,
    required this.mainIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: action,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 5.0,
            top: 5,
          ),
          child: SizedBox(
            child: Column(
              children: [
                Icon(
                  size: 22,
                  color:
                      currentIndex == mainIndex
                          ? primary(context)
                          : Colors.grey.shade500,
                  icon,
                ),
                Text(
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        currentIndex == mainIndex
                            ? primary(context)
                            : Colors.grey.shade500,
                    fontWeight:
                        currentIndex == mainIndex
                            ? FontWeight.bold
                            : FontWeight.normal,
                  ),
                  title,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
