import 'package:flutter/material.dart';

// This is the main FAQ screen widget
class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    // A list of questions and answers for the FAQ
    final List<Map<String, String>> faqs = [
      {
        'question': 'What is this app for?',
        'answer':
            'This app is designed to help disc golfers manage their disc collection, track stats, and get personalized disc recommendations using AI (ChatGPT).',
      },
      {
        'question': 'How do I add a disc to my bag?',
        'answer':
            'Go to the "Bag" section on the navigation bar at the bottom of your screen and tap the ➕ icon. Enter the disc\'s name, speed, glide, turn, fade, and brand, then press "Add".',
      },
      {
        'question': 'What is "DiscGPT"?',
        'answer':
            'DiscGPT is your AI-powered disc golf assistant. You can ask it for:\n- Disc recommendations based on your skill level\n- Tips for different types of throws\n- Comparisons between discs',
      },
      {
        'question': 'Is DiscGPT free to use?',
        'answer':
            'Yes, DiscGPT is included in the app for free. Just open the chat from the menu to start using it.',
      },
      {
        'question': 'Do I need an account to use the app?',
        'answer':
            'You have to create an account to log into the app and use its features. This helps us keep your data safe.',
      },
      {
        'question': 'Is my data private?',
        'answer':
            'Yes. Your disc collection and chat history are only visible to you. We do not sell or share your data.',
      }
    ];
    //The code from here and down is chatgpt generated
    // The overall page layout
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('FAQ',
            style: TextStyle(color: Colors.white)), // App bar title
        backgroundColor: Colors.black, // Dark background color
      ),

      // The body is a scrollable list of expansion tiles (for each FAQ)
      body: ListView.builder(
        itemCount: faqs.length, // Total number of FAQ items
        itemBuilder: (context, index) {
          final faq = faqs[index]; // Current FAQ item
          return ExpansionTile(
            title: Text(
              faq['question']!, // The FAQ question
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(faq['answer']!), // The FAQ answer
              ),
            ],
          );
        },
      ),
    );
  }
}
