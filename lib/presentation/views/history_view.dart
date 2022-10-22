import 'package:fit_counter/presentation/widgets/workout_widget.dart';
import 'package:flutter/material.dart';

import '../../config/themes/colors.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historia ćwiczeń"),
        centerTitle: true,
        backgroundColor: orange,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: orange,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WorkoutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
