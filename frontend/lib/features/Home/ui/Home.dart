import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/ChatBot/ui/ChatBotPage.dart';
import 'package:frontend/features/ImageCaptioning/ui/imageCaptioning.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("AiFusion"),
    ));
  }
}
