import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/Data/MyData.dart';

part 'weather_block_event.dart';
part 'weather_block_state.dart';

class WeatherBlockBloc extends Bloc<WeatherBlockEvent, WeatherBlockState> {
  WeatherBlockBloc() : super(WeatherBlockInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlockLoading());
      try {
        WeatherFactory wf = WeatherFactory(My_Api, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        print(weather);

        emit(WeatherBlockSuccess(weather));
      } catch (e) {
        emit(WeatherBlockFailure());
      }
    });
  }
}
