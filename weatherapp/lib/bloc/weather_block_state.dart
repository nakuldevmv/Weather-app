part of 'weather_block_bloc.dart';

@immutable
sealed class WeatherBlockState {}

final class WeatherBlockInitial extends WeatherBlockState {}

final class WeatherBlockLoading extends WeatherBlockState {}

final class WeatherBlockFailure extends WeatherBlockState {}

final class WeatherBlockSuccess extends WeatherBlockState {
  final Weather weather;

  WeatherBlockSuccess(this.weather);

  @override
  List<Object> get props => [weather];
}
