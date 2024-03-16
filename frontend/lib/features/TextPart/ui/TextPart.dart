import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/TextPart/bloc/text_part_bloc.dart';
import 'package:frontend/features/TextPart/ui/Classify/Classify.dart';
import 'package:frontend/features/TextPart/ui/Generate/Generate.dart';
import 'package:frontend/features/TextPart/ui/Summarize/summarize.dart';
import 'package:frontend/features/TextPart/ui/TextPartCards.dart';
import 'package:google_fonts/google_fonts.dart';

class TextPart extends StatefulWidget {
  const TextPart({super.key});

  @override
  State<TextPart> createState() => _TextPartState();
}

class _TextPartState extends State<TextPart> {
  final TextPartBloc textBloc = TextPartBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textBloc.add(TextPartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            // size: 0,
          ),
          title: Center(
            child: Text(
              "Play with Text!",
              style: GoogleFonts.urbanist(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 20,
              left: 15,
              right: 15,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        textBloc.add(TextPartSummarizeButtonClickedEvent());
                      },
                      child: TextPartWidget(
                        title: "Summarize",
                        textStyle: GoogleFonts.urbanist(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        textBloc.add(TextPartGenerateButtonClickedEvent());
                      },
                      child: TextPartWidget(
                        title: "Generate",
                        textStyle: GoogleFonts.urbanist(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        textBloc.add(TextPartClassifyButtonClickedEvent());
                      },
                      child: TextPartWidget(
                        title: "Classify",
                        textStyle: GoogleFonts.urbanist(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 100,
                bottom: 30,
                left: 10,
                right: 10,
                child: Center(
                    child: Container(
                  width: 400,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    gradient: LinearGradient(
                      colors: [Colors.grey.shade900, Colors.black],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: BlocConsumer<TextPartBloc, TextPartState>(
                    bloc: textBloc,
                    listenWhen: (previous, current) =>
                        current is TextPartActionState,
                    buildWhen: (previous, current) =>
                        current is! TextPartActionState,
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      switch (state.runtimeType) {
                        case TextPartLoadedSuccessState:
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Summarize",
                                style: GoogleFonts.urbanist(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              Text(
                                "Generate",
                                style: GoogleFonts.urbanist(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              Text(
                                "Classify",
                                style: GoogleFonts.urbanist(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ],
                          );
                        case TextPartSummarizeState:
                          return Summarize();
                        case TextPartGenerateState:
                          return Generate();
                        case TextPartClassifyState:
                          return Classify();
                        default:
                          return Container();
                      }
                    },
                  ),
                )))
          ],
        ));
  }
}
