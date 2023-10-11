part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent(this.posIndex);

  final int posIndex;
  @override
  List<Object> get props => [posIndex];
}
