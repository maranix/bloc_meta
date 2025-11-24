import 'package:bloc_annotation/bloc_annotation.dart';
import 'package:source_gen_test/annotations.dart';

abstract class Cubit<State> {
  Cubit(State initialState) : state = initialState;
  State state;
  void emit(State state) {}
}

@ShouldGenerate(r'''
abstract class _$TestCubit extends Cubit<int> {
  _$TestCubit(super.initialState);

  @override
  String toString() => 'TestCubit(state: $state)';

  @override
  int get hashCode => state.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is _$TestCubit && other.state == state;
  }
}
''')
@CubitClass<int>()
final class TestCubit extends _$TestCubit {
  TestCubit() : super(0);
}

abstract class _$TestCubit extends Cubit<int> {
  _$TestCubit(super.initialState);
}
