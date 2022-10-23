import 'package:fit_counter/config/themes/colors.dart';
import 'package:fit_counter/data/repositories/codes_repository_impl.dart';
import 'package:fit_counter/domain/entities/workout.dart';
import 'package:fit_counter/presentation/blocs/add_workout_bloc/add_workout_bloc.dart';
import 'package:fit_counter/presentation/blocs/add_workout_bloc/add_workout_event.dart';
import 'package:fit_counter/presentation/blocs/get_all_workouts_bloc/get_all_workouts_bloc.dart';
import 'package:fit_counter/presentation/blocs/get_all_workouts_bloc/get_all_workouts_event.dart';
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
  late SharedPreferences prefs;

  @override
  void initState() {
    getAndAddWorkouts();
    initPrefs();
    super.initState();
  }

  Future<void> initPrefs() async{
    prefs = await SharedPreferences.getInstance();
  }

  Future <void> getAndAddWorkouts() async{
    Workout workout = Workout(date: DateFormat('dd-MM-yyyy').format(DateTime.now()), time: '3:05', repetitions: 20);
    print('kotki');
    //BlocProvider.of<AddWorkoutBloc>(context).add(AddWorkout(workout));
    BlocProvider.of<GetAllWorkoutsBloc>(context).add(GetAllWorkouts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Center(
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
                            Text("Cześć, ${prefs.getString("username")} 👋",
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
                    _buildGoalRow(),
                    _buildTrainingCard(),
                    _buildProgressChart()
                  ],
                )
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
                child: Text("śledź swój postęp 📊",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoalRow(){
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
              Text((prefs.getInt("goal") ==0) ? "Nie ustawiono" : "${prefs.getInt("goal").toString()} powtórzeń",
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
