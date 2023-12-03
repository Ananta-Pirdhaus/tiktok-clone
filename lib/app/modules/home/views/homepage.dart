import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul3/app/modules/home/controllers/home_controller.dart';
import 'package:modul3/app/modules/home/views/home.dart';
import 'package:modul3/app/modules/home/views/inbox.dart';
import 'package:modul3/app/modules/home/views/login_view.dart';
import 'package:modul3/app/modules/home/views/plus.dart';
import 'package:modul3/app/modules/home/views/profile.dart';
import 'package:modul3/app/modules/home/views/search.dart';
import 'package:modul3/widget/bottom_navigation_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.find(); // Mencari instance HomeController

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    UserHomePage(),
    UserSearchPage(),
    ToDoListPage(),
    UserInboxPage(),
    UserProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tiktok Clone",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold), // Add fontWeight for a bolder title
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow for a cleaner look
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => LoginPage());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 13.0), // Add padding for better touchability
              child: Icon(Icons.login),
            ),
          ),
          SizedBox(width: 20),
          InkWell(
            onTap: () {
              Get.to(() => UserInboxPage());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.notifications_active),
            ),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });

          // Panggil metode controller berdasarkan index yang dipilih
          switch (index) {
            case 0:
              homeController.navigateToUserHomePage();
              break;
            case 1:
              homeController.navigateToUserSearchPage();
              break;
            case 2:
              homeController.navigateToUserPlusPage();
              break;
            case 3:
              homeController.navigateToUserInboxPage();
              break;
            case 4:
              homeController.navigateToUserProfilePage();
              break;
          }
        },
      ),
    );
  }
}
