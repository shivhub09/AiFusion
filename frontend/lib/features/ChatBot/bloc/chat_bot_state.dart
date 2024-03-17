part of 'chat_bot_bloc.dart';

@immutable
sealed class ChatBotState {}

abstract class ChatBotActionState extends ChatBotState {}

final class ChatBotInitial extends ChatBotState {}

final class ChatBotLoadingState extends ChatBotState {}

final class ChatBotLoadedSuccessState extends ChatBotState {}

final class ChatBotChatButtonPlusState extends ChatBotState {}

final class ChatBotChatState extends ChatBotState {}

final class ChatBotEnterButtonClickedState extends ChatBotActionState {}
