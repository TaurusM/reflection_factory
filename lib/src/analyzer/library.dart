// LICENSE: BSD-3-Clause License
// Original package: https://pub.dev/packages/source_gen
// Original source: https://github.com/dart-lang/source_gen

import 'package:analyzer/dart/element/element.dart';

import 'reader.dart';
import 'type_checker.dart';

/// Result of finding an [annotation] on [element] through [LibraryReader].
class AnnotatedElement {
  final ConstantReader annotation;
  final Element element;

  const AnnotatedElement(this.annotation, this.element);
}

class LibraryReader {
  final LibraryElement element;

  LibraryReader(this.element);

  /// All the compilation unit of this element ([CompilationUnitElement]).
  Iterable<PartElement> get allParts => element.parts2;

  /// All of the declarations in this library.
  Iterable<Element> get allElements => element.topLevelElements;

  /// All of the declarations in this library annotated with [checker].
  Iterable<AnnotatedElement> annotatedWith(TypeChecker checker,
      {bool throwOnUnresolved = true}) sync* {
    for (final element in allElements) {
      final annotation = checker.firstAnnotationOf(
        element,
        throwOnUnresolved: throwOnUnresolved,
      );
      if (annotation != null) {
        yield AnnotatedElement(ConstantReader(annotation), element);
      }
    }
  }

  /// All of the elements representing classes in this library.
  Iterable<ClassElement> get classes =>
      element.units.expand((CompilationUnitElement cu) => cu.classes);

  /// All of the elements representing enums in this library.
  Iterable<EnumElement> get enums => element.units.expand((cu) => cu.enums2);
}
