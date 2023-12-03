import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul3/app/modules/home/views/homepage.dart';
import 'package:modul3/app/modules/home/views/inbox.dart';
import 'package:modul3/app/modules/home/views/plus.dart';
import 'package:modul3/app/modules/home/views/profile.dart';
import 'package:modul3/app/modules/home/views/search.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  BottomNavigationBarWidget({
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black, // Warna item terpilih (highlighted)
      unselectedItemColor:
          Colors.black.withOpacity(0.5), // Warna item yang tidak terpilih
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Get.to(() => HomePage());
            },
            child: Icon(Icons.home),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Get.to(() => UserSearchPage());
            },
            child: Icon(Icons.search),
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Get.to(() => ToDoListPage());
            },
            child: Icon(Icons.add_box_rounded),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Get.to(() => UserInboxPage());
            },
            child: Icon(Icons.chat_bubble_rounded),
          ),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Get.to(() => UserProfilePage());
            },
            child: Icon(Icons.person),
          ),
          label: 'Profile',
        ),
      ],
      onTap: onItemSelected,
    );
  }
}
