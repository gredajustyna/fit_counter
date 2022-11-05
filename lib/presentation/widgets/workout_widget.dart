import 'package:fit_counter/config/themes/colors.dart';
import 'package:flutter/material.dart';

class WorkoutWidget extends StatefulWidget {
  final String date;
  final String time;
  final int repetitions;
  const WorkoutWidget({Key? key, required this.repetitions, required this.time, required this.date}) : super(key: key);

  @override
  State<WorkoutWidget> createState() => _WorkoutWidgetState();
}

class _WorkoutWidgetState extends State<WorkoutWidget> {

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
                  Text(widget.date, style: TextStyle(color: black, fontWeight: FontWeight.bold, fontSize: 20),),
                  Text("czas:"),
                  Text(widget.time, style: TextStyle(color: lightBlue, fontSize: 25, fontWeight: FontWeight.bold),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("liczba powtórzeń:"),
                  Text(widget.repetitions.toString(), style: TextStyle(color: lightBlue, fontSize: 50, fontWeight: FontWeight.bold),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
