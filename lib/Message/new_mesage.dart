import 'package:flutter/material.dart';
import 'package:flutter_application_2/Message/message_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Iconss.dart';
import '../home_page.dart';
import 'chat.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  List User = chatsData;
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
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
                              icon: SvgPicture.asset(
                                  'assets/images/PhoneCall.svg'),
                            ),
                          ],
                        ),
                      ),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'Tạo lời nhắn mới',
                                      style: TextStyle(
                                          fontFamily: 'SFPRODISPLAYBOLD',
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 1,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              width: _w,
                              height: _h * 1 / 11,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: TextField(
                                onChanged: searchUser,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Tìm người nhận tin nhắn',
                                  prefixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Container(
                              width: _w,
                              height: _h * 1 / 2,
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
                              child: Column(
                                children: [
                                  Expanded(
                                      child: ListView.builder(
                                          itemCount: User.length,
                                          itemBuilder: (context, index) =>
                                              UserMessages(
                                                chat: User[index],
                                                press: () => Get.to(
                                                    MessagesScreen(
                                                        index: index),
                                                    transition:
                                                        Transition.rightToLeft),
                                              ))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String removeDiacritics(String input) {
    final diacriticCharacters = {
      'a': [
        'á',
        'à',
        'ả',
        'ã',
        'ạ',
        'ă',
        'ắ',
        'ằ',
        'ẳ',
        'ẵ',
        'ặ',
        'â',
        'ấ',
        'ầ',
        'ẩ',
        'ẫ',
        'ậ'
      ],
      'e': ['é', 'è', 'ẻ', 'ẽ', 'ẹ', 'ê', 'ế', 'ề', 'ể', 'ễ', 'ệ'],
      'i': ['í', 'ì', 'ỉ', 'ĩ', 'ị'],
      'o': [
        'ó',
        'ò',
        'ỏ',
        'õ',
        'ọ',
        'ô',
        'ố',
        'ồ',
        'ổ',
        'ỗ',
        'ộ',
        'ơ',
        'ớ',
        'ờ',
        'ở',
        'ỡ',
        'ợ'
      ],
      'u': ['ú', 'ù', 'ủ', 'ũ', 'ụ', 'ư', 'ứ', 'ừ', 'ử', 'ữ', 'ự'],
      'y': ['ý', 'ỳ', 'ỷ', 'ỹ', 'ỵ'],
      'd': ['đ']
    };

    for (var key in diacriticCharacters.keys) {
      for (var char in diacriticCharacters[key]!) {
        input = input.replaceAll(char, key);
      }
    }

    return input;
  }

  void searchUser(String value) {
    final input = removeDiacritics(value.toLowerCase());

    final suggestions = chatsData
        .where((element) =>
            removeDiacritics(element.name.toLowerCase()).contains(input))
        .toList();

    setState(() {
      User = suggestions;
    });
  }
}

class UserMessages extends StatelessWidget {
  const UserMessages({
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
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              //                   <--- left side
              color: Colors.grey,
              width: 0.2,
            ),
            bottom: BorderSide(
              //                   <--- left side
              color: Colors.grey,
              width: 0.2,
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            CircleAvatar(
              backgroundImage: AssetImage(Iconss.Frame),
              radius: 30,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
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
                  ],
                ),
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    chat.position,
                    style:
                        TextStyle(fontFamily: 'SFPRODISPLAYBOLD', fontSize: 17),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
