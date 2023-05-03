// import 'package:calendar_strip/calendar_strip.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice_simple_travel_app/cons/colors.dart';
import 'package:practice_simple_travel_app/cons/size_config.dart';
import 'package:practice_simple_travel_app/data/data_bookings.dart';
import 'package:practice_simple_travel_app/data/data_favourite.dart';
import 'package:practice_simple_travel_app/widgets/appText.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _today = DateTime.now();
  DateTime _selected = DateTime.now();
  CalendarFormat format = CalendarFormat.week;
  final dateFormat = DateFormat('MMM d, yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Calendar',
          size: getProportionateScreenWidth(18),
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            padding: EdgeInsets.only(
              right: getProportionateScreenWidth(20),
            ),
          ),
        ],
      ),
      body: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        // child: CalendarStrip(
        //   onDateSelected: () {},
        //   startDate: DateTime(2010, 1, 1),
        //   endDate: DateTime(2099, 31, 12),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
                onDaySelected: (
                  focusedDay,
                  selectedDay,
                ) =>
                    setState(
                      () {
                        _today = focusedDay;
                        _selected = selectedDay;
                      },
                    ),
                selectedDayPredicate: (day) {
                  return isSameDay(_selected, day);
                },
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                        // color: Colors.amber,
                        fontSize: getProportionateScreenWidth(14)),
                    weekendStyle: TextStyle(
                        // color: Colors.amber,
                        fontSize: getProportionateScreenWidth(14))),
                calendarStyle: CalendarStyle(
                  todayDecoration: const BoxDecoration(
                      color: AppColors.mainColor, shape: BoxShape.circle),
                  selectedDecoration: const BoxDecoration(
                      color: AppColors.starColor, shape: BoxShape.circle),

                  // textS
                  weekendTextStyle:
                      TextStyle(fontSize: getProportionateScreenWidth(14)),
                  // weekNumberTextStyle: TextStyle(fontSize: 30),
                  todayTextStyle: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      color: Colors.white),
                  tableBorder:
                      TableBorder(borderRadius: BorderRadius.circular(12)),
                  defaultTextStyle: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                    // color: Colors.amber,
                  ),
                ),
                headerStyle: HeaderStyle(
                    headerMargin: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(20)),
                    leftChevronIcon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    rightChevronIcon: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                    formatButtonShowsNext: true,
                    formatButtonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    formatButtonTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(16),
                    ),
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenWidth(16)),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(12),
                    )),
                calendarFormat: format,
                onFormatChanged: (_format) {
                  setState(() {
                    format = _format;
                  });
                },
                firstDay: DateTime(2000, 1, 1),
                focusedDay: _today,
                lastDay: DateTime(2099, 12, 31)),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(30)),
              child: AppText(
                text: 'My Bookings',
                size: getProportionateScreenWidth(20),
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(300),
              child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                        width: double.infinity,
                        height: getProportionateScreenHeight(100),

                        // vertical: getProportionateScreenHeight(10)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[100],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(
                                      getProportionateScreenWidth(12)),
                                  width: getProportionateScreenWidth(80),
                                  height: getProportionateScreenHeight(80),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            dataBookings[index].path),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(60),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        text: dateFormat.format(_today),
                                        size: getProportionateScreenWidth(12),
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      AppText(
                                        text: dataBookings[index].type,
                                        size: getProportionateScreenWidth(14),
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      AppText(
                                        text: dataBookings[index].place,
                                        size: getProportionateScreenWidth(12),
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: dataBookings.length),
            )
          ],
        ),
      ),
    );
  }
}
