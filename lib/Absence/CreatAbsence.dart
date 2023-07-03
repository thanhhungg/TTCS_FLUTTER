import 'package:flutter/material.dart';
import 'package:flutter_application_2/Absence/AbsencePage.dart';
import 'package:flutter_application_2/Absence/absence_list.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../home_page.dart';

class CreateAbsence extends StatefulWidget {
  const CreateAbsence({super.key});

  @override
  State<CreateAbsence> createState() => _CreateAbsenceState();
}

class _CreateAbsenceState extends State<CreateAbsence> {
  bool status = false;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  List<DateTime> _selectedList = [];
  //  CalendarController _calendarController;

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
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
            child: Column(children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                height: 20,
              ),
              Row(
                children: [
                  BackButton(
                    color: Colors.deepOrangeAccent,
                  ),
                  Text(
                    'Xin nghỉ',
                    style:
                        TextStyle(fontFamily: 'SFPRODISPLAYBOLD', fontSize: 18),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                    padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFe8e8e8),
                              blurRadius: 10.0,
                              offset: Offset(0, 0)),
                        ]),
                    child: TableCalendar(
                      focusedDay: _focusedDay,
                      firstDay: DateTime.utc(2010, 3, 30),
                      lastDay: DateTime.utc(2030, 3, 30),
                      locale: 'en_US',
                      rowHeight: 40,
                      headerStyle: HeaderStyle(
                        titleTextFormatter: (date, locale) =>
                            DateFormat.yMd(locale).format(date),
                        formatButtonVisible: false,
                        headerPadding: EdgeInsets.symmetric(horizontal: 30),
                        titleCentered: true,
                      ),

                      // calendarFormat: CalendarFormat.month,
                      daysOfWeekStyle: DaysOfWeekStyle(
                          weekendStyle: TextStyle(color: Colors.deepOrange)),
                      calendarStyle: CalendarStyle(
                        weekendTextStyle: TextStyle(color: Colors.deepOrange),
                        todayTextStyle: TextStyle(color: Colors.black),
                        todayDecoration: BoxDecoration(
                            color: Color.fromRGBO(255, 227, 191, 1),
                            shape: BoxShape.circle),
                        selectedDecoration: BoxDecoration(
                            color: Color.fromRGBO(255, 195, 18, 1),
                            shape: BoxShape.circle),
                        selectedTextStyle: TextStyle(color: Colors.black),
                      ),
                      ////////////////////////////////////////////////////////////////
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(_selectedDate, selectedDay)) {
                          // Call `setState()` when updating the selected day
                          setState(() {
                            _selectedDate = selectedDay;
                            _focusedDay = focusedDay;

                            if (!_selectedList.contains(_selectedDate)) {
                              _selectedList.add(_selectedDate!);
                            }
                          });
                        }
                      },
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDate, day);
                      },
                      ////////////////////////////////////////////////////////////////
                    )),
              ),
              SizedBox(
                height: 0.5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  height: _h * 1 / 5,
                  width: _w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 4.0,
                            offset: Offset(0, 10)),
                      ]),
                  child: Column(
                    children: [
                      _selectedList.length != 0
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, right: 220, bottom: 10),
                                  child: Text(
                                    'Ngày xin nghỉ (${_selectedList.length})',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                SingleChildScrollView(
                                    child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Container(
                                        height: 40,
                                        width: _w,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            // shrinkWrap: true,
                                            itemCount: _selectedList.length,
                                            itemBuilder: (context, index) =>
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    250,
                                                                    250)),
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                                DateFormat.yMd()
                                                                    .format(
                                                                  _selectedList[
                                                                      index],
                                                                ),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .deepOrangeAccent)),
                                                            IconButton(
                                                              icon: Icon(
                                                                Icons
                                                                    .remove_circle,
                                                                color: Colors
                                                                    .grey[400],
                                                              ),
                                                              onPressed: () {
                                                                setState(() {
                                                                  _selectedList
                                                                      .removeAt(
                                                                          index);
                                                                });
                                                              },
                                                            ),
                                                          ],
                                                        )),
                                                  ],
                                                )),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                )),
                              ],
                            )
                          : SizedBox(
                              height: 10,
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Nhập lý do xin nghỉ',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(189, 189, 189, 1))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    if (_selectedList.length != 0)
                      // ignore: curly_braces_in_flow_control_structures
                      setState(() {
                        for (var item in _selectedList) {
                          listAbsence.add(Absence(
                              day: item,
                              request: 'Nghỉ có phép',
                              status: 'Đã xác nhận',
                              id: 0));
                        }
                        Get.to(AbsencePage(), transition: Transition.fade);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Đã gửi thành công!'),
                              Text('Đang chờ nhà trường xác nhận!'),
                            ],
                          ),
                        )));
                      });
                  },
                  borderRadius: BorderRadius.circular(32),
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: _selectedDate != null && _selectedList.length != 0
                          ? Color.fromRGBO(255, 121, 23, 1)
                          : Color.fromRGBO(255, 215, 185, 1),
                    ),
                    child: Text(
                      'Tạo đơn xin nghỉ',
                      style: TextStyle(
                        fontFamily: 'SFPRODISPLAYBOLD',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
