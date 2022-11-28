import 'dart:async';

import 'package:fit_counter/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../blocs/get_repetitions_bloc/get_repetitions_bloc.dart';
import '../blocs/get_repetitions_bloc/get_repetitions_event.dart';

class CountView extends StatefulWidget {
  const CountView({Key? key}) : super(key: key);

  @override
  State<CountView> createState() => _CountViewState();
}

class _CountViewState extends State<CountView> {
  late StreamSubscription accel;
  List<AccelerometerEvent> events=[];
  late Timer timer;

  @override
  void initState() {
    accel = accelerometerEvents.listen((AccelerometerEvent event) {
      events.add(event);
    });
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(accel.isPaused){
        timer.cancel();
      }else{
        setState(() {

        });
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: const RadialGradient(
            colors: [lightBlue, deepBlue],
            radius: 0.9,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/8,),
                Text("Czas:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45
                  ),
                ),
                Text(formatTimer(timer.tick),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/8,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20, vertical: MediaQuery.of(context).size.width/20),
                  child: Text('Trzymaj telefon oburącz przed sobą, wykonuj przysiady a po zakończeniu ćwiczenia kliknij przycisk "zakończ"', style: TextStyle(color: black, fontSize: 20), textAlign: TextAlign.center,),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/4,),
                ElevatedButton(
                  onPressed: () async{
                    var currentTime = formatTimer(timer.tick);
                    Map<String, dynamic> eventsMap = {'events': events, "time": currentTime};
                    accel.pause();
                    BlocProvider.of<GetRepetitionsBloc>(context).add(GetRepetitions(eventsMap));
                    accel.cancel();
                    Navigator.of(context).popAndPushNamed('/stop');
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/4, vertical: MediaQuery.of(context).size.width/20 ),
                    child: const Text(
                      'Zakończ!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),
                    backgroundColor: MaterialStateProperty.all(lightBlue),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatTimer(int timer){
    if(timer >=0 && timer <=9){
      return "0:0$timer";
    }else if(timer==60){
      return "1:00";
    } else if(timer>60){
      var minutes = timer/60;
      var secs = timer % 60;
      if(secs <=9){
        return "${minutes.toString().substring(0, minutes.toString().indexOf('.'))}:0$secs";
      }else{
        return "${minutes.toString().substring(0, minutes.toString().indexOf('.'))}:$secs";
      }
    }else{
      return "0:$timer";
    }
  }
}