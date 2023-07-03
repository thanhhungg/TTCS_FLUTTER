import 'package:flutter/material.dart';
import 'package:flutter_application_2/Absence/CreatAbsence.dart';
import 'package:flutter_application_2/Iconss.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_localizations/flutter_localizations.dart'
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../Feature/feature_page.dart';
import '../home_page.dart';
import 'absence_list.dart';

class AbsencePage extends StatefulWidget {
  const AbsencePage({
    super.key,
  });

  @override
  State<AbsencePage> createState() => _AbsencePageState();
}

class _AbsencePageState extends State<AbsencePage> {
  bool status = false;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _selectedDate = _focusedDay;
  // }
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreateAbsence(), transition: Transition.fade);
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
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 250, 244, 1),
              ),
              child: Row(
                children: [
                  BackButton(
                    color: Colors.deepOrange,
                  ),
                  Text(
                    "Xin nghỉ",
                    style: TextStyle(fontFamily: Font.font, fontSize: 18),
                  )
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 250, 244, 1),
                ),
                child: TableCalendar(
                  holidayPredicate: (days) {
                    // Every 20th day of the month will be treated as a holiday
                    for (Absence item in listAbsence) {
                      if (days.year == item.day.year &&
                          days.month == item.day.month &&
                          days.day == item.day.day) return true;
                    }
                    return false;
                  },
                  calendarBuilders: CalendarBuilders(
                    holidayBuilder: (context, days, focusedDay) {
                      for (Absence item in listAbsence) {
                        if (days.year == item.day.year &&
                            days.month == item.day.month &&
                            days.day == item.day.day) {
                          return Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                                color: item.id == 0
                                    ? Color.fromRGBO(39, 174, 96, 1)
                                    : item.id == 1
                                        ? Color.fromRGBO(255, 89, 89, 1)
                                        : item.id == 2
                                            ? Color.fromRGBO(255, 195, 18, 1)
                                            : Color.fromRGBO(0, 92, 200, 1),
                                shape: BoxShape.circle),
                            child: Center(
                                child: Text(
                              '${days.day}',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: item.id != 2
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.normal),
                            )),
                          );
                        }
                      }
                    },
                  ),
                  locale: 'en_US',
                  focusedDay: _focusedDay,
                  firstDay: DateTime.utc(2010, 3, 30),
                  lastDay: DateTime.utc(2030, 3, 30),
                  rowHeight: 40,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    headerPadding: EdgeInsets.symmetric(horizontal: 60),
                    titleCentered: true,
                  ),
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
                    _show(context, selectedDay);
                    if (!isSameDay(_selectedDate, selectedDay)) {
                      // Call `setState()` when updating the selected day
                      setState(() {
                        _selectedDate = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDate, day);
                  },
                )),
            Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 250, 244, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Color.fromRGBO(39, 174, 96, 1)),
                    ),
                    Opacity(opacity: 0.5, child: Text(' Nghỉ có phép   ')),
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Color.fromRGBO(255, 89, 89, 1)),
                    ),
                    Opacity(opacity: 0.5, child: Text(' Nghỉ không phép   ')),
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Color.fromRGBO(255, 195, 18, 1)),
                    ),
                    Opacity(opacity: 0.5, child: Text(' Đi muộn')),
                  ],
                )),
            Container(
              height: 45,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey, width: 0.3),
                      bottom: BorderSide(color: Colors.grey, width: 0.3))),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Xem tất cả các ngày', style: TextStyle(fontSize: 15)),
                    FlutterSwitch(
                      width: 60.0,
                      height: 30.0,
                      inactiveColor: Color.fromRGBO(224, 224, 224, 1),
                      activeColor: Colors.deepOrange,
                      toggleSize: 20.0,
                      value: status,
                      borderRadius: 30.0,
                      padding: 4.0,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                        });
                      },
                    ),
                  ]),
            ),
            Expanded(
              // height: 60,
              child: ListView.builder(
                  itemCount: listAbsence.length,
                  itemBuilder: (context, index) {
                    if (listAbsence[index].day.month != DateTime.now().month &&
                        !status) {
                      return SizedBox.shrink();
                    }
                    return ListAbsence(absence: listAbsence[index]);
                  }),
            )
          ]),
        ),
      ]),
    );
  }
}

class ListAbsence extends StatelessWidget {
  const ListAbsence({
    super.key,
    required this.absence,
  });
  final Absence absence;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3))),
        padding: EdgeInsets.only(left: 20, top: 10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: absence.id == 0
                          ? Color.fromRGBO(39, 174, 96, 1)
                          : absence.id == 1
                              ? Color.fromRGBO(255, 89, 89, 1)
                              : absence.id == 2
                                  ? Color.fromRGBO(255, 195, 18, 1)
                                  : Color.fromRGBO(0, 92, 200, 1)),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  DateFormat.yMMMMd().format(absence.day).toString(),
                  style:
                      TextStyle(fontFamily: 'SFPRODISPLAYBOLD', fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(absence.request,
                    style: TextStyle(
                        color: absence.id == 0
                            ? Color.fromRGBO(39, 174, 96, 1)
                            : absence.id == 1
                                ? Color.fromRGBO(255, 89, 89, 1)
                                : absence.id == 2
                                    ? Color.fromRGBO(255, 195, 18, 1)
                                    : Color.fromRGBO(0, 92, 200, 1))),
                SizedBox(
                  width: 20,
                ),
                Opacity(opacity: 0.5, child: Text(absence.status))
              ],
            )
          ],
        ));
  }
}

void _show(BuildContext context, DateTime date) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 12, bottom: 12, left: 125, right: 20),
              width: MediaQuery.of(context).size.width,
              height: 48,
              decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
              ),
              child: Text('Thông tin ngày',
                  style:
                      TextStyle(fontFamily: 'SFPRODISPLAYBOLD', fontSize: 20)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Text('Ngày ${DateFormat.yMd().format(date)}',
                      style: TextStyle(
                          fontFamily: 'SFPRODISPLAYBOLD', fontSize: 20)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 38,
                    width: 128,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Đúng giờ",
                          // '${listAbsence.firstWhere((element) => element.day.year == date.year && element.day.month == date.month && element.day.day == date.day).request!=null}',
                          style: TextStyle(
                              fontFamily: 'SFPRODISPLAYBOLD',
                              fontSize: 15,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              // height: 350.0,
              child: ListView.builder(
                itemBuilder: (context, index) {},
              ),
            ),
          ],
        );
      });
}
