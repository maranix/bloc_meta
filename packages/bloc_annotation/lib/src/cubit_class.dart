import 'package:bloc_annotation/src/annotation.dart';
import 'package:meta/meta_meta.dart';

@Target({TargetKind.classType})
class CubitClass<T> extends BaseAnnotation {
  const CubitClass({super.name, super.copyWith, super.overrideEquality});
}
