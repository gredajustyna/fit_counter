import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/themes/colors.dart';

class StopView extends StatefulWidget {
  const StopView({Key? key}) : super(key: key);

  @override
  State<StopView> createState() => _StopViewState();
}

class _StopViewState extends State<StopView> {
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: orange.withOpacity(0.7),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/25),
                  child: Text('Podsumowanie ćwiczenia',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/15,),
                Text('Twój wynik to',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.openSans().fontFamily,
                      fontSize: 20,
                  ),
                ),
                Text('5',
                  style: TextStyle(
                    color: lightBlue,
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontSize: 80,
                  ),
                ),
                Text('powtórzeń w czasie',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontSize: 20,
                  ),
                ),
                Text('2:54',
                  style: TextStyle(
                    color: lightBlue,
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontSize: 60,
                  ),
                ),
                Text('Gratulacje!',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/15,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height/30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Czy wiesz, że...", style: TextStyle(color: lightBlue),),
                      Text("Wg University of Granada 4 przysiady z obciążeniem przed wejściem do wody poprawiły czasy pływaków na 15 m.", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/15,),
                ElevatedButton(
                  onPressed: () async{
                    Navigator.of(context).pushNamedAndRemoveUntil('/welcome', (route) => false);
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/4, vertical: MediaQuery.of(context).size.width/20 ),
                    child: const Text(
                      'Koniec!',
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
}
