import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';

abstract class GetRepetitionsEvent{
  final Map<String, dynamic>? events;
  const GetRepetitionsEvent({this.events});
}

class GetRepetitions extends GetRepetitionsEvent{
  const GetRepetitions(Map<String, dynamic> events): super(events: events);
}