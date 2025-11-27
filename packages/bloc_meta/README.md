# bloc_meta

Annotations for the `bloc_meta_generator` package. This package provides the annotations used to generate BLoC and Cubit classes, reducing boilerplate and improving developer experience.

## Features

- `@BlocMeta`: Annotate your class to generate a BLoC.
- `@CubitMeta`: Annotate your class to generate a Cubit.
- `@EventMeta`: Annotate methods to generate BLoC events.

## Getting started

Add `bloc_meta` to your `pubspec.yaml`:

```yaml
dependencies:
  bloc_meta: ^1.0.0

dev_dependencies:
  bloc_meta_generator: ^1.0.0
  build_runner: ^2.10.0
```

## Usage

### Annotating a BLoC

```dart
import 'package:bloc_meta/bloc_meta.dart';

@EventMeta()
sealed class CounterEvent {
  const CounterEvent();

  const factory CounterEvent.increment() = _$CounterIncrement;

  const factory CounterEvent.decrement() = _$CounterDecrement;
}

@BlocMeta<CounterEvent, int>()
class CounterBloc extends _$CounterBloc {
  CounterBloc() : super(0);

  @override
  void _onIncrement(_$CounterIncrement event, Emitter<int> emit) {
    emit(state + 1);
  }

  @override
  void _onDecrement(_$CounterDecrement event, Emitter<int> emit) {
    emit(state - 1);
  }
}
```

### Annotating a Cubit

```dart
import 'package:bloc_meta/bloc_meta.dart';

@CubitMeta<int>()
class CounterCubit extends _$CounterCubit {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
```
