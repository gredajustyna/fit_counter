import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';

abstract class GetRepetitionsEvent{
  final List<UserAccelerometerEvent>? events;
  const GetRepetitionsEvent({this.events});
}

class GetRepetitions extends GetRepetitionsEvent{
  const GetRepetitions(List<UserAccelerometerEvent> events): super(events: events);
}