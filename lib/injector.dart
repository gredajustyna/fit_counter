import 'package:fit_counter/domain/usecases/add_workout_usecase.dart';
import 'package:fit_counter/domain/usecases/get_all_workouts_usecase.dart';
import 'package:fit_counter/domain/usecases/get_repetitions_usecase.dart';
import 'package:fit_counter/presentation/blocs/add_workout_bloc/add_workout_bloc.dart';
import 'package:fit_counter/presentation/blocs/get_all_workouts_bloc/get_all_workouts_bloc.dart';
import 'package:fit_counter/presentation/blocs/get_repetitions_bloc/get_repetitions_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import 'data/datasources/database_service.dart';
import 'data/repositories/codes_repository_impl.dart';
import 'domain/repositories/codes_repository.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  final databaseService = DatabaseService.db;
  final database = await databaseService.initDB();

  injector.registerSingleton<Database>(database);
  injector.registerSingleton<CodesRepository>(CodesRepositoryImpl(injector()));
  
  injector.registerFactory<AddWorkoutBloc>(() => AddWorkoutBloc(injector()));
  injector.registerFactory<GetAllWorkoutsBloc>(() => GetAllWorkoutsBloc(injector()));
  injector.registerFactory<GetRepetitionsBloc>(() => GetRepetitionsBloc(injector()));

  injector.registerSingleton<AddWorkoutUseCase>(AddWorkoutUseCase(injector()));
  injector.registerSingleton<GetAllWorkoutsUseCase>(GetAllWorkoutsUseCase(injector()));
  injector.registerSingleton<GetRepetitionsUseCase>(GetRepetitionsUseCase(injector()));
}