import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:frontend/features/Profile/ui/Prodile.dart';
import 'package:frontend/features/ToDo/ui/ToDo.dart';
import 'features/ChatBot/ui/ChatBotPage.dart';
import 'features/Home/ui/Home.dart';
import 'features/ImageCaptioning/ui/imageCaptioning.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

const List<TabItem> items = [
  TabItem(
    icon: Icons.check_circle_outline_rounded,
  ),
  TabItem(
    icon: Icons.chat_bubble_outline_rounded,
  ),
  TabItem(
    icon: Icons.home_rounded,
  ),
  TabItem(
    icon: Icons.image_outlined,
  ),
  TabItem(
    icon: Icons.person_outline_rounded,
  ),
];

class _MainScreenPageState extends State<MainScreenPage> {
  late PageController _pageController;
  int visit = 2;

  List screen = [
    ChatBotPage(),
    ToDoScreen(),
    MyHomePage(),
    ImageCaptioningScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: visit);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: items.length,
        onPageChanged: (index) {
          setState(() {
            visit = index;
          });
        },
        itemBuilder: (context, index) {
          return screen[index];
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
        child: Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey.shade900, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: BottomBarFloating(
            items: items,
            backgroundColor: Colors.transparent,
            color: Colors.grey.shade700,
            colorSelected: Color.fromRGBO(199, 178, 253, 1),
            indexSelected: visit,
            paddingVertical: 24,
            onTap: (int index) {
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            animated: true,
          ),
        ),
      ),
    );
  }
}
