import 'package:fit_counter/config/themes/colors.dart';
import 'package:fit_counter/data/repositories/codes_repository_impl.dart';
import 'package:fit_counter/domain/entities/user.dart';
import 'package:fit_counter/domain/entities/workout.dart';
import 'package:fit_counter/presentation/blocs/add_workout_bloc/add_workout_bloc.dart';
import 'package:fit_counter/presentation/blocs/add_workout_bloc/add_workout_event.dart';
import 'package:fit_counter/presentation/blocs/get_all_workouts_bloc/get_all_workouts_bloc.dart';
import 'package:fit_counter/presentation/blocs/get_all_workouts_bloc/get_all_workouts_event.dart';
import 'package:fit_counter/presentation/blocs/get_all_workouts_bloc/get_all_workouts_state.dart';
import 'package:fit_counter/presentation/blocs/get_user_bloc/get_user_bloc.dart';
import 'package:fit_counter/presentation/blocs/get_user_bloc/get_user_event.dart';
import 'package:fit_counter/presentation/blocs/get_user_bloc/get_user_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  List<int> xValues=[0,1,2,3,4,5,6];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<GetUserBloc>(context)..add(GetUser()),
      child: BlocProvider.value(
        value: BlocProvider.of<GetAllWorkoutsBloc>(context)..add(GetAllWorkouts()),
        child: Scaffold(
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: orange.withOpacity(0.7),
                child: SingleChildScrollView(
                  child: BlocBuilder<GetUserBloc, GetUserState>(
                    builder: (_, state) {
                      if(state is GetUserDone){
                        return Center(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/35),
                                      child: IconButton(
                                        icon: const Icon(Ionicons.settings_outline, color: Colors.white,),
                                        onPressed: () {
                                          Navigator.of(context).pushNamed("/settings");
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/35),
                                      child: IconButton(
                                        icon: const Icon(Ionicons.calendar_outline, color: Colors.white,),
                                        onPressed: () {
                                          Navigator.of(context).pushNamed("/history");
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20, vertical: MediaQuery.of(context).size.width/20),
                                      child: Container(
                                        height: MediaQuery.of(context).size.width/6,
                                        width: MediaQuery.of(context).size.width/6,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              lightBlue,
                                              deepBlue,
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Icon(Icons.fitness_center, color: Colors.white,size: 60),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Miłego dnia!",
                                          style: TextStyle(
                                              color: Colors.white
                                          ),
                                        ),
                                        Text("Cześć, ${state.user!.username} 👋",
                                          style: TextStyle(
                                            color: lightBlue,
                                            fontSize: 30,
                                            fontFamily: GoogleFonts.openSans().fontFamily,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                _buildGoalRow(state.user!),
                                _buildTrainingCard(),
                                _buildProgressChart()
                              ],
                            )
                        );
                      }else{
                        return Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }
                    }
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressChart(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/35),
      child: Card(
        elevation: 5,
        shadowColor: deepBlue,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                lightBlue,
                deepBlue,
              ],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/35, horizontal: MediaQuery.of(context).size.height/40),
                child: Text("Śledź swój postęp 📊",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                ),
              ),
              BlocBuilder<GetAllWorkoutsBloc, GetAllWorkoutsState>(
                builder: (_, state) {
                  if(state is GetAllWorkoutsDone){
                    var newWorkouts = [];
                    var xnValues = [];
                    if(state.workouts!.length <7){
                      for(int i=0; i< 7- state.workouts!.length; i++){
                        newWorkouts.add(Workout(date: '', time: '', repetitions: 0));
                        xnValues.add('');
                      }
                    }
                    for(int i=0; i< state.workouts!.length; i++){
                      newWorkouts.add(state.workouts![i]);
                    }
                    return Center(
                      child: Container(
                        width: 250,
                        height: 250,
                        child: BarChart(
                          BarChartData(
                            barGroups: newWorkouts.map((workout) => BarChartGroupData(barRods: [BarChartRodData(toY: workout.repetitions.toDouble(), color: orange)], x: xValues[newWorkouts.indexOf(workout)])).take(7).toList(),
                            titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 30,
                                  getTitlesWidget: (value, meta) {
                                    String text = '';
                                    switch (value.toInt()) {
                                      case 0:
                                        if(newWorkouts[0].date ==''){
                                          text = '   ';
                                        }else{
                                         text =  newWorkouts[0].date.substring(0,5);
                                        }
                                        break;
                                      case 1:
                                        if(newWorkouts[1].date ==''){
                                          text = '   ';
                                        }else{
                                          text =  newWorkouts[1].date.substring(0,5);
                                        }
                                        break;
                                      case 2:
                                        if(newWorkouts[2].date ==''){
                                          text = '   ';
                                        }else{
                                          text =  newWorkouts[2].date.substring(0,5);
                                        }
                                        break;
                                      case 3:
                                        if(newWorkouts[3].date ==''){
                                          text = '   ';
                                        }else{
                                          text =  newWorkouts[3].date.substring(0,5);
                                        }
                                        break;
                                      case 4:
                                        if(newWorkouts[4].date ==''){
                                          text = '   ';
                                        }else{
                                          text =  newWorkouts[4].date.substring(0,5);
                                        }
                                        break;
                                      case 5:
                                        if(newWorkouts[5].date ==''){
                                          text = '   ';
                                        }else{
                                          text =  newWorkouts[5].date.substring(0,5);
                                        }
                                        break;
                                      case 6:
                                        if(newWorkouts[6].date ==''){
                                          text = '   ';
                                        }else{
                                          text =  newWorkouts[6].date.substring(0,5);
                                        }
                                        break;
                                    }

                                    return Text(text, style: TextStyle(fontSize: 8),);
                                  },
                                )
                              ),
                              leftTitles: AxisTitles(sideTitles: SideTitles(
                                showTitles: true,
                              )),
                              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            ),
                          ),
                        ),
                      ),
                    );
                  }else{
                    return Center();
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoalRow(User user){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/35, vertical: MediaQuery.of(context).size.height/20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Twój dzienny cel:",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              Text((user.goal ==0) ? "Nie ustawiono" : "${user.goal.toString()} powtórzeń",
                style: TextStyle(
                    color: lightBlue,
                    fontSize: 30,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                ),
              )
            ],
          ),
          ElevatedButton(
            onPressed: () async{
              Navigator.of(context).pushNamed("/settings");
            },
            child: const Text(
              'Zmień',
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
          )
        ],
      ),
    );
  }

  Widget _buildTrainingCard(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/35),
      child: Card(
        elevation: 5,
        shadowColor: deepBlue,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                lightBlue,
                deepBlue,
              ],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/35, horizontal: MediaQuery.of(context).size.height/40),
                child: Text("Rozpocznij dzisiejsze ćwiczenia 💪",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                          width: (MediaQuery.of(context).size.width/3)*1.7,
                          child: Padding(
                            padding: EdgeInsets.symmetric( horizontal: MediaQuery.of(context).size.height/40),
                            child: Text('Zadbaj o swoją sylwetkę, zapisując liczbę wykonanych powtórzeń ćwiczenia',
                              style: TextStyle(
                                color: lightBlue
                              ),
                            ),
                          ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric( vertical: MediaQuery.of(context).size.height/40),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("/start");
                          },
                          child: const Text(
                            'Start',
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
                      )
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    height: MediaQuery.of(context).size.width/3,
                    child: Image(image: AssetImage('assets/squat2.png'),)),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStartButton(){
    return ElevatedButton(
      onPressed: () async{

      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/4, vertical: MediaQuery.of(context).size.width/20 ),
        child: const Text(
          'Zaczynamy!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15
          ),
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            )
        ),
        backgroundColor: MaterialStateProperty.all(deepBlue),
        elevation: MaterialStateProperty.all<double>(10),
        shadowColor: MaterialStateProperty.all(Colors.white)
      ),
    );
  }
}
