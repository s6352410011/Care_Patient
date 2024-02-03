import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalendarUI(),
    );
  }
}

class CalendarUI extends StatefulWidget {
  const CalendarUI({Key? key}) : super(key: key);

  @override
  State<CalendarUI> createState() => _CalendarUIState();
}

class _CalendarUIState extends State<CalendarUI> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late Map<DateTime, List<dynamic>> _events;
  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    _events = {};
  }

  void _addEvent() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Your Event'),
          content: TextFormField(
            controller: _eventController,
            decoration: InputDecoration(
              hintText: 'Enter your event',
            ),
            onSaved: (value) {
              // Save the value entered by the user (currently not used)
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Clear the text field and close the dialog
                _eventController.clear();
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _saveEvent();
                // Clear the text field and close the dialog
                _eventController.clear();
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _saveEvent() {
    if (_selectedDay != null && _eventController.text.isNotEmpty) {
      setState(() {
        final newEvent = _eventController.text;

        if (_events.containsKey(_selectedDay)) {
          _events[_selectedDay]!.add(newEvent);
        } else {
          _events[_selectedDay] = [newEvent];
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              locale: 'th_TH',
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              eventLoader: (day) {
                return _events[day] ?? [];
              },
              calendarBuilders: CalendarBuilders(),
              availableCalendarFormats: const {
                CalendarFormat.month: 'เดือน',
                CalendarFormat.week: 'สัปดาห์',
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            SizedBox(height: 20),
            Ink(
              decoration: ShapeDecoration(
                color: Colors.blue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                onPressed: _addEvent,
                icon: Icon(Icons.add),
                iconSize: 32,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Events:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _events.entries.map((entry) {
                if (isSameDay(entry.key, _selectedDay)) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          DateFormat('dd-MM-yyyy').format(entry.key),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: entry.value.length,
                        itemBuilder: (context, index) {
                          final event = entry.value[index];
                          return ListTile(
                            title: Text(event),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    // Show edit event dialog
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Edit Event'),
                                          content: TextFormField(
                                            controller: _eventController,
                                            decoration: InputDecoration(
                                              hintText: 'Enter your event',
                                            ),
                                            onSaved: (value) {
                                              // Save the value entered by the user (currently not used)
                                            },
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                // Clear the text field and close the dialog
                                                _eventController.clear();
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                // Update the event
                                                if (_selectedDay != null &&
                                                    _eventController
                                                        .text.isNotEmpty) {
                                                  setState(() {
                                                    final updatedEvent =
                                                        _eventController.text;
                                                    _events[_selectedDay]![
                                                        index] = updatedEvent;
                                                  });
                                                }
                                                // Clear the text field and close the dialog
                                                _eventController.clear();
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Save'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // Show confirmation dialog
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Confirmation"),
                                          content: Text(
                                              "Are you sure you want to delete this event?"),
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text("Cancel"),
                                              onPressed: () {
                                                // Close the dialog
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: Text("OK"),
                                              onPressed: () {
                                                // Delete the event
                                                setState(() {
                                                  _events[entry.key]!
                                                      .remove(event);
                                                });
                                                // Close the dialog
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  return SizedBox.shrink();
                }
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
