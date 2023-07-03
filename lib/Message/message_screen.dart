import 'package:flutter/material.dart';
import 'package:flutter_application_2/Iconss.dart';
import 'package:flutter_application_2/Message/chat.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../home_page.dart';
import 'chat_message.dart';
import 'vimessages.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key, required this.index});
  final int index;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    var _msg = TextEditingController();
    timeago.setLocaleMessages('en', ViMessages());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            width: _w,
            height: _h * 1 / 7.5,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 121, 23, 1),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '    KIDS\nONLINEs',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'QueulatUni',
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Trường mầm non Họa Mi',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SFPRODISPLAYBOLD',
                          fontSize: 15,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          mySheet(context);
                        },
                        icon: SvgPicture.asset('assets/images/PhoneCall.svg'),
                      ),
                    ],
                  ),
                ),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        BackButton(
                          color: Colors.deepOrangeAccent,
                        ),
                        Text(
                          'Lời nhắn',
                          style: TextStyle(
                              fontFamily: 'SFPRODISPLAYBOLD', fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 15, right: 10, bottom: 5),
                    child: Column(
                      children: [
                        Container(
                            width: _w,
                            height: _h * 1 / 11,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFFe8e8e8),
                                    blurRadius: 10,
                                    offset: Offset(0, -3))
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(Iconss.Frame),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          chatsData[widget.index].name,
                                          style: TextStyle(
                                              fontFamily: 'SFPRODISPLAYBOLD',
                                              fontSize: 17),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.deepOrange,
                                          size: 12,
                                        ),
                                      ],
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Text(
                                        chatsData[widget.index].position,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: _w,
                          height: _h * 1 / 1.7,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFFe8e8e8),
                                    blurRadius: 10.0,
                                    offset: Offset(0, 8)),
                              ]),
                          child: ListView.builder(
                              itemCount: demoChatMessages.length,
                              itemBuilder: (context, index) => Messages(
                                    messages: demoChatMessages[index],
                                  )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: chatsData[widget.index].name != 'KidsOnline'
                        ? Container(
                            child: TextFormField(
                                controller: _msg,
                                decoration: InputDecoration(
                                  prefixIconColor: Colors.grey,
                                  suffixIconColor:
                                      MaterialStateColor.resolveWith(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.focused)) {
                                      return Colors.deepOrange;
                                    }
                                    if (states.contains(MaterialState.error)) {
                                      return Colors.red;
                                    }
                                    return Colors.grey;
                                  }),
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.camera_alt_outlined),
                                    onPressed: () {},
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.send_sharp),
                                    onPressed: () {
                                      setState(() {
                                        demoChatMessages.add(ChatMessages(
                                            text: _msg.text,
                                            time: DateTime.now(),
                                            isSender: true));
                                      });
                                    },
                                  ),
                                  hintText: 'Nhập nội dung tin nhắn',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontFamily: 'SFPRODISPLAYBOLD',
                                      color: Color.fromRGBO(60, 60, 67, 0.6)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(224, 224, 224, 1),
                                        width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(224, 224, 224, 1),
                                          width: 2)),
                                )))
                        : Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              width: _w,
                              height: _h * 1 / 15,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5)),
                              child: Opacity(
                                opacity: 0.5,
                                child: Text(
                                    'Bạn hiện không thể trả lời tin nhắn này',
                                    style: TextStyle(
                                        fontFamily: 'SFPRODISPLAYBOLD',
                                        color: Color.fromRGBO(60, 60, 67, 0.6),
                                        fontSize: 17)),
                              ),
                            ),
                          ),
                  ),
                ])
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class Messages extends StatelessWidget {
  const Messages({
    super.key,
    required this.messages,
  });
  final ChatMessages messages;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            messages.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: messages.isSender
                    ? BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      )
                    : BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                color: messages.isSender
                    ? Color.fromRGBO(242, 242, 242, 1)
                    : Color.fromRGBO(255, 244, 229, 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  messages.text,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    "${timeago.format(messages.time)}",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
