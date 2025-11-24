import 'package:bloc_annotation/src/annotation.dart';
import 'package:meta/meta_meta.dart';

@Target({TargetKind.classType})
class EventClass extends BaseAnnotation {
  const EventClass({
    super.name,
    super.copyWith,
    super.overrideEquality,
    super.overrideToString,
  });
}
