import 'package:fit_counter/config/themes/colors.dart';
import 'package:flutter/material.dart';

class CountView extends StatefulWidget {
  const CountView({Key? key}) : super(key: key);

  @override
  State<CountView> createState() => _CountViewState();
}

class _CountViewState extends State<CountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: const RadialGradient(
            colors: [lightBlue, deepBlue],
            radius: 0.9,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/8,),
                Text("Czas:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45
                  ),
                ),
                Text("0:24",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/8,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20, vertical: MediaQuery.of(context).size.width/20),
                  child: Text('Zablokuj ekran, wykonuj przysiady a po zakończeniu ćwiczenia kliknij przycisk "zakończ"', style: TextStyle(color: black, fontSize: 20), textAlign: TextAlign.center,),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/4,),
                ElevatedButton(
                  onPressed: () async{
                    Navigator.of(context).pushNamed('/stop');
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/4, vertical: MediaQuery.of(context).size.width/20 ),
                    child: const Text(
                      'Zakończ!',
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