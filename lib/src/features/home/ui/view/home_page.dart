import 'package:falconi_weather/src/features/home/bloc/location_weather_bloc.dart';
import 'package:falconi_weather/src/features/home/ui/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<LocationWeatherBloc>().add(
          LocationWeatherFetchedEvent(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        bottom: false,
        child: HomeView(),
      ),
    );
  }
}
