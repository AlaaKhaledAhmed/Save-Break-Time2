import 'package:flutter/material.dart';
class StudentNotification extends StatefulWidget {
  StudentNotification({Key key}) : super(key: key);

  @override
  State<StudentNotification> createState() => _StudentNotificationState();
}

class _StudentNotificationState extends State<StudentNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child:Text("notifcaion")));
  }
}