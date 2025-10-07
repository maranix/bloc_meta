import 'package:bloc_annotation_generator/src/cubit_generator.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

Builder cubitClassBuilder(BuilderOptions options) =>
    SharedPartBuilder([CubitClassGenerator()], "cubitClass");
