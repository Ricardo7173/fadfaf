import 'package:flutter/material.dart';
import 'package:orgg_yes_app/domain/entities/message.dart';
import 'package:orgg_yes_app/presentation/providers/chat_provider.dart';
import 'package:orgg_yes_app/presentation/widgets/chat/my_message.dart';
import 'package:orgg_yes_app/presentation/widgets/chat/her_message.dart';
import 'package:orgg_yes_app/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/123588637?v=4'),
          ),
          ),
        title: const Text('Usuario'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {

                  final message = chatProvider.messages[index];

                  return (message.fromWho == FromWho.me) 
                  ? MyMessage(message: message) 
                  : const HerMessage();
              },)
            ),
              MessageFieldBox(
                //onValue: (value) => chatProvider.sendMessage(value),
                onValue: chatProvider.sendMessage,
              )
          ],
        ),
      ),
    );
  }
}