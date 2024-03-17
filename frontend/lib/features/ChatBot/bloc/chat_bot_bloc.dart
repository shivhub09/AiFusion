import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_bot_event.dart';
part 'chat_bot_state.dart';

class ChatBotBloc extends Bloc<ChatBotEvent, ChatBotState> {
  ChatBotBloc() : super(ChatBotInitial()) {
    on<ChatBotInitialEvent>(chatBotInitialEvent);

    on<ChatBotPlusPlusBUttonClickedEvent>(chatBotPlusPlusBUttonClickedEvent);
  }

  FutureOr<void> chatBotInitialEvent(
      ChatBotInitialEvent event, Emitter<ChatBotState> emit) {
    print(
        "This is the block for the chatbot screen which is being loaded . . . ");
    emit(ChatBotLoadedSuccessState());
  }

  FutureOr<void> chatBotPlusPlusBUttonClickedEvent(
      ChatBotPlusPlusBUttonClickedEvent event, Emitter<ChatBotState> emit) {
    print(
        "This is the event ewhrn the plus button is clicked and the chat button will pop up");
    emit(ChatBotChatState());
  }
}
