import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/ChatBot/bloc/chat_bot_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage();

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final ChatBotBloc chatBotBloc = ChatBotBloc();
  final TextEditingController _chatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    chatBotBloc.add(ChatBotInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: Center(child: Text('ChatBot')),
        titleTextStyle: GoogleFonts.urbanist(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      ),
      body: Stack(
        children: [
          BlocConsumer<ChatBotBloc, ChatBotState>(
            bloc: chatBotBloc,
            buildWhen: (previous, current) => current is! ChatBotActionState,
            listenWhen: (previous, current) => current is ChatBotActionState,
            listener: (context, state) {
              // Handle listener actions here if needed
            },
            builder: (context, state) {
              if (state is ChatBotLoadedSuccessState) {
                return Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: () {
                      chatBotBloc.add(ChatBotPlusPlusBUttonClickedEvent());
                    },
                    child: Icon(
                      Icons.chat_bubble_outline,
                      color: Color.fromRGBO(204, 195, 226, 1),
                    ),
                  ),
                );
              } else if (state is ChatBotChatState) {
                return Positioned(
                  bottom: 20,
                  right: 20,
                  left: 20,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.grey.shade900, Colors.black87],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              child: TextFormField(
                                controller: _chatController,
                                decoration: InputDecoration(
                                  hintText: 'Type a message...',
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.urbanist(
                                      color: Colors.grey, fontSize: 16),
                                ),
                                style: GoogleFonts.urbanist(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.send,
                              color: Color.fromRGBO(204, 195, 226, 1),
                            ),
                            onPressed: () {
                              // Handle send button press action
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
