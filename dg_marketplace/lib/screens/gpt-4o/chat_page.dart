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
  // Initialize OpenAI instance with the API key
  final _openAI = OpenAI.instance.build(
    token: OPENAI_API_KEY,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(
        seconds: 5,
      ),
    ),
    enableLog: true,
  );

  // Define the current user for the chat interface
  final ChatUser _currentUser = ChatUser(
    id: '1',
    firstName: 'Ola',
    lastName: 'Normann',
  );

  // Define the AI user for the chat interface (DiscGPT)
  final ChatUser _gptChatUser = ChatUser(
    id: '2',
    firstName: 'Disc',
    lastName: 'GPT',
  );

  List<ChatMessage> _messages =
      <ChatMessage>[]; // List to hold the chat messages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(34, 37, 41, 1),
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'DiscGPT',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: DashChat(
            currentUser: _currentUser, // Set the current user for the chat
            messageOptions: const MessageOptions(
                currentUserContainerColor: Colors.black,
                containerColor: Color.fromRGBO(0, 166, 126, 1),
                textColor: Colors.white),
            onSend: (ChatMessage m) {
              getChatResponse(m); // Send message to OpenAI for response
            },
            messages: _messages)); // Display the list of chat messages
  }

  // Function to send and receive messages from OpenAI
  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m); // Add the user's message to the chat
    });

    // System message to instruct the AI to only respond about disc golf
    String systemMessage =
        "You are DiscGPT, an expert in disc golf. Your knowledge is strictly limited to disc golf, including discs, techniques, strategies, and events related to the sport. Please respond only with information about disc golf.";

    // Convert the chat history into a format expected by the OpenAI API
    List<Map<String, String>> _messagesHistory = _messages.reversed.map((m) {
      return {
        "role": m.user == _currentUser
            ? "user"
            : "assistant", // Define who is sending the message
        "content": m.text // The content of the message
      };
    }).toList();

    // Prepend the system message at the beginning of the conversation
    _messagesHistory.insert(0, {
      "role": "system",
      "content":
          systemMessage, // Add the system message that sets context for AI
    });

    // Request a response from the OpenAI model (GPT-4)
    final request = ChatCompleteText(
        model: Gpt4oMiniChatModel(), messages: _messagesHistory, maxToken: 200);

    final response = await _openAI.onChatCompletion(request: request);

    // Insert the AI response into the chat
    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages.insert(
              0,
              ChatMessage(
                  user: _gptChatUser, // AI (DiscGPT) is responding
                  createdAt: DateTime.now(),
                  text: element.message!.content)); // AI's response content
        });
      }
    }
  }
}
