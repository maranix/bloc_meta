import 'package:bloc_annotation/src/annotation.dart';
import 'package:bloc_annotation/src/bloc.dart';
import 'package:meta/meta_meta.dart';

/// Annotation to mark a method as an event handler.
///
/// This annotation is used within a [BlocClass] annotated class to define
/// event handlers.
///
/// Example:
/// ```dart
/// @EventClass()
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
class EventClass extends BaseAnnotation {
  /// Creates an [EventClass] annotation.
  const EventClass({
    super.name,
    super.copyWith,
    super.overrideEquality,
    super.overrideToString,
  });
}
