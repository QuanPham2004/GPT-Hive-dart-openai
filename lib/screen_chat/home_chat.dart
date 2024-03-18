import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../hive_model/chat_item.dart';
import 'open_key.dart';
import 'chat_page.dart';

class HomeChat extends StatefulWidget {
  const HomeChat({super.key});

  @override
  State<HomeChat> createState() => _HomeState();
}

class _HomeState extends State<HomeChat> {
  List<ChatItem> chats = [];

  @override
  void initState() {
    super.initState();
    setApiKeyOnStartup();
  }

  // Run API openAI
  Future<void> setApiKeyOnStartup() async {
    OpenAI.apiKey = spOpenApiKey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assistants ESAP'),
      ),
      body: ValueListenableBuilder(
          // Update UI Hive box 'chats' when change.
          valueListenable: Hive.box('chats').listenable(),
          builder: (context, box, _) {
            if (box.isEmpty) return const Center(child: Text('No chats yet'));
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                final chatItem = box.getAt(index) as ChatItem;
                return ListTile(
                  title: Text(chatItem.title),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return ChatPage(chatItem: chatItem);
                    }));
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      box.deleteAt(index);
                    },
                  ),
                );
              },
            );
          }),
      // Create new chat
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final messagesBox = Hive.box('messages');
          final newChatTitle =
              'New Chat ${DateFormat('d/M/y').format(DateTime.now())}';
          var chatItem = ChatItem(newChatTitle, HiveList(messagesBox));

          // add to hive
          Hive.box('chats').add(chatItem);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatPage(chatItem: chatItem),
            ),
          );
        },
        label: const Text('New chat'),
        icon: const Icon(Icons.message_outlined),
      ),
    );
  }
}
