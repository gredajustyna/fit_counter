import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../../../config/themes/colors.dart';

class SetNameView extends StatefulWidget {
  const SetNameView({Key? key}) : super(key: key);

  @override
  State<SetNameView> createState() => _SetNameViewState();
}

class _SetNameViewState extends State<SetNameView> {
  TextEditingController nameController = TextEditingController();
  bool isWomanChecked = false;
  bool isManChecked = false;
  bool isOtherChecked = false;

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
          child: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/25),
                      child: Text('Opowiedz coś o sobie',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    DelayedDisplay(
                      slidingBeginOffset: Offset(1.0, 0),
                      delay: Duration(milliseconds: 750),
                      child: Card(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          width:  MediaQuery.of(context).size.width *0.95,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  lightBlue,
                                  deepBlue,
                                ],
                              ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/35, horizontal: MediaQuery.of(context).size.height/40),
                                child: Text("Jak się nazywasz?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  controller: nameController,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),


                    DelayedDisplay(
                      slidingBeginOffset: Offset(-1.0, 0),
                      delay: Duration(milliseconds: 1500),
                      child: Card(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width:  MediaQuery.of(context).size.width *0.95,
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
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/35, horizontal: MediaQuery.of(context).size.height/40),
                                child: Text("Jaka jest twoja płeć?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height/40),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.female,
                                      color: Colors.pinkAccent,
                                      size: 30,
                                    ),
                                    Checkbox(
                                      side: MaterialStateBorderSide.resolveWith(
                                            (states) => BorderSide(width: 1.0, color: Colors.white),
                                      ),
                                      activeColor: lightBlue,
                                      checkColor: deepBlue,
                                      value: isWomanChecked,
                                      onChanged: (value){
                                        setState((){
                                          isWomanChecked = !isWomanChecked;
                                          isManChecked = false;
                                          isOtherChecked = false;
                                        });
                                      }
                                    ),
                                    Text(
                                      "kobieta",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height/40),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.male,
                                      color: Colors.blue,
                                      size: 30,
                                    ),
                                    Checkbox(
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width: 1.0, color: Colors.white),
                                        ),
                                        activeColor: lightBlue,
                                        checkColor: deepBlue,
                                        value: isManChecked,
                                        onChanged: (value){
                                          setState((){
                                            isManChecked = !isManChecked;
                                            isWomanChecked = false;
                                            isOtherChecked = false;
                                          });
                                        }
                                    ),
                                    Text(
                                      "mężczyzna",
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height/40),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.transgender,
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                    Checkbox(
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width: 1.0, color: Colors.white),
                                        ),
                                        activeColor: lightBlue,
                                        checkColor: deepBlue,
                                        value: isOtherChecked,
                                        onChanged: (value){
                                          setState((){
                                            isOtherChecked = !isOtherChecked;
                                            isWomanChecked = false;
                                            isManChecked = false;
                                          });
                                        }
                                    ),
                                    Text(
                                      "Inna/nie chcę podawać",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height/35,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),


                    DelayedDisplay(
                      slidingBeginOffset: Offset(1.0, 0),
                      delay: Duration(milliseconds: 2250),
                      child: Card(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          width:  MediaQuery.of(context).size.width *0.95,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                lightBlue,
                                deepBlue,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/35, horizontal: MediaQuery.of(context).size.height/40),
                                child: Text("Czy chcesz ustawić dzienny cel?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/30,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
