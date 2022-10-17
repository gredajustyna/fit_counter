import 'package:fit_counter/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
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
        backgroundColor: orange.withOpacity(0.7),
        elevation: 0,
        leading: Padding(
          padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/35),
          child: IconButton(
            icon: const Icon(Ionicons.settings_outline, color: Colors.white,),
            onPressed: () {
              Navigator.of(context).pushNamed("/settings");
            },
          ),
        ),
      ),
      body: Container(
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
                          Text("Cześć, Y/N! 👋",
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
                  _buildTrainingCard()
                ],
              )
            ),
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
              Text("Nie ustawiono",
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
