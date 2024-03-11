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
    icon: Icons.home_rounded,
  ),
  TabItem(
    icon: Icons.chat_bubble_outline_rounded,
  ),
  TabItem(
    icon: Icons.check_circle_outline_rounded,
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
  int visit = 0;

  List screen = [
    MyHomePage(),
    ToDoScreen(),
    ChatBotPage(),
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
        child: BottomBarFloating(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          items: items,
          backgroundColor: Colors.black87,
          color: Colors.grey,
          colorSelected: Colors.white,
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
    );
  }
}
