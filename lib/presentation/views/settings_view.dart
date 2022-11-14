import 'package:fit_counter/config/themes/colors.dart';
import 'package:fit_counter/presentation/blocs/delete_workouts_bloc/delete_workouts_bloc.dart';
import 'package:fit_counter/presentation/blocs/delete_workouts_bloc/delete_workouts_state.dart';
import 'package:fit_counter/presentation/blocs/set_goal_bloc/set_goal_bloc.dart';
import 'package:fit_counter/presentation/blocs/set_goal_bloc/set_goal_event.dart';
import 'package:fit_counter/presentation/blocs/set_goal_bloc/set_goal_state.dart';
import 'package:fit_counter/presentation/views/start_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/delete_workouts_bloc/delete_workouts_event.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  int currentGoal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ustawienia"),
        centerTitle: true,
        backgroundColor: orange,
        elevation: 0,
      ),
      body: BlocListener<SetGoalBloc, SetGoalState>(
        listener: (event, state){
          if(state is SetGoalDone){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Ustalono dzienny cel!", style: TextStyle(color: Colors.white),),
              backgroundColor: deepBlue, duration: Duration(milliseconds: 750),
            ));
          }else if(state is SetGoalError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Ups, coś poszło nie tak!", style: TextStyle(color: Colors.white),),
              backgroundColor: orange,
            ));
          }
        },
        child: BlocListener<DeleteWorkoutsBloc, DeleteWorkoutsState>(
          listener: (event, state){
            if(state is DeleteWorkoutsDone){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const StartView()), (route) => false);
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width/30,
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width/30, horizontal: MediaQuery.of(context).size.width/30),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Ustaw cel",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: black
                            ),
                            )
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RawMaterialButton(
                                  onPressed: (){
                                    setState((){
                                      if(currentGoal>0){
                                        currentGoal -=1;
                                      }
                                    });
                                  },
                                  child: Text("-", style: TextStyle(color: black, fontWeight: FontWeight.bold),),
                                ),
                                Text(currentGoal.toString(), style: TextStyle(color: black)),
                                RawMaterialButton(
                                  onPressed: (){
                                    setState((){
                                      currentGoal +=1;
                                    });
                                  },
                                  child: Text("+", style: TextStyle(color: black, fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            Text("powtórzeń", style: TextStyle(color: black)),
                            SizedBox(
                              height: MediaQuery.of(context).size.width/30,
                            ),
                            ElevatedButton(
                              onPressed: () async{
                                BlocProvider.of<SetGoalBloc>(context).add(SetGoal(currentGoal));
                              },
                              child: const Text(
                                'Zapisz',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                ),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                ),
                                backgroundColor: MaterialStateProperty.all(lightBlue),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width/30,
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width/30,
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width/30, horizontal: MediaQuery.of(context).size.width/30),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text("Wymaż wszystkie dane",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: black
                                ),
                              )
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async{
                            await _showMyDialog();
                          },
                          child: const Text(
                            'Wymaż',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15
                            ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                            backgroundColor: MaterialStateProperty.all(lightBlue),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width/30,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Uwaga!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Ta akcja wymaże wszystkie twoje dane i zapisany postęp.'),
                Text('Czy chcesz kontynuować?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Anuluj', style: TextStyle(color: orange),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Wymaż', style: TextStyle(color: lightBlue, fontWeight: FontWeight.bold),),
              onPressed: () {
                BlocProvider.of<DeleteWorkoutsBloc>(context).add(DeleteAllWorkouts());
              },
            ),
          ],
        );
      },
    );
  }
}
