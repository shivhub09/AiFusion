import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:frontend/services/summarizeFunction.dart';
import 'package:meta/meta.dart';

part 'summarize_event.dart';
part 'summarize_state.dart';

class SummarizeBloc extends Bloc<SummarizeEvent, SummarizeState> {
  SummarizeBloc() : super(SummarizeInitial()) {
    on<SummarizeInitialEvent>(summarizeInitialEvent);

    on<SummarizeButtonClickedEvent>(summarizeButtonClickedEvent);
  }

  FutureOr<void> summarizeInitialEvent(
      SummarizeInitialEvent event, Emitter<SummarizeState> emit) {
    print("Summarize initial event");
    emit(SummarizeLoadedSuccessState());
  }

  FutureOr<void> summarizeButtonClickedEvent(
      SummarizeButtonClickedEvent event, Emitter<SummarizeState> emit) async {
    print("summarize button clicked event");
    emit(SummarizeLoadingState());
    Map<String, dynamic> summary = await summarize(event.text);

    // print(summary["summarized_text"]["summary_text"]);
    if (summary["success"] == true) {
      emit(SummarizeSuccesfullSummaryState(
          summarizedText: summary["summarized_text"]["summary_text"]));
    }
  }
}
