# bloc_annotation_generator

Code generator for `bloc_annotation`. This package processes `@BlocClass`, `@CubitClass`, and `@EventClass` annotations to generate boilerplate code for BLoC and Cubit classes.

## Features

- Generates BLoC classes with event handling logic.
- Generates Cubit classes.
- Generates Event classes (sealed class hierarchy).
- Generates `copyWith`, `toString`, `hashCode`, and `==` overrides for states and events (configurable).

## Getting started

Add `bloc_annotation_generator` to your `dev_dependencies`:

```yaml
dev_dependencies:
  bloc_annotation_generator: ^1.0.0
  build_runner: ^2.10.0
```

## Usage

Run the build runner to generate code:

```bash
dart run build_runner build
```

Or watch for changes:

```bash
dart run build_runner watch
```

### Configuration

You can configure the generator globally in your `build.yaml` file. The following options are available:

| Option | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `copyWith` | `bool` | `true` | Generates `copyWith` method for the class. |
| `overrideToString` | `bool` | `true` | Overrides `toString` method. |
| `overrideEquality` | `bool` | `true` | Overrides `operator ==` and `hashCode`. |

**Example `build.yaml`:**

```yaml
targets:
  $default:
    builders:
      bloc_annotation_generator:
        options:
          copyWith: true
          overrideToString: false
          overrideEquality: true
```

### Examples

#### BLoC

Input:

```dart
import 'package:bloc_annotation/bloc_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_bloc.g.dart';


@EventClass()
sealed class CounterBlocEvent {
  const factory CounterBlocEvent.increment() = _$CounterIncrement;
  const factory CounterBlocEvent.decrement() = _$CounterDecrement;
}

@BlocClass<CounterEvent, int>()
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

Generated Output (`counter_bloc.g.dart`):

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_bloc.dart';


final class _$CounterIncrement extends CounterBlocEvent {
  const _$CounterIncrement();
}

final class _$CounterDecrement extends CounterBlocEvent {
  const _$CounterDecrement();
}

abstract class _$CounterBloc extends Bloc<CounterBlocEvent, int> {
  _$CounterBloc(super.initialState) {
    on<_$CounterIncrement>(_onIncrement);
    on<_$CounterDecrement>(_onDecrement);
  }

  void _onIncrement(_$CounterIncrement event, Emitter<int> emit);

  void _onDecrement(_$CounterDecrement event, Emitter<int> emit); 
}
```

#### Cubit

Input:

```dart
import 'package:bloc_annotation/bloc_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_cubit.g.dart';

@CubitClass<int>()
class CounterCubit extends _$CounterCubit {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
```

Generated Output (`counter_cubit.g.dart`):

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_cubit.dart';

abstract class _$CounterCubit extends Cubit<int> {
  _$CounterCubit(super.initialState);
}
```
