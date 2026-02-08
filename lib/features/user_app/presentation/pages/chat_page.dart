import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'call_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> messages = [
    {
      'text': 'Are you coming?',
      'isMe': true,
      'time': '8:10 pm',
      'showAvatar': true,
    },
    {
      'text': 'Hay, Congratulation for order',
      'isMe': false,
      'time': '8:11 pm',
      'showAvatar': true,
    },
    {
      'text': 'Hey Where are you now?',
      'isMe': true,
      'time': '8:11 pm',
      'showAvatar': false,
    },
    {
      'text': 'I\'m Coming , just wait ...',
      'isMe': false,
      'time': '8:12 pm',
      'showAvatar': false,
    },
    {
      'text': 'Hurry Up, Man',
      'isMe': true,
      'time': '8:12 pm',
      'showAvatar': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF6F6F6),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: AppColors.secondary,
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text(
          "Robert Fox",
          style: TextStyle(
            color: AppColors.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CallPage()),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.call,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isMe = msg['isMe'] as bool;
                final showAvatar = msg['showAvatar'] as bool;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: isMe
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (!isMe && showAvatar) ...[
                        const CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=1974&auto=format&fit=crop',
                          ),
                        ),
                        const SizedBox(width: 8),
                      ] else if (!isMe && !showAvatar) ...[
                        const SizedBox(width: 38),
                      ],
                      Flexible(
                        child: Column(
                          crossAxisAlignment: isMe
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: isMe
                                    ? AppColors.primary
                                    : const Color(0xFFF6F6F6),
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(15),
                                  topRight: const Radius.circular(15),
                                  bottomLeft: Radius.circular(isMe ? 15 : 0),
                                  bottomRight: Radius.circular(isMe ? 0 : 15),
                                ),
                              ),
                              child: Text(
                                msg['text'],
                                style: TextStyle(
                                  color: isMe
                                      ? Colors.white
                                      : AppColors.secondary,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              msg['time'],
                              style: const TextStyle(
                                color: AppColors.grey,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isMe && showAvatar) ...[
                        const SizedBox(width: 8),
                        const CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=2080&auto=format&fit=crop',
                          ),
                        ),
                      ] else if (isMe && !showAvatar) ...[
                        const SizedBox(width: 38),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
          _buildInputSection(),
        ],
      ),
    );
  }

  Widget _buildInputSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.sentiment_satisfied_alt_outlined,
                    color: AppColors.grey,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: "Write somethings",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: AppColors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.send_outlined, color: AppColors.primary),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
