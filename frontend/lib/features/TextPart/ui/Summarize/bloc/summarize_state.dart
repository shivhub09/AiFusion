part of 'summarize_bloc.dart';

@immutable
sealed class SummarizeState {}

abstract class SummarizeActionState extends SummarizeState {}

final class SummarizeInitial extends SummarizeState {}

class SummarizeLoadedSuccessState extends SummarizeState {}

class SummarizeLoadingState extends SummarizeState {}

class SummarizeSuccesfullSummaryState extends SummarizeState {
  final String summarizedText;

  SummarizeSuccesfullSummaryState({required this.summarizedText});

}
