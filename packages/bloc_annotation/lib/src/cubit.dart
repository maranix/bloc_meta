import 'package:bloc_annotation/src/annotation.dart';
import 'package:meta/meta_meta.dart';

/// Annotation to mark a class as a Cubit.
///
/// This annotation triggers the generation of a Cubit class with the specified
/// state type.
///
/// [S] is the State type.
///
/// Example:
/// ```dart
/// @CubitClass<int>()
/// class CounterCubit extends _$CounterCubit { ... }
/// ```
///
/// Generated code:
/// ```dart
/// final class _$CounterCubit extends Cubit<int> {
///   _$CounterCubit() : super(0);
/// }
/// ```
@Target({TargetKind.classType})
final class CubitClass<S> extends BaseAnnotation {
  /// Creates a [CubitClass] annotation.
  const CubitClass({
    super.name,
    super.copyWith,
    super.overrideToString,
    super.overrideEquality,
  });
}
