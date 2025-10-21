import 'package:analyzer/dart/element/element.dart';
import 'package:bloc_annotation_generator/src/exceptions.dart';
import 'package:bloc_annotation_generator/src/extensions.dart';
import 'package:bloc_annotation_generator/src/types.dart';

abstract class ElementCodeGenerator {
  const ElementCodeGenerator(this.element);

  final Element element;

  String get name;

  List<ElementAttribute> collectAttributes();

  String copyWith();

  String overrideToString();

  String overrideHashCode();

  String overrideEqualityOperator();
}

final class ClassCodeGenerator extends ElementCodeGenerator {
  ClassCodeGenerator(super.element) {
    if (!element.kindOf(ElementKind.CLASS)) {
      throw InvalidSourceElementException(
        got: element,
        expected: ElementKind.CLASS,
      );
    }
  }

  @override
  String get name => element.displayName;

  @override
  List<ElementAttribute> collectAttributes() => (element as ClassElement).fields
      .where((f) => f.isFinal && f.isPublic)
      .map((f) => (name: f.displayName, type: f.type.getDisplayString()))
      .toList();

  @override
  String copyWith() {
    final attributes = collectAttributes();
    if (attributes.isEmpty) {
      return '$name()';
    }

    final builder = StringBuffer('return $name(');
    for (final a in attributes.take(attributes.length - 1)) {
      final name = a.name;
      builder.write('$name: $name ?? this.$name)');
    }

    final remainingAttribute = attributes.last.name;
    builder.write(
      '$remainingAttribute: $remainingAttribute ?? this.$remainingAttribute)',
    );

    return builder.toString();
  }

  @override
  String overrideToString() {
    final attributes = collectAttributes();

    // TODO: We should add state here as well incase it is a Cubit or Bloc
    //
    // Otherwise we are already printing out the attributes of the Event or State like classes
    if (attributes.isEmpty) {
      return '\'$name()\'';
    }

    final builder = StringBuffer('\'$name(\'');

    for (final a in attributes.take(attributes.length - 1)) {
      final name = a.name;
      builder.write('$name: $name,');
    }

    final remainingAttribute = attributes.last.name;
    builder.write('$remainingAttribute: $remainingAttribute)\'');

    return builder.toString();
  }

  @override
  String overrideHashCode() =>
      'Object.hashAll([${collectAttributes().map((a) => a.name).join(', ')}])';

  @override
  String overrideEqualityOperator() {
    final attributes = collectAttributes();

    if (attributes.isEmpty) return 'true';

    final builder = StringBuffer(
      'if (identical(this, other)) return true;'
      '\n'
      'if (other.runtimeType != runtimeType) return false;'
      'return other is $name &&',
    );

    for (final a in attributes.take(attributes.length - 1)) {
      final name = a.name;
      builder.write('$name == this.$name &&');
    }

    final remainingAttribute = attributes.last.name;
    builder.write('$remainingAttribute == this.$remainingAttribute');

    return builder.toString();
  }
}
