part of 'chat_bot_bloc.dart';

@immutable
sealed class ChatBotEvent {}

final class ChatBotInitialEvent extends ChatBotEvent {}

final class ChatBotPlusPlusBUttonClickedEvent extends ChatBotEvent {}

final class ChatBotChatSentButtonClickedEvent extends ChatBotEvent {}
