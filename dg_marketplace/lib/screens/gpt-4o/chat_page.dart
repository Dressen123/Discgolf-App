import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:dg_marketplace/screens/gpt-4o/consts.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _openAI = OpenAI.instance.build(
    token: OPENAI_API_KEY,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(
        seconds: 5,
      ),
    ),
    enableLog: true,
  );

  final ChatUser _currentUser = ChatUser(
    id: '1',
    firstName: 'Ola',
    lastName: 'Normann',
  );

  final ChatUser _gptChatUser = ChatUser(
    id: '2',
    firstName: 'Disc',
    lastName: 'GPT',
  );

  List<ChatMessage> _messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(0, 166, 126, 1),
          title: const Text(
            'DiscGPT',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: DashChat(
            currentUser: _currentUser,
            messageOptions: const MessageOptions(
                currentUserContainerColor: Colors.black,
                containerColor: Color.fromRGBO(0, 166, 126, 1),
                textColor: Colors.white),
            onSend: (ChatMessage m) {
              getChatResponse(m);
            },
            messages: _messages));
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
    });
    List<Map<String, dynamic>> _messagesHistory = _messages.reversed.map((m) {
      return {
        "role": m.user == _currentUser ? "user" : "assistant",
        "content": m.text
      };
    }).toList();
    final request = ChatCompleteText(
        model: Gpt4oMiniChatModel(), messages: _messagesHistory, maxToken: 200);
    final response = await _openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages.insert(
              0,
              ChatMessage(
                  user: _gptChatUser,
                  createdAt: DateTime.now(),
                  text: element.message!.content));
        });
      }
    }
  }
}
