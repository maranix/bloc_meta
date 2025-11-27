import 'package:bloc_meta/src/annotation.dart';
import 'package:bloc_meta/src/bloc.dart';
import 'package:meta/meta_meta.dart';

/// Annotation to mark a method as an event handler.
///
/// This annotation is used within a [BlocMeta] annotated class to define
/// event handlers.
///
/// Example:
/// ```dart
/// @EventMeta()
/// sealed class CounterEvent {
///   const CounterEvent();
///
///   const factory CounterEvent.increment() = _$CounterIncrement;
///
///   const factory CounterEvent.decrement() = _$CounterDecrement;
/// }
/// ```
///
/// Generated code:
/// ```dart
/// final class _$CounterIncrement extends _$CounterEvent {
///   const _$CounterIncrement();
/// }
///
/// final class _$CounterDecrement extends _$CounterEvent {
///   const _$CounterDecrement();
/// }
/// ```
@Target({TargetKind.classType})
class EventMeta extends BaseAnnotation {
  /// Creates an [EventMeta] annotation.
  const EventMeta({
    super.name,
    super.copyWith,
    super.overrideEquality,
    super.overrideToString,
  });
}
