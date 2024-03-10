import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';

const List<TabItem> items = [
  TabItem(
    icon: Icons.home_rounded,
  ),
  TabItem(
    icon: Icons.search_rounded,
  ),
  TabItem(
    icon: Icons.favorite_border_rounded,
  ),
  TabItem(
    icon: Icons.shopping_cart_rounded,
  ),
  TabItem(
    icon: Icons.person_outline_rounded,
  ),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int visit = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
        child: BottomBarFloating(
          curve: Curves.easeInBack,
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
          onTap: (int index) => setState(() {
            visit = index;
          }),
          animated: true,
        ),
      ),
      // bottomNavigationBar: BottomBarInspiredOutside(
      //   height: 50,
      //   items: items,
      //   backgroundColor: Colors.black87,
      //   color: Colors.grey.shade50,
      //   colorSelected: Colors.grey,
      //   indexSelected: visit,
      //   onTap: (int index) => setState(() {
      //     visit = index;
      //   }),
      //   top: -40,
      //   animated: true,
      //   itemStyle: ItemStyle.circle,
      //   chipStyle: const ChipStyle(
      //       notchSmoothness: NotchSmoothness.verySmoothEdge,
      //       background: Colors.black),
      // ),
    );
  }
}
