import 'package:bloc/bloc.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit() : super(CityState(value: ''));

  Future<void> inputChanged(String input) async {
    emit(CityState(value: input));
  }
}
