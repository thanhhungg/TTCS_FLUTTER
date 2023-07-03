import 'package:flutter/material.dart';
import 'package:flutter_application_2/Iconss.dart';
import 'package:flutter_application_2/Medicine/list_image.dart';
import 'package:flutter_application_2/PickUp/avatar_image.dart';
import 'package:flutter_application_2/PickUp/selected_images.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:photo_manager/photo_manager.dart';

import '../home_page.dart';
import 'data_pickup.dart';
import 'pickup_page.dart';

class ParentsPickUp extends StatefulWidget {
  const ParentsPickUp({
    super.key,
    required this.id,
  });
  final int id;
  @override
  State<ParentsPickUp> createState() => _ParentsPickUpState();
}

class _ParentsPickUpState extends State<ParentsPickUp> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
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
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
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
                            icon:
                                SvgPicture.asset('assets/images/PhoneCall.svg'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          BackButton(
                            color: Colors.deepOrangeAccent,
                          ),
                          Text(
                            'Đón về',
                            style: TextStyle(
                                fontFamily: 'SFPRODISPLAYBOLD', fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border:
                                  Border.all(width: 0.2, color: Colors.grey),
                            ),
                            child: Column(children: [
                              SizedBox(
                                height: 10,
                              ),
                              ClipOval(
                                  child: Stack(children: [
                                selectedAvatar.length != 0
                                    ? AssetEntityImage(
                                        selectedAvatar[0],
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        "assets/images/Frame.jpg",
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 150.0),
                                  child: Stack(
                                    children: [
                                      Opacity(
                                          opacity: 0.5,
                                          child: Container(
                                            height: 50,
                                            width: 190,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                            ),
                                          )),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 75.0),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _PickVideoPhoto(
                                                  context, widget.id);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.photo_camera_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ])),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                dataPickup[widget.id - 1].name_parents,
                                style: TextStyle(
                                    fontFamily: Font.font, fontSize: 20),
                              ),
                              Text(
                                dataPickup[widget.id - 1].name,
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 0.2,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                  child: Text(
                                'Lịch sử đưa đón bé',
                                style: TextStyle(
                                    fontFamily: Font.font, fontSize: 20),
                              )),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        currentTime = DateTime(
                                            currentTime.year,
                                            currentTime.month > 12
                                                ? 1
                                                : currentTime.month,
                                            currentTime.day -
                                                DateTime(
                                                        currentTime.year,
                                                        currentTime.month > 12
                                                            ? 1
                                                            : currentTime.month,
                                                        0)
                                                    .day);
                                      });
                                    },
                                    icon:
                                        Icon(Icons.arrow_back_ios_new_rounded),
                                    iconSize: 20,
                                  ),
                                  Container(
                                    height: 34,
                                    width: MediaQuery.of(context).size.width *
                                        1 /
                                        2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                            width: 0.2, color: Colors.grey)),
                                    child: Center(
                                        child: Text(
                                            'Tháng ${currentTime.month}, ${currentTime.year}',
                                            style: TextStyle(
                                                fontFamily: Font.font,
                                                fontSize: 15))),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        currentTime = DateTime(
                                            currentTime.year,
                                            currentTime.month > 12
                                                ? 1
                                                : currentTime.month,
                                            currentTime.day +
                                                DateTime(
                                                        currentTime.year,
                                                        currentTime.month > 12
                                                            ? 1
                                                            : currentTime.month,
                                                        0)
                                                    .day);
                                      });
                                    },
                                    icon: Icon(Icons.arrow_forward_ios_rounded),
                                    iconSize: 20,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 0.2,
                                color: Colors.grey,
                              ),
                              Flexible(
                                child: ListView.builder(
                                    itemCount: dataPickup.length,
                                    itemBuilder: (context, index) {
                                      if (currentTime.month ==
                                              dataPickup[index].day.month &&
                                          dataPickup[index].id == widget.id) {
                                        return Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        DateFormat.yMd()
                                                            .format(dataPickup[
                                                                    index]
                                                                .day)
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontFamily:
                                                                Font.font,
                                                            fontSize: 18),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${dataPickup[index].name}',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontFamily:
                                                                    Font.font,
                                                                fontSize: 14),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            dataPickup[index]
                                                                .status,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .deepOrange,
                                                                fontFamily:
                                                                    Font.font,
                                                                fontSize: 14),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                              'Đã tạo lúc: 16:12, ${DateFormat.yMd().format(DateTime.now()).toString()}')
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: 0.2,
                                              color: Colors.grey,
                                            )
                                          ],
                                        );
                                      } else {
                                        return SizedBox.shrink();
                                      }
                                    }),
                              ),
                            ])))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _PickVideoPhoto(BuildContext context, int id) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 5),
          child: SelectedImage(id: id),
        );
      });
}
