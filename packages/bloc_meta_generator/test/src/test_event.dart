import 'package:bloc_meta/bloc_meta.dart';
import 'package:source_gen_test/annotations.dart';

@ShouldGenerate(r'''
final class _$TestBlocEventIncrement extends TestBlocEvent {
  const _$TestBlocEventIncrement();
}
''')
@EventMeta()
sealed class TestBlocEvent {
  const TestBlocEvent();
  const factory TestBlocEvent.increment() = _$TestBlocEventIncrement;
}

final class _$TestBlocEventIncrement extends TestBlocEvent {
  const _$TestBlocEventIncrement();
}
