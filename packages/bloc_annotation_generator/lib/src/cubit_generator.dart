import 'package:analyzer/dart/element/element.dart';
import 'package:bloc_annotation/bloc_annotation.dart';
import 'package:bloc_annotation_generator/src/extensions.dart';
import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';

final class CubitClassGenerator extends GeneratorForAnnotation<CubitClass> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    // TODO: improve exceptions and provide more informative messages.
    if (!element.isClass) {
      throw InvalidGenerationSource(
        "Expected annotated target to be a Class but found ${element.kind.displayName}",
      );
    }

    final annotationProps = annotation.getCubitClassAnnotationProperties();

    final name = switch (annotationProps.name.isEmpty) {
      false => annotationProps.name,
      true => element.displayName,
    };

    final generatedClass = Class(
      (b) => b
        ..abstract = true
        ..name = "_\$$name"
        ..extend = refer('Cubit<${annotationProps.state}>')
        ..constructors.add(
          Constructor(
            (c) => c
              ..requiredParameters.add(
                Parameter(
                  (p) => p
                    ..toSuper = true
                    ..name = "initialState",
                ),
              ),
          ),
        ),
    );

    final emitter = DartEmitter();

    return DartFormatter(
      languageVersion: DartFormatter.latestLanguageVersion,
    ).format("${generatedClass.accept(emitter)}");
  }
}
