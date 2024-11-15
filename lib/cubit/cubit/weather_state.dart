part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

/////
class WeatherLoading extends WeatherState {} // get data

class WeatherLoaded extends WeatherState {} // data atived

class WeatherError extends WeatherState {} // data failer error 
