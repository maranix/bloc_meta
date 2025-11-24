import 'package:bloc_annotation/bloc_annotation.dart';
import 'package:source_gen_test/annotations.dart';

@ShouldGenerate(r'''
final class _$TestBlocEventIncrement extends TestBlocEvent {
  const _$TestBlocEventIncrement();
}
''')
@EventClass()
sealed class TestBlocEvent {
  const TestBlocEvent();
  const factory TestBlocEvent.increment() = _$TestBlocEventIncrement;
}

final class _$TestBlocEventIncrement extends TestBlocEvent {
  const _$TestBlocEventIncrement();
}
