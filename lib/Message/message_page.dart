import 'package:flutter/material.dart';
import 'package:flutter_application_2/Iconss.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../home_page.dart';
import 'chat.dart';
import 'message_screen.dart';
import 'new_mesage.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  String? selectedValue = 'Mới nhất';
  final List<String> listItems = <String>[
    "Mới nhất",
    "Hôm nay",
    "Tháng này",
    "Tùy chọn khác"
  ];
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(NewMessage(), transition: Transition.fadeIn);
        },
        child: Icon(
          Icons.email_outlined,
          color: Colors.white,
        ),
      ),
      body: Stack(children: [
        Container(
          width: _w,
          height: _h * 1 / 7.5,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 121, 23, 1),
          ),
        ),
        SafeArea(
          child: Column(children: [
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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        BackButton(
                          color: Colors.deepOrangeAccent,
                        ),
                        Text(
                          "Tin nhắn",
                          style: TextStyle(
                              fontFamily: 'SFPRODISPLAYBOLD', fontSize: 18),
                        ),
                      ]),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1,
                                color: Colors.grey,
                                style: BorderStyle.solid)),
                        child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton(
                                  items: listItems
                                      .map((e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: e == selectedValue
                                                ? TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.blue,
                                                    fontFamily:
                                                        'SFPRODISPLAYBOLD')
                                                : TextStyle(
                                                    fontSize: 15,
                                                    fontFamily:
                                                        'SFPRODISPLAYBOLD'),
                                          )))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value;
                                    });
                                  },
                                ))),
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: chatsData.length,
                  itemBuilder: (context, index) => ChatCard(
                      chat: chatsData[index],
                      press: () => Get.to(
                          MessagesScreen(
                            index: index,
                          ),
                          transition: Transition.rightToLeft))),
            )
          ]),
        ),
      ]),
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.chat,
    required this.press,
  });
  final Chat chat;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          width: 342,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey, width: 0.4)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(Iconss.Frame),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      chat.name,
                      style: TextStyle(
                          fontFamily: 'SFPRODISPLAYBOLD', fontSize: 17),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.check_circle,
                      color: Colors.deepOrange,
                      size: 12,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      chat.time,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(chat.lastMessage)
              ],
            ),
            Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
          ]),
        ),
      ),
    );
  }
}
