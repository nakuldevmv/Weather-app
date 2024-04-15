import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weather_app_bloc_event.dart';
part 'weather_app_bloc_state.dart';

class WeatherAppBlocBloc extends Bloc<WeatherAppBlocEvent, WeatherAppBlocState> {
  WeatherAppBlocBloc() : super(WeatherAppBlocInitial()) {
    on<WeatherAppBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
