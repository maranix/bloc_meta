import 'package:bloc_annotation_generator/src/generators/bloc_generator.dart';
import 'package:bloc_annotation_generator/src/generators/cubit_generator.dart';
import 'package:bloc_annotation_generator/src/generators/event_generator.dart';
import 'package:source_gen_test/source_gen_test.dart';
import 'package:path/path.dart' as p;

Future<void> main() async {
  initializeBuildLogTracking();

  final cubitReader = await initializeLibraryReaderForDirectory(
    p.join('test', 'src'),
    'test_cubit.dart',
  );

  final blocReader = await initializeLibraryReaderForDirectory(
    p.join('test', 'src'),
    'test_bloc.dart',
  );

  final eventReader = await initializeLibraryReaderForDirectory(
    p.join('test', 'src'),
    'test_event.dart',
  );

  testAnnotatedElements(cubitReader, CubitGenerator());
  testAnnotatedElements(blocReader, BlocGenerator());
  testAnnotatedElements(eventReader, EventGenerator());
}
