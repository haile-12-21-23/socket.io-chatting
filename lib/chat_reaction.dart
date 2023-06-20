import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ChatMessage extends StatefulWidget {
  const ChatMessage({super.key});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  int _currentReaction = 0;
  List<String> _reactions = [
    '😀', // Emoji 1
    '😄', // Emoji 2
    '😍', // Emoji 3
    '👍', // Emoji 4
    '❤️', // Emoji 5
  ];
  List<String> _messages = [
    'Hello',
    'How are you?',
    'I am good, thank you!',
  ];
  TextEditingController messageController = TextEditingController();
  String _selectedReaction = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: InkWell(
                    onTap: () {
                      showBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 200,
                            child: GridView.builder(
                              itemCount: _reactions.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 6),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedReaction = _reactions[index];
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                      child: Text(
                                    _reactions[index],
                                    style: const TextStyle(fontSize: 24),
                                  )),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      _messages[index],
                    ),
                  ),
                  trailing: Text(_selectedReaction),
                );
              },
            ),
          ),
          const Divider(
            height: 1,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    hintText: 'type a message...',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      _messages.add(value);
                    });
                    messageController.clear();
                    _selectedReaction = '';
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  showBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 200,
                        child: GridView.builder(
                          itemCount: _reactions.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedReaction = _reactions[index];
                                });
                                Navigator.pop(context);
                              },
                              child: Center(
                                  child: Text(
                                _reactions[index],
                                style: const TextStyle(fontSize: 24),
                              )),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.emoji_emotions),
              )
            ],
          ),
          TextButton(
              onPressed: _handleSignIn,
              child: const Text('Continue With Goggle'))
        ],
      ),
    );
  }

  // ignore: prefer_final_fields
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      throw error.toString();
    }
  }
}
