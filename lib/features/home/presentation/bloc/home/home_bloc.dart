import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(super.initialState) {
    on<HomeEvent>(onChangePosIndex);
  }

  void onChangePosIndex(HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeState(event.posIndex));
  }
}
