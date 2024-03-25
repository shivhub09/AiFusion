import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/ImageCaptioning/bloc/image_captioning_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageCaptioningScreen extends StatefulWidget {
  const ImageCaptioningScreen({super.key});

  @override
  State<ImageCaptioningScreen> createState() => _ImageCaptioningScreenState();
}

class _ImageCaptioningScreenState extends State<ImageCaptioningScreen> {
  ImageCaptioningBloc imageCaptioningBloc = new ImageCaptioningBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageCaptioningBloc.add(ImageCaptioningInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Image Captioning!",
            style: GoogleFonts.urbanist(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: BlocConsumer<ImageCaptioningBloc, ImageCaptioningState>(
        bloc: imageCaptioningBloc,
        listenWhen: (previous, current) =>
            current is ImageCaptioningActionState,
        buildWhen: (previous, current) =>
            current is! ImageCaptioningActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ImageCaptioningLoadedSuccessState:
              return Center(
                child: Text("Image captioning"),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email'); // Clear the stored email
  }
}
