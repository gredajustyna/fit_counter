import 'package:fit_counter/config/themes/colors.dart';
import 'package:flutter/material.dart';
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
            padding:EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width/10),
            child: IconButton(
              icon: const Icon(Ionicons.calendar, color: silver,),
              onPressed: () {

              },
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding:EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width/10),
          child: IconButton(
            icon: const Icon(Ionicons.settings, color: silver,),
            onPressed: () {

            },
          ),
        ),
      ),
    );
  }
}
