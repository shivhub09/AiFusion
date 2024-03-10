import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
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
  int visit = 0;

  List screen = [MyHomePage(), ChatBotPage(), ImageCaptioningScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[visit],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
        color: Colors.transparent,
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
            setState(() {
              visit = index;
            });
          },
          animated: true,
        ),
      ),
    );
  }
}
