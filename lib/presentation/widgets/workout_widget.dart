import 'package:fit_counter/config/themes/colors.dart';
import 'package:flutter/material.dart';

class WorkoutWidget extends StatefulWidget {
  const WorkoutWidget({Key? key}) : super(key: key);

  @override
  State<WorkoutWidget> createState() => _WorkoutWidgetState();
}

class _WorkoutWidgetState extends State<WorkoutWidget> {
  String date = '22.10.2022';
  String time = '2:54';
  int repetitions = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(date, style: TextStyle(color: black, fontWeight: FontWeight.bold, fontSize: 20),),
                  Text("czas:"),
                  Text(time, style: TextStyle(color: lightBlue, fontSize: 25, fontWeight: FontWeight.bold),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("liczba powtórzeń:"),
                  Text(repetitions.toString(), style: TextStyle(color: lightBlue, fontSize: 50, fontWeight: FontWeight.bold),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
