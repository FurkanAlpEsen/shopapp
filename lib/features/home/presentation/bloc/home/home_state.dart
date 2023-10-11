part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState(this.posIndex);

  final int posIndex;
  @override
  List<Object> get props => [posIndex];
}
