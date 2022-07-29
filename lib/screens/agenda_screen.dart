import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../widgets/drawer.dart';


class AgendaScreen extends StatefulWidget{

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();

}

class _AgendaScreenState extends State<AgendaScreen> {

  CalendarView vista = CalendarView.workWeek;

  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          elevation: 20,
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            'Agenda',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
        drawer: DrawerWidget(height),
        body: SfCalendar(
          view: vista,
          firstDayOfWeek: 1,
          //allowDragAndDrop: true,
          //minDate: DateTime(2022-06),
          dataSource: MeetingDataSource(_getDataSource()),
            onTap: (CalendarTapDetails){
              setState(() {
                vista = CalendarView.day;
              });
            },
            allowedViews: const [
              CalendarView.month,
              CalendarView.week,
              CalendarView.timelineWeek,
              CalendarView.timelineDay,
              CalendarView.schedule,
              CalendarView.timelineMonth,
            ],
            timeSlotViewSettings: const TimeSlotViewSettings(
                startHour: 7,
                endHour: 22,
            ),

          monthViewSettings: const MonthViewSettings(appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        )
    );
  }


  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting('Gerardo', DateTime(today.year, today.month, today.day-1, 10), DateTime(today.year, today.month, today.day-1, 12), Colors.green, false));
    meetings.add(Meeting('Esther', DateTime(today.year, today.month, today.day-1, 12), DateTime(today.year, today.month, today.day-1, 15), Colors.pinkAccent, false));
    meetings.add(Meeting('Jose', DateTime(today.year, today.month, today.day-1, 16), DateTime(today.year, today.month, today.day-1, 17), Colors.brown, false));
    meetings.add(Meeting('Alan', startTime, endTime, const Color(0xFF0F8644), false));
    meetings.add(Meeting('Maria', DateTime(today.year, today.month, today.day, 11), DateTime(today.year, today.month, today.day, 13), Colors.red, false));
    meetings.add(Meeting('Juan', DateTime(today.year, today.month, today.day, 15), DateTime(today.year, today.month, today.day, 16), Colors.teal, false));
    meetings.add(Meeting('Alexis', DateTime(today.year, today.month, today.day, 17), DateTime(today.year, today.month, today.day, 19), Colors.blue, false));
    meetings.add(Meeting('Yeri', DateTime(today.year, today.month, today.day, 17), DateTime(today.year, today.month, today.day, 19), Colors.deepOrange, false));
    meetings.add(Meeting('Elena', DateTime(today.year, today.month, today.day, 19), DateTime(today.year, today.month, today.day, 20), Colors.deepPurpleAccent, false));
    //meetings.add(Meeting('Eduardo', startTime, endTime, Colors.green, false));
    meetings.add(Meeting('Luis', DateTime(today.year, today.month, today.day+1, 8), DateTime(today.year, today.month, today.day+1, 9), Colors.red, false));
    meetings.add(Meeting('Eduardo', DateTime(today.year, today.month, today.day+1, 8), DateTime(today.year, today.month, today.day+1, 9), Colors.grey, false));
    meetings.add(Meeting('Jimena', DateTime(today.year, today.month, today.day+1, 9), DateTime(today.year, today.month, today.day+1, 10), Colors.green, false));
    meetings.add(Meeting('Roberto', DateTime(today.year, today.month, today.day+1, 11), DateTime(today.year, today.month, today.day+1, 13), Colors.purple, false));
    meetings.add(Meeting('Karen', DateTime(today.year, today.month, today.day+1, 14), DateTime(today.year, today.month, today.day+1, 15), Colors.purpleAccent, false));
    meetings.add(Meeting('Eduardo', DateTime(today.year, today.month, today.day+1, 16), DateTime(today.year, today.month, today.day+1, 19), Colors.yellow.shade700, false));
    meetings.add(Meeting('Mauri', DateTime(today.year, today.month, today.day+1, 19), DateTime(today.year, today.month, today.day+1, 20), Colors.teal, false));


    meetings.add(Meeting('Carmen', DateTime(today.year, today.month, today.day+2, 10), DateTime(today.year, today.month, today.day+2, 13), Colors.indigoAccent, false));
    meetings.add(Meeting('Juan', DateTime(today.year, today.month, today.day+2, 10), DateTime(today.year, today.month, today.day+2, 13), Colors.redAccent, false));


    meetings.add(Meeting('Marcelo', DateTime(today.year, today.month, today.day+4, 9), DateTime(today.year, today.month, today.day+4, 11), Colors.green, false));
    meetings.add(Meeting('Hadrian', DateTime(today.year, today.month, today.day+4, 9), DateTime(today.year, today.month, today.day+4, 11), Colors.red, false));
    meetings.add(Meeting('Cynthia', DateTime(today.year, today.month, today.day+4, 12), DateTime(today.year, today.month, today.day+4, 15), Colors.red, false));
    meetings.add(Meeting('Gore', DateTime(today.year, today.month, today.day+4, 12), DateTime(today.year, today.month, today.day+4, 15), Colors.deepPurpleAccent, false));
    //meetings.add(Meeting('Mario Valadez', startTime, endTime, Colors.purple, false));
    return meetings;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}


class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}

