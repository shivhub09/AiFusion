part of 'text_part_bloc.dart';

@immutable
sealed class TextPartState {}

abstract class TextPartActionState extends TextPartState {}

final class TextPartInitial extends TextPartState {}

class TextPartLoadedSuccessState extends TextPartState {}

class TextPartErrorState extends TextPartState {}

class TextPartSummarizeState extends TextPartState {}

class TextPartGenerateState extends TextPartState {}

class TextPartClassifyState extends TextPartState {}

// action states

class TextPartGenerateActionState extends TextPartActionState {}

class TextPartSummarizeActionState extends TextPartActionState {}

class TextPartClassifyActionState extends TextPartActionState {}
