part of 'summarize_bloc.dart';

@immutable
sealed class SummarizeEvent {}

class SummarizeInitialEvent extends SummarizeEvent {}

class SummarizeButtonClickedEvent extends SummarizeEvent {
  final String text;

  SummarizeButtonClickedEvent({required this.text});

}
