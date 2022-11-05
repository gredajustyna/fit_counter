import 'package:fit_counter/presentation/blocs/get_all_workouts_bloc/get_all_workouts_bloc.dart';
import 'package:fit_counter/presentation/blocs/get_all_workouts_bloc/get_all_workouts_event.dart';
import 'package:fit_counter/presentation/blocs/get_all_workouts_bloc/get_all_workouts_state.dart';
import 'package:fit_counter/presentation/widgets/workout_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/themes/colors.dart';
import '../../domain/entities/workout.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historia ćwiczeń"),
        centerTitle: true,
        backgroundColor: orange,
        elevation: 0,
      ),
      body: BlocProvider.value(
        value: BlocProvider.of<GetAllWorkoutsBloc>(context)..add(GetAllWorkouts()),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: orange,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 15,
                  child: BlocBuilder<GetAllWorkoutsBloc, GetAllWorkoutsState>(
                    builder: (_, state){
                      if(state is GetAllWorkoutsLoading){
                        return Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }if(state is GetAllWorkoutsDone){
                        return _buildWorkoutsList(state.workouts!);
                      }
                      else{
                        return Center();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWorkoutsList(List<Workout> workouts){
    return ListView.builder(
      itemCount: workouts.length,
      itemBuilder: (context, index){
        return WorkoutWidget(repetitions: workouts[index].repetitions, time: workouts[index].time, date: workouts[index].date);
      }
    );
  }

}


