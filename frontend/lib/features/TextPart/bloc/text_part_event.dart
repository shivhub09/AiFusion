part of 'text_part_bloc.dart';

@immutable
sealed class TextPartEvent {}

class TextPartInitialEvent extends TextPartEvent {}

class TextPartSummarizeButtonClickedEvent extends TextPartEvent {}

class TextPartGenerateButtonClickedEvent extends TextPartEvent {}

class TextPartClassifyButtonClickedEvent extends TextPartEvent {}

