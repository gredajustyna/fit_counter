import 'package:delayed_display/delayed_display.dart';
import 'package:fit_counter/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartView extends StatefulWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width/40),
              child: DelayedDisplay(
                delay: Duration(milliseconds: 1000),
                child: Container(
                  height: MediaQuery.of(context).size.height/3,
                  width:  MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: deepBlue.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width/40),
                        child: Text(
                            "Śledź i zapisuj swoje postępy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.openSans().fontFamily,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/30),
                        child: Text(
                          "Dzięki FitCounter bądź zawsze w dobrej formie! Rozpocznij przygodę z fitnessem już teraz.",
                          style: TextStyle(
                              color: lightBlue,
                              fontSize: 15,
                            fontFamily: GoogleFonts.lato().fontFamily,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width/20),
                        child: _buildStartButton(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget _buildStartButton(){
    return ElevatedButton(
      onPressed: () async{
        Navigator.of(context).pushNamed('/setName');
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/4, vertical: MediaQuery.of(context).size.width/20 ),
        child: const Text(
          'Start!',
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
    );
  }
}
