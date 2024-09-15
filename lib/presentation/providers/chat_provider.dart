import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> addMessage(String message) async {
    if (message.isEmpty) {
      return;
    }

    messageList.add(Message(
      text: message,
      fromWho: FromWho.mine,
    ));

    if (message.endsWith('?')) {
      await herReply();
    }

    notifyListeners();
    moveToBottom();
  }

  Future herReply() async {
    final message = await getYesNoAnswer.getAnswer();
    messageList.add(message);
    notifyListeners();
    moveToBottom();
  }

  void moveToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
