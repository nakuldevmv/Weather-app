part of 'weather_block_bloc.dart';

@immutable
sealed class WeatherBlockEvent {}

class FetchWeather extends WeatherBlockEvent {
  final Position position;
  FetchWeather(this.position);

  @override
  List<Object> get props => [position];
}
