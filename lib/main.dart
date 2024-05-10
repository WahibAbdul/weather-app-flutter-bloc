import 'package:falconi_weather/src/app/my_app.dart';
import 'package:falconi_weather/src/main/bloc/main_bloc_observer.dart';
import 'package:falconi_weather/src/main/bootstrap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = MainBlocObserver();
  bootstrap(const MyApp());
}
