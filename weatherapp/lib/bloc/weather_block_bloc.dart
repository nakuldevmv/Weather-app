import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weather_block_event.dart';
part 'weather_block_state.dart';

class WeatherBlockBloc extends Bloc<WeatherBlockEvent, WeatherBlockState> {
  WeatherBlockBloc() : super(WeatherBlockInitial()) {
    on<WeatherBlockEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
