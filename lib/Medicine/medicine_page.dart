import 'package:flutter/material.dart';
import 'package:flutter_application_2/Health/bar_chart.dart';
import 'package:flutter_application_2/Iconss.dart';
import 'package:flutter_application_2/Medicine/create_medicine.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../home_page.dart';
import 'list_medicine.dart';
import 'medicinne_daily.dart';

class MedicinePage extends StatefulWidget {
  const MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  String? selectedValue = 'Mới nhất';
  final List<String> listItems = <String>[
    "Mới nhất",
    "Đã xác nhận",
    "Chưa xác nhận",
  ];
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreateMedicine(), transition: Transition.rightToLeft);
        },
        child: Icon(
          Icons.add_circle_rounded,
          color: Colors.white,
          size: 30,
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
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BackButton(
                            color: Colors.deepOrangeAccent,
                          ),
                          Text(
                            "Dặn thuốc",
                            style: TextStyle(
                                fontFamily: 'SFPRODISPLAYBOLD', fontSize: 18),
                          ),
                        ],
                      ),
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
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listMedicine.length,
                itemBuilder: (context, index) => MedicineView(
                  medicine: listMedicine[index],
                ),
              ),
            )
          ]),
        ),
      ]),
    );
  }
}

class MedicineView extends StatefulWidget {
  const MedicineView({
    super.key,
    required this.medicine,
  });
  final Medicine medicine;

  @override
  State<MedicineView> createState() => _MedicineViewState();
}

class _MedicineViewState extends State<MedicineView> {
  double _opacity = 1;
  Icon _icon = Icon(
    Icons.notifications,
    color: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _opacity = 0.5;
          _icon = Icon(
            Icons.notifications_off,
            color: Colors.grey,
          );
          Get.to(
              MedicineDaily(
                medicines: widget.medicine,
              ),
              transition: Transition.rightToLeft);
        });
      },
      child: Opacity(
        opacity: _opacity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 10,
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/images/image_medicine.png"),
                                radius: 33,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat.yMd()
                                      .format(widget.medicine.date)
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: 'SFPRODISPLAYBOLD',
                                      fontSize: 18),
                                ),
                                Text(
                                  '${widget.medicine.status} bởi ${widget.medicine.teacher}',
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      _icon,
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 14, top: 8, bottom: 8, right: 8),
                    child: Container(
                      width: 300,
                      height: 0.3,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            widget.medicine.message,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        SvgPicture.asset('assets/images/pills.svg'),
                        Text('  ${widget.medicine.quantity} loại'),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
