import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'text_part_event.dart';
part 'text_part_state.dart';

class TextPartBloc extends Bloc<TextPartEvent, TextPartState> {
  TextPartBloc() : super(TextPartInitial()) {
    on<TextPartInitialEvent>(textPartInitialEvent);

    on<TextPartSummarizeButtonClickedEvent>(
        textPartSummarizeButtonClickedEvent);

    on<TextPartClassifyButtonClickedEvent>(textPartClassifyButtonClickedEvent);

    on<TextPartGenerateButtonClickedEvent>(textPartGenerateButtonClickedEvent);
  }

  FutureOr<void> textPartInitialEvent(
      TextPartInitialEvent event, Emitter<TextPartState> emit) {
    print("This is a text part initial event");

    emit(TextPartLoadedSuccessState());
  }

  FutureOr<void> textPartSummarizeButtonClickedEvent(
      TextPartSummarizeButtonClickedEvent event, Emitter<TextPartState> emit) {
    print("Text part summarize button clicked event");

    emit(TextPartSummarizeState());
    emit(TextPartSummarizeActionState());
  }

  FutureOr<void> textPartClassifyButtonClickedEvent(
      TextPartClassifyButtonClickedEvent event, Emitter<TextPartState> emit) {
    print("Text part classify button clicked event");

    emit(TextPartClassifyState());
    emit(TextPartClassifyActionState());
  }

  FutureOr<void> textPartGenerateButtonClickedEvent(
      TextPartGenerateButtonClickedEvent event, Emitter<TextPartState> emit) {
    print("Text part generate utton clicked event");

    emit(TextPartGenerateState());
    emit(TextPartGenerateActionState());
  }
}
