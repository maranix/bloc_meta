import 'package:bloc_annotation/src/annotation.dart';

/// Annotation to mark a class as a BLoC.
///
/// This annotation triggers the generation of a BLoC class with the specified
/// event and state types.
///
/// [E] is the Event type.
/// [S] is the State type.
///
/// Example:
/// ```dart
/// @BlocClass<CounterEvent, int>()
/// class CounterBloc extends _$CounterBloc { ... }
/// ```
final class BlocClass<E, S> extends BaseAnnotation {
  /// Creates a [BlocClass] annotation.
  const BlocClass({
    super.name,
    super.copyWith,
    super.overrideToString,
    super.overrideEquality,
  });
}
