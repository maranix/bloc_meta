import 'package:bloc_meta/src/annotation.dart';

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
///
/// @EventMeta()
/// sealed class CounterEvent {
///   const CounterEvent();
///
///   const factory CounterEvent.increment() = _$CounterIncrement;
///   const factory CounterEvent.decrement() = _$CounterDecrement;
/// }
///
/// @BlocMeta<CounterEvent, int>()
/// class CounterBloc extends _$CounterBloc {
///   CounterBloc() : super(0);
///
///   @override
///   void _onIncrement(CounterEvent event, Emitter<int> emit) {
///     emit(state + 1);
///   }
///
///   @override
///   void _onDecrement(CounterEvent event, Emitter<int> emit) {
///     emit(state - 1);
///   }
/// }
/// ```
///
/// Generated code:
/// ```dart
///
/// // Generated Event class
///
/// final class _$CounterIncrement extends CounterEvent {
///   const _$CounterIncrement();
/// }
///
/// final class _$CounterDecrement extends CounterEvent {
///   const _$CounterDecrement();
/// }
///
/// // Generated BLoC class
/// abstract class _$CounterBloc extends Bloc<CounterEvent, int> {
///   _$CounterBloc(super.initialState) {
///     on<CounterEvent>(_onIncrement);
///     on<CounterEvent>(_onDecrement);
///   }
///
///   @override
///   void _onIncrement(CounterEvent event, Emitter<int> emit) {
///     emit(state + 1);
///   }
///
///   @override
///   void _onDecrement(CounterEvent event, Emitter<int> emit) {
///     emit(state - 1);
///   }
/// }
/// ```
final class BlocMeta<E, S> extends BaseAnnotation {
  /// Creates a [BlocMeta] annotation.
  const BlocMeta({
    super.name,
    super.copyWith,
    super.overrideToString,
    super.overrideEquality,
  });
}
