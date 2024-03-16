import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/TextPart/ui/Summarize/bloc/summarize_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Summarize extends StatefulWidget {
  const Summarize({super.key});

  @override
  State<Summarize> createState() => _SummarizeState();
}

class _SummarizeState extends State<Summarize> {
  TextEditingController _classifyText = new TextEditingController();

  SummarizeBloc summarizeBloc = new SummarizeBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    summarizeBloc.add(SummarizeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            "Summarize!",
            style: GoogleFonts.urbanist(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Enter text to summarize',
                    focusColor: Colors.white,
                    labelStyle: GoogleFonts.urbanist(
                        fontSize: 16, color: Colors.grey[400]),
                  ),
                  controller: _classifyText,
                  style:
                      GoogleFonts.urbanist(fontSize: 16, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      summarizeBloc.add(SummarizeButtonClickedEvent(
                          text: _classifyText.text));
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        "Summarize",
                        style: GoogleFonts.urbanist(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          BlocConsumer<SummarizeBloc, SummarizeState>(
            bloc: summarizeBloc,
            buildWhen: (previous, current) => current is! SummarizeActionState,
            listenWhen: (previous, current) => current is SummarizeActionState,
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case SummarizeLoadedSuccessState:
                  return Container();
                case SummarizeSuccesfullSummaryState:
                  final succesState = state as SummarizeSuccesfullSummaryState;

                  return SizedBox(
                    child: Center(
                      child: Text(
                        succesState.summarizedText,
                        style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  );

                case SummarizeLoadingState:
                  return Center(
                    child: LinearProgressIndicator(
                      color: Color.fromRGBO(204, 195, 226, 1),
                      value:
                          null, // Set to null for indeterminate progress indicator
                      backgroundColor: Colors.grey,
                    ),
                  );
                default:
                  return Center(
                    child: Text(
                      "Error",
                      style: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  );
              }
            },
          )
        ],
      ),
    );
  }
}
