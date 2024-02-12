import 'package:flutter/material.dart';
import 'package:leplan/Pages/eventcard.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLines extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final eventCard;

  const MyTimeLines({
      super.key,
      required this.isFirst,
    required this.isLast,
    required this.isPast,
  required this.eventCard});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(color: isPast ? Colors.brown : Colors.brown.shade100),
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: isPast ? Colors.brown : Colors.brown.shade100,
          iconStyle: IconStyle(iconData: Icons.done,color: isPast ? Colors.white : Colors.brown.shade100)
        ),
        endChild: EventCard(
          isPast: isPast,
          child: eventCard,

        ),
      ),
    );
  }
}
