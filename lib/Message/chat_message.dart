import 'package:get/get.dart';

enum ChatMessagesType { text, audio, image, video }

enum MessagesStatus { not_send, not_view, viewed }

class ChatMessages {
  final String text;
  final DateTime time;
  final ChatMessagesType? messagesType;
  final MessagesStatus? messagesStatus;
  final bool isSender;
  ChatMessages(
      {required this.text,
      required this.time,
      this.messagesType,
      this.messagesStatus,
      required this.isSender});
}

List demoChatMessages = [
  ChatMessages(
      text:
          'Nay bé hơi bị ho, anh chị để ý bé nhé,\nnay bé không mang áo khoác',
      time: DateTime.parse('2023-05-21 10:30:00'),
      messagesType: ChatMessagesType.text,
      messagesStatus: MessagesStatus.viewed,
      isSender: false),
  ChatMessages(
      text:
          'Nay bé hơi bị ho, anh chị để ý bé nhé,\nnay bé không mang áo khoác',
      time: DateTime.parse('2023-05-21 10:30:00'),
      messagesType: ChatMessagesType.text,
      messagesStatus: MessagesStatus.viewed,
      isSender: false),
  ChatMessages(
      text: 'Vậy hả cô ',
      time: DateTime.parse('2023-05-21 10:40:00'),
      messagesType: ChatMessagesType.text,
      messagesStatus: MessagesStatus.viewed,
      isSender: true)
];
