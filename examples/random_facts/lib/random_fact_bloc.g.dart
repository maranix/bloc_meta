// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_fact_bloc.dart';

// **************************************************************************
// BlocGenerator
// **************************************************************************

sealed class RandomFactBlocEvent {}

abstract class _$RandomFactBloc extends Bloc<RandomFactBlocEvent, List<Fact>> {
  _$RandomFactBloc(super.initialState) {
    on<FetchRandomFact>((event, emit) => fetchRandomFact(event, emit));
  }

  void fetchRandomFact(FetchRandomFact event, Emitter<List<Fact>> emit);
}
