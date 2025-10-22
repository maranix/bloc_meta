import 'package:bloc_annotation_generator/src/generators/cubit_generator.dart';
import 'package:bloc_annotation_generator/src/generators/state_generator.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

Builder cubitClassBuilder(BuilderOptions options) =>
    SharedPartBuilder([CubitClassGenerator()], "cubitClass");

Builder stateClassBuilder(BuilderOptions options) =>
    SharedPartBuilder([StateClassGenerator()], "stateClass");

Builder stateEnumBuilder(BuilderOptions options) =>
    SharedPartBuilder([StateEnumGenerator()], "stateEnum");
