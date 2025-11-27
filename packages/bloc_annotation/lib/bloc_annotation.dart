/// Annotations for the `bloc_annotation_generator` package.
///
/// This package provides the annotations used to generate BLoC and Cubit classes,
/// reducing boilerplate and improving developer experience.
///
/// See also:
/// * [BlocClass] for annotating BLoC classes.
/// * [CubitClass] for annotating Cubit classes.
/// * [EventClass] for annotating event methods.
library;

import 'src/bloc.dart';
import 'src/cubit.dart';
import 'src/event.dart';

export 'src/bloc.dart' show BlocClass;
export 'src/cubit.dart' show CubitClass;
export 'src/event.dart' show EventClass;
