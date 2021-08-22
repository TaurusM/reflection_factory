// LICENSE: BSD-3-Clause License
// Original package: https://pub.dev/packages/source_gen
// Original source: https://github.com/dart-lang/source_gen

import 'dart:io';

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:path/path.dart' as p;
import 'package:pub_semver/pub_semver.dart';
import 'package:yaml/yaml.dart';

/// Returns a non-null name for the provided [type].
///
/// In newer versions of the Dart analyzer, a `typedef` does not keep the
/// existing `name`, because it is used an alias:
/// ```
/// // Used to return `VoidFunc` for name, is now `null`.
/// typedef VoidFunc = void Function();
/// ```
///
/// This function will return `'VoidFunc'`, unlike [DartType.element.name].
String typeNameOf(DartType type) {
  final aliasElement = type.alias?.element;
  if (aliasElement != null) {
    return aliasElement.name;
  }
  if (type is DynamicType) {
    return 'dynamic';
  }
  if (type is InterfaceType) {
    return type.element.name;
  }
  if (type is TypeParameterType) {
    return type.element.name;
  }
  throw UnimplementedError('(${type.runtimeType}) $type');
}

bool hasExpectedPartDirective(CompilationUnit unit, String part) =>
    unit.directives
        .whereType<PartDirective>()
        .any((e) => e.uri.stringValue == part);

/// Returns a name suitable for `part of "..."` when pointing to [element].
String nameOfPartial(LibraryElement element, AssetId source, AssetId output) {
  if (element.name.isNotEmpty) {
    return element.name;
  }

  assert(source.package == output.package);
  final relativeSourceUri =
      p.url.relative(source.path, from: p.dirname(output.path));
  return '\'$relativeSourceUri\'';
}

/// Returns a suggested library identifier based on [source] path and package.
String suggestLibraryName(AssetId source) {
  // lib/test.dart --> [lib/test.dart]
  final parts = source.path.split('/');
  // [lib/test.dart] --> [lib/test]
  parts[parts.length - 1] = parts.last.split('.').first;
  // [lib/test] --> [test]
  if (parts.first == 'lib') {
    parts.removeAt(0);
  }
  return '${source.package}.${parts.join('.')}';
}

/// Returns what 'part "..."' URL is needed to import [output] from [input].
///
/// For example, will return `test_lib.g.dart` for `test_lib.dart`.
String computePartUrl(AssetId input, AssetId output) =>
    p.joinAll(p.split(p.relative(output.path, from: input.path)).skip(1));

/// Returns a URL representing [element].
String urlOfElement(Element element) => element.kind == ElementKind.DYNAMIC
    ? 'dart:core#dynamic'
// using librarySource.uri – in case the element is in a part
    : normalizeUrl(element.librarySource!.uri)
        .replace(fragment: element.name)
        .toString();

Uri normalizeUrl(Uri url) {
  switch (url.scheme) {
    case 'dart':
      return normalizeDartUrl(url);
    case 'package':
      return packageToAssetUrl(url);
    case 'file':
      return fileToAssetUrl(url);
    default:
      return url;
  }
}

Version asdasdasd(LibraryElement libraryElement) {
  var uri = libraryElement.source.uri;

  return Version.none;
}

/// Make `dart:`-type URLs look like a user-knowable path.
///
/// Some internal dart: URLs are something like `dart:core/map.dart`.
///
/// This isn't a user-knowable path, so we strip out extra path segments
/// and only expose `dart:core`.
Uri normalizeDartUrl(Uri url) => url.pathSegments.isNotEmpty
    ? url.replace(pathSegments: url.pathSegments.take(1))
    : url;

Uri fileToAssetUrl(Uri url) {
  if (!p.isWithin(p.current, url.path)) return url;
  return Uri(
      scheme: 'asset', path: p.join(rootPackageName, p.relative(url.path)));
}

/// Returns a `package:` URL converted to a `asset:` URL.
///
/// This makes internal comparison logic much easier, but still allows users
/// to define assets in terms of `package:`, which is something that makes more
/// sense to most.
///
/// For example, this transforms `package:source_gen/source_gen.dart` into:
/// `asset:source_gen/lib/source_gen.dart`.
Uri packageToAssetUrl(Uri url) => url.scheme == 'package'
    ? url.replace(
        scheme: 'asset',
        pathSegments: <String>[
          url.pathSegments.first,
          'lib',
          ...url.pathSegments.skip(1),
        ],
      )
    : url;

/// Returns a `asset:` URL converted to a `package:` URL.
///
/// For example, this transformers `asset:source_gen/lib/source_gen.dart' into:
/// `package:source_gen/source_gen.dart`. Asset URLs that aren't pointing to a
/// file in the 'lib' folder are not modified.
///
/// Asset URLs come from `package:build`, as they are able to describe URLs that
/// are not describable using `package:...`, such as files in the `bin`, `tool`,
/// `web`, or even root directory of a package - `asset:some_lib/web/main.dart`.
Uri assetToPackageUrl(Uri url) => url.scheme == 'asset' &&
        url.pathSegments.isNotEmpty &&
        url.pathSegments[1] == 'lib'
    ? url.replace(scheme: 'package', pathSegments: [
        url.pathSegments.first,
        ...url.pathSegments.skip(2),
      ])
    : url;

final String rootPackageName = () {
  final name =
      (loadYaml(File('pubspec.yaml').readAsStringSync()) as Map)['name'];
  if (name is! String) {
    throw StateError(
        'Your pubspec.yaml file is missing a `name` field or it isn\'t '
        'a String.');
  }
  return name;
}();

/// Throws a [FormatException] if [root] does not have a given field [name].
///
/// Super types [ClassElement.supertype] are also checked before throwing.
void assertHasField(ClassElement root, String name) {
  ClassElement? element = root;
  while (element != null) {
    final field = element.getField(name);
    if (field != null) {
      return;
    }
    element = element.supertype?.element;
  }
  final allFields = root.fields.toSet()
    ..addAll(root.allSupertypes.expand((t) => t.element.fields));
  throw FormatException(
    'Class ${root.name} does not have field "$name".',
    'Fields: \n  - ${allFields.map((e) => e.name).join('\n  - ')}',
  );
}

/// Returns whether or not [object] is or represents a `null` value.
bool isNullLike(DartObject? object) => object?.isNull != false;

/// Similar to [DartObject.getField], but traverses super classes.
///
/// Returns `null` if ultimately [field] is never found.
DartObject? getFieldRecursive(DartObject? object, String field) {
  if (isNullLike(object)) {
    return null;
  }
  final result = object!.getField(field);
  if (isNullLike(result)) {
    return getFieldRecursive(object.getField('(super)'), field);
  }
  return result;
}
