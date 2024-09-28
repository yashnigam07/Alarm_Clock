import 'package:flutter/material.dart';
import 'dart:async';  // For timing functions

void main() {
  runApp(const AlarmClockApp());
}

class AlarmClockApp extends StatelessWidget {
  const AlarmClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm Clock',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AlarmHomePage(),
    );
  }
}

class AlarmHomePage extends StatefulWidget {
  const AlarmHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AlarmHomePageState createState() => _AlarmHomePageState();
}

class _AlarmHomePageState extends State<AlarmHomePage> {
  TimeOfDay? _selectedTime;
  String _alarmMessage = "No alarm set";

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _alarmMessage = "Alarm set for ${_selectedTime!.format(context)}";
        _setAlarm(picked);
      });
    }
  }

  void _setAlarm(TimeOfDay selectedTime) {
    final selectedDateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      selectedTime.hour,
      selectedTime.minute,
    );

    final timeDifference = selectedDateTime.difference(DateTime.now()).inSeconds;

    if (timeDifference > 0) {
      Timer(Duration(seconds: timeDifference), () {
        _triggerAlarm();
      });
    }
  }

  void _triggerAlarm() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Alarm!"),
        content: const Text("It's time!"),
        actions: [
          TextButton(
            child: const Text("Stop"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text('Alarm Clock'),
        backgroundColor: const Color.fromARGB(255, 187, 201, 208),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _alarmMessage,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[800],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), backgroundColor: Colors.blueGrey[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => _selectTime(context),
                child: const Text(
                  'Set Alarm',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
