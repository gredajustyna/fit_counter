import 'package:fit_counter/presentation/blocs/add_workout_bloc/add_workout_bloc.dart';
import 'package:fit_counter/presentation/blocs/get_all_workouts_bloc/get_all_workouts_bloc.dart';
import 'package:fit_counter/presentation/blocs/get_repetitions_bloc/get_repetitions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/routes/routes.dart';
import 'core/utils/constants.dart';
import 'injector.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AddWorkoutBloc>(
          create: (_) => injector<AddWorkoutBloc>(),
        ),
        BlocProvider<GetAllWorkoutsBloc>(
          create: (_) => injector<GetAllWorkoutsBloc>(),
        ),
        BlocProvider<GetRepetitionsBloc>(
          create: (_) => injector<GetRepetitionsBloc>(),
        ),
      ],
      child: MyApp(preferences: prefs,)
    )
  );
}

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;
  const MyApp({Key? key, required this.preferences}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if(preferences.getString("username")!= null){
      return const MaterialApp(
        title: kAppName,
        onGenerateRoute: Routes.onGenerateRoutesLogged,
        debugShowCheckedModeBanner: false,
      );
    }else{
      return const MaterialApp(
        title: kAppName,
        onGenerateRoute: Routes.onGenerateRoutes,
        debugShowCheckedModeBanner: false,
      );
    }
  }
}
