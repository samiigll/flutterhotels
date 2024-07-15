import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

final kNow = DateTime.now();
final kFirstDay = DateTime(kNow.year, kNow.month - 3, kNow.day);
final kLastDay = DateTime(kNow.year, kNow.month + 3, kNow.day);

const dGreen = Color(0xFF54D3C2);
const dLightBlue = Color(0xFFADD8E6);

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime? _focusedDay = DateTime.now();
  bool _isFlexibleWithDates = false; // Yeni durum değişkeni

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          TableCalendar(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay!,
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                if (_rangeStart != null &&
                    _rangeEnd == null &&
                    selectedDay.isAfter(_rangeStart!)) {
                  _rangeEnd = selectedDay;
                } else {
                  _rangeStart = selectedDay;
                  _rangeEnd = null;
                }
                _focusedDay = focusedDay;
              });
            },
            onRangeSelected: (start, end, focusedDay) {
              setState(() {
                _rangeStart = start;
                _rangeEnd = end;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: dLightBlue,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle,
              ),
              rangeHighlightColor: dGreen.withOpacity(0.5),
              rangeStartDecoration: BoxDecoration(
                color: dGreen,
                shape: BoxShape.circle,
              ),
              rangeEndDecoration: BoxDecoration(
                color: dGreen,
                shape: BoxShape.circle,
              ),
              withinRangeDecoration: BoxDecoration(
                color: dGreen.withOpacity(0.5),
                shape: BoxShape.rectangle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
              rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Depart',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.nunito().fontFamily,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          _rangeStart != null
                              ? DateFormat('dd/MM/yyyy').format(_rangeStart!)
                              : 'Select Date',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Return',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.nunito().fontFamily,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          _rangeEnd != null
                              ? DateFormat('dd/MM/yyyy').format(_rangeEnd!)
                              : 'Select Date',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _isFlexibleWithDates,
                      onChanged: (value) {
                        setState(() {
                          _isFlexibleWithDates = value!;
                        });
                      },
                      activeColor: dGreen,
                    ),
                    Text(
                      'Flexible with dates',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Apply button action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: dGreen,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(color: Colors.white), // Text rengi beyaz
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

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 24,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CalendarPage(),
  ));
}
