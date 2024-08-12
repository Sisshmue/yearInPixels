import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'colorProvider.dart';

class Record extends StatefulWidget {
  Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  final _myBox = Hive.box('myBox');
  Timer? _timer;

  // @override
  // void initState() {
  //   super.initState();
  //   // Update the state every second
  //   Timer.periodic(Duration(seconds: 1), (Timer t) => setState(() {}));
  // }

  @override
  void initState() {
    super.initState();
    // Update the state every second
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (mounted) {
        setState(() {});
      } else {
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch the current date and format it
    DateTime now = DateTime.now();
    String day = DateFormat('d').format(now); // Day of the month
    String month = DateFormat('MMMM').format(now); // Full month name
    var colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorProvider.getColor,
        title: Title(
          color: Colors.white,
          child: Text("Record page"),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 280,
          height: 280,
          decoration: BoxDecoration(
            // elevation: 30,
            color: _myBox.get("$day & $month"),
            borderRadius: BorderRadius.circular(360),
          ),
        ),
      ),
    );
  }
}
