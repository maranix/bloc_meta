/// Annotations for the `bloc_meta_generator` package.
///
/// This package provides the annotations used to generate BLoC and Cubit classes,
/// reducing boilerplate and improving developer experience.
///
/// See also:
/// * [BlocMeta] for annotating BLoC classes.
/// * [CubitMeta] for annotating Cubit classes.
/// * [EventMeta] for annotating event methods.
library;

import 'src/bloc.dart';
import 'src/cubit.dart';
import 'src/event.dart';

export 'src/bloc.dart' show BlocMeta;
export 'src/cubit.dart' show CubitMeta;
export 'src/event.dart' show EventMeta;
