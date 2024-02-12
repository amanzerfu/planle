import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leplan/Pages/my_timelines.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLines extends StatefulWidget {
  const TimeLines({Key? key}) :super(key: key);

  @override
  State<TimeLines> createState() => _TimeLinesState();
}

class _TimeLinesState extends State<TimeLines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45.0),
        child: ListView(
          children: [
            MyTimeLines(isFirst: true, isLast: false, isPast: false,eventCard: Text("Order placed"),),
            MyTimeLines(isFirst: false, isLast: false, isPast: true,eventCard: Text("order shipped"),),
            MyTimeLines(isFirst: false, isLast: true, isPast: false,eventCard: Text("order Ready"),)
          ],
        ),
      ),
    );
  }
}
