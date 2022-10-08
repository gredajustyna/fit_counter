import 'package:fit_counter/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class StartView extends StatefulWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/35),
            child: IconButton(
              icon: const Icon(Ionicons.calendar, color: Colors.white,),
              onPressed: () {

              },
            ),
          ),
        ],
        backgroundColor: orange,
        elevation: 0,
        leading: Padding(
          padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/35),
          child: IconButton(
            icon: const Icon(Ionicons.settings, color: Colors.white,),
            onPressed: () {

            },
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: orange,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/8,),
              Text('Fit Counter',
                style: TextStyle(
                  color: deepBlue,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                  fontSize: 40
                ),
              ),
              Image.asset('assets/squat.gif', scale: 3,),
              SizedBox(height: MediaQuery.of(context).size.height/3,),
              _buildStartButton(),
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
