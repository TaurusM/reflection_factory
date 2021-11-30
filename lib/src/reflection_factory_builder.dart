import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:reflection_factory/src/reflection_factory_base.dart';

import 'analyzer/library.dart';
import 'analyzer/type_checker.dart';
import 'reflection_factory_annotation.dart';

/// The reflection builder.
class ReflectionBuilder implements Builder {
  /// If `true` builds code in verbose mode.
  bool verbose;

  ReflectionBuilder({this.verbose = false});

  @override
  final buildExtensions = const {
    '.dart': ['.reflection.g.dart']
  };

  static const TypeChecker typeReflectionBridge =
      TypeChecker.fromRuntime(ReflectionBridge);

  static const TypeChecker typeEnableReflection =
      TypeChecker.fromRuntime(EnableReflection);

  @override
  Future<void> build(BuildStep buildStep) async {
    var inputLib = await buildStep.inputLibrary;
    var inputId = buildStep.inputId;

    if (inputId.package == 'reflection_factory') {
      if (!inputId.path.startsWith('example/') &&
          !inputId.path.startsWith('test/')) {
        return;
      }
    } else if (inputLib.name == 'reflection_factory' ||
        inputLib.name.startsWith('reflection_factory.')) {
      return;
    }

    var libraryReader = LibraryReader(inputLib);

    var codeTable = await _buildCodeTable(buildStep, libraryReader);

    if (codeTable.isEmpty) {
      return;
    }

    var siblingsClassReflection = _buildSiblingsClassReflection(codeTable);

    var fullCode = StringBuffer();

    fullCode.write('// \n');
    fullCode.write('// GENERATED CODE - DO NOT MODIFY BY HAND!\n');
    fullCode
        .write('// BUILDER: reflection_factory/${ReflectionFactory.VERSION}\n');
    fullCode.write('// BUILD COMMAND: dart run build_runner build\n');
    fullCode.write('// \n\n');

    fullCode.write('// ignore_for_file: unnecessary_const\n\n');

    fullCode.write("part of '${inputId.pathSegments.last}';\n\n");

    var codeKeys = codeTable.keys.toList();
    _sortCodeKeys(codeKeys);

    for (var key in codeKeys) {
      var code = codeTable[key]!;
      if (code.trim().isNotEmpty) {
        fullCode.write(code);
      }
    }

    fullCode.write(siblingsClassReflection);

    var genId = inputId.changeExtension('.reflection.g.dart');

    var generatedCode = fullCode.toString();

    var dartFormatter = DartFormatter();
    var formattedCode = dartFormatter.format(generatedCode);

    await buildStep.writeAsString(genId, formattedCode);

    print('** GENERATED:\n'
        '  -- Elements: $codeKeys\n'
        '  -- Code file: $genId\n');

    if (verbose) {
      print('<<<\n$formattedCode\n>>>');
    }
  }

  Future<Map<String, String>> _buildCodeTable(
      BuildStep buildStep, LibraryReader libraryReader) async {
    var codeTable = <String, String>{};

    var annotatedReflectionBridge =
        libraryReader.annotatedWith(typeReflectionBridge).toList();

    for (var annotated in annotatedReflectionBridge) {
      if (annotated.element.kind == ElementKind.CLASS) {
        var codes = await _reflectionBridge(buildStep, annotated);
        codeTable.addAll(codes);
      }
    }

    var annotatedEnableReflection =
        libraryReader.annotatedWith(typeEnableReflection).toList();

    for (var annotated in annotatedEnableReflection) {
      var annotation = annotated.annotation;
      var reflectionClassName =
          annotation.peek('reflectionClassName')!.stringValue;
      var reflectionExtensionName =
          annotated.annotation.peek('reflectionExtensionName')!.stringValue;

      if (annotated.element.kind == ElementKind.CLASS) {
        var classElement = annotated.element as ClassElement;

        var codes = await _enableReflectionClass(
          buildStep,
          classElement,
          reflectionClassName,
          reflectionExtensionName,
        );

        codeTable.addAll(codes);
      } else if (annotated.element.kind == ElementKind.ENUM) {
        var enumElement = annotated.element;

        var codes = await _enableReflectionEnum(
          buildStep,
          enumElement,
          reflectionClassName,
          reflectionExtensionName,
        );

        codeTable.addAll(codes);
      }
    }

    return codeTable;
  }

  void _sortCodeKeys(List<String> codeKeys) {
    codeKeys.sort((a, b) {
      var k1 = _parseCodeKey(a);
      var k2 = _parseCodeKey(b);
      var cmp = k1.compareTo(k2);
      if (cmp == 0) {
        cmp = a.compareTo(b);
      }
      return cmp;
    });
  }

  String _parseCodeKey(String s) {
    var idx = s.indexOf(r'$');
    return idx >= 0 ? s.substring(idx + 1) : s;
  }

  Future<Map<String, String>> _reflectionBridge(
      BuildStep buildStep, AnnotatedElement annotated) async {
    var annotation = annotated.annotation;
    var annotatedClass = annotated.element as ClassElement;

    var classesTypes = annotation
        .peek('classesTypes')!
        .listValue
        .map((e) => e.toTypeValue()!)
        .toList();

    var bridgeExtensionName =
        annotation.peek('bridgeExtensionName')!.stringValue;
    var reflectionClassNames = annotation
        .peek('reflectionClassNames')!
        .mapValue
        .map((k, v) => MapEntry(k!.toTypeValue()!, v!.toStringValue()!));
    var reflectionExtensionNames = annotation
        .peek('reflectionExtensionNames')!
        .mapValue
        .map((k, v) => MapEntry(k!.toTypeValue()!, v!.toStringValue()!));

    print('** ReflectionBridge:\n'
        '  -- classesTypes: $classesTypes\n'
        '  -- bridgeExtensionName: $bridgeExtensionName\n'
        '  -- reflectionClassNames: $reflectionClassNames\n'
        '  -- reflectionExtensionNames: $reflectionExtensionNames\n');

    var codeTable = <String, String>{};

    for (var classType in classesTypes) {
      var classElement = classType.element;
      if (classElement == null || classElement is! ClassElement) {
        continue;
      }

      var classLibrary = await _getElementLibrary(buildStep, classElement);

      var reflectionClassName = reflectionExtensionNames[classType] ?? '';
      var reflectionExtensionName = reflectionExtensionNames[classType] ?? '';

      var classTree = _ClassTree(
        classElement,
        reflectionClassName,
        reflectionExtensionName,
        classLibrary.languageVersion.effective,
        verbose: verbose,
      );

      if (verbose) {
        print(classTree);
      }

      codeTable.putIfAbsent(classTree.classGlobalFunction('_'),
          () => classTree.buildClassGlobalFunctions());
      codeTable.putIfAbsent(
          classTree.reflectionClass, () => classTree.buildReflectionClass());
      codeTable.putIfAbsent(classTree.reflectionExtension,
          () => classTree.buildReflectionExtension());
    }

    codeTable.addAll(_reflectionBridgeExtension(annotatedClass, classesTypes,
        bridgeExtensionName, reflectionClassNames));

    return codeTable;
  }

  Map<String, String> _reflectionBridgeExtension(
      ClassElement annotatedClass,
      List<DartType> classesTypes,
      String reflectionBridgeExtensionName,
      Map<DartType, String> reflectionClassNames) {
    var bridgeClassName = annotatedClass.name;

    var bridgeExtensionName = _buildReflectionExtensionName(
        bridgeClassName, reflectionBridgeExtensionName);

    var str = StringBuffer();

    str.write('extension $bridgeExtensionName on $bridgeClassName {\n');

    str.write(
        '  /// Returns a [ClassReflection] for type [T] or [obj]. (Generated by [ReflectionFactory])\n');
    str.write('  ClassReflection<T> reflection<T>([T? obj]) {\n');

    str.write('    switch (T) {\n');

    for (var classType in classesTypes) {
      var bridgeReflectionClassName = reflectionClassNames[classType] ?? '';
      var className = classType.element!.name!;

      var reflectionClassName =
          _buildReflectionClassName(className, bridgeReflectionClassName);
      str.write(
          '      case $className: return $reflectionClassName(obj as $className?) as ClassReflection<T>;\n');
    }

    str.write(
        "      default: throw UnsupportedError('<\$runtimeType> No reflection for Type: \$T');\n");
    str.write('    }\n');

    str.write('  }\n\n');

    str.write('}\n\n');

    var code = str.toString();

    return {bridgeExtensionName: code};
  }

  Future<Map<String, String>> _enableReflectionEnum(
      BuildStep buildStep,
      Element enumElement,
      String reflectionClassName,
      String reflectionExtensionName) async {
    var enumLibrary = await _getElementLibrary(buildStep, enumElement);

    var enumTree = _EnumTree(
      enumElement,
      reflectionClassName,
      reflectionExtensionName,
      enumLibrary.languageVersion.effective,
      verbose: verbose,
    );

    if (verbose) {
      print(enumTree);
    }

    var enumGlobalFunctions = enumTree.buildEnumGlobalFunctions();
    var reflectionClassCode = enumTree.buildReflectionEnum();
    var reflectionExtensionCode = enumTree.buildReflectionExtension();

    return {
      enumTree.classGlobalFunction('_'): enumGlobalFunctions,
      enumTree.reflectionClass: reflectionClassCode,
      enumTree.reflectionExtension: reflectionExtensionCode,
    };
  }

  Future<Map<String, String>> _enableReflectionClass(
      BuildStep buildStep,
      ClassElement classElement,
      String reflectionClassName,
      String reflectionExtensionName) async {
    var classLibrary = await _getElementLibrary(buildStep, classElement);

    var classTree = _ClassTree(
      classElement,
      reflectionClassName,
      reflectionExtensionName,
      classLibrary.languageVersion.effective,
      verbose: verbose,
    );

    if (verbose) {
      print(classTree);
    }

    var classGlobalFunctions = classTree.buildClassGlobalFunctions();
    var reflectionClassCode = classTree.buildReflectionClass();
    var reflectionExtensionCode = classTree.buildReflectionExtension();

    return {
      classTree.classGlobalFunction('_'): classGlobalFunctions,
      classTree.reflectionClass: reflectionClassCode,
      classTree.reflectionExtension: reflectionExtensionCode,
    };
  }

  Future<LibraryElement> _getElementLibrary(
      BuildStep buildStep, Element element) async {
    var resolver = buildStep.resolver;
    var classAssetId = await resolver.assetIdForElement(element);
    var library = await resolver.libraryFor(classAssetId);
    return library;
  }

  String _buildSiblingsClassReflection(Map<String, String> codeTable) {
    var str = StringBuffer();

    str.write('List<Reflection> _listSiblingsReflection() => ');
    str.write('<Reflection>[');

    for (var c in codeTable.keys.where((e) => e.endsWith(r'$reflection'))) {
      str.write(c);
      str.write('(), ');
    }

    str.write('];\n\n');

    str.write('List<Reflection>? _siblingsReflectionList;\n');
    str.write('List<Reflection> _siblingsReflection() => ');
    str.write(
        '_siblingsReflectionList ??= List<Reflection>.unmodifiable( _listSiblingsReflection() );\n\n');

    str.write('bool _registerSiblingsReflectionCalled = false;\n');
    str.write('void _registerSiblingsReflection() {\n');
    str.write('  if (_registerSiblingsReflectionCalled) return ;\n');
    str.write('  _registerSiblingsReflectionCalled = true ;\n');
    str.write('  var length = _listSiblingsReflection().length;\n');
    str.write('  assert(length > 0);\n');
    str.write('}\n\n');

    var code = str.toString();
    return code;
  }
}

String _buildClassGlobalFunction(
    String className, String reflectionClassName, String functionName,
    {String delimiter = '\$'}) {
  reflectionClassName = reflectionClassName.trim();
  if (reflectionClassName.isNotEmpty) {
    return '$reflectionClassName$delimiter$functionName';
  }

  return '$className$delimiter$functionName';
}

String _buildReflectionClassName(String className, String reflectionClassName) {
  reflectionClassName = reflectionClassName.trim();
  if (reflectionClassName.isNotEmpty) {
    return reflectionClassName;
  }

  return '$className\$reflection';
}

String _buildReflectionExtensionName(
    String className, String reflectionExtensionName) {
  reflectionExtensionName = reflectionExtensionName.trim();
  if (reflectionExtensionName.isNotEmpty) {
    return reflectionExtensionName;
  }

  return '$className\$reflectionExtension';
}

class _EnumTree<T> extends RecursiveElementVisitor<T> {
  final Element _enumElement;

  final String reflectionClassName;
  final String reflectionExtensionName;

  final Version languageVersion;

  final bool verbose;

  final String enumName;

  _EnumTree(this._enumElement, this.reflectionClassName,
      this.reflectionExtensionName, this.languageVersion,
      {this.verbose = false})
      : enumName = _enumElement.name! {
    _enumElement.visitChildren(this);
  }

  String classGlobalFunction(String functionName) =>
      _buildClassGlobalFunction(enumName, reflectionClassName, functionName);

  String get reflectionClass =>
      _buildReflectionClassName(enumName, reflectionClassName);

  String get reflectionExtension =>
      _buildReflectionExtensionName(enumName, reflectionExtensionName);

  final Set<FieldElement> fields = <FieldElement>{};

  @override
  T? visitFieldElement(FieldElement element) {
    var name = element.name;

    if (name == 'index' || name == 'values') {
      return null;
    }

    fields.add(element);
  }

  List<String> get fieldsNames => fields.map((e) => e.name).toList();

  bool hasField(String filedName) =>
      fields.where((m) => m.name == filedName).isNotEmpty;

  @override
  String toString() {
    return '_EnumTree{ '
        'enumName: $enumName, '
        'languageVersion: $languageVersion, '
        'fields: $fieldsNames '
        '}';
  }

  String buildEnumGlobalFunctions() {
    var str = StringBuffer();

    var reflectionClass = this.reflectionClass;

    var from = classGlobalFunction('from');

    str.write('// ignore: non_constant_identifier_names\n');
    str.write(
        '$enumName? $from(Object? o) => $reflectionClass.staticInstance.from(o);\n');

    return str.toString();
  }

  String buildReflectionEnum() {
    var str = StringBuffer();

    var reflectionClass = this.reflectionClass;

    str.write('class $reflectionClass extends EnumReflection<$enumName> {\n\n');

    str.write(
        '  $reflectionClass([$enumName? object]) : super($enumName, object);\n\n');

    str.write('  static bool _registered = false;\n');
    str.write('  @override\n');
    str.write('  void register() {\n');
    str.write('    if (!_registered) {\n');
    str.write('      _registered = true;\n');
    str.write('      super.register();\n');
    str.write('      _registerSiblingsReflection();\n');
    str.write('    }\n');
    str.write('  }\n\n');

    str.write('  @override\n');
    str.write(
        "  Version get languageVersion => Version.parse('$languageVersion');\n\n");

    str.write('  @override\n');
    str.write(
        "  Version get reflectionFactoryVersion => Version.parse('${ReflectionFactory.VERSION}');\n\n");

    str.write('  @override\n');
    str.write(
        '  $reflectionClass withObject([$enumName? obj]) => $reflectionClass(obj);\n\n');

    str.write('  static $reflectionClass? _withoutObjectInstance;\n');
    str.write('  @override\n');
    str.write(
        '  $reflectionClass withoutObjectInstance() => _withoutObjectInstance ??= super.withoutObjectInstance() as $reflectionClass;\n\n');

    str.write(
        '  static $reflectionClass get staticInstance => _withoutObjectInstance ??= $reflectionClass();\n\n');

    var classElement = _Element(_enumElement);

    var classAnnotationListCode = classElement.annotationsAsListCode;
    if (classAnnotationListCode != 'null') {
      str.write(
          '  static const List<Object> _classAnnotations = $classAnnotationListCode; \n\n');
      str.write('  @override\n');
      str.write(
          '  List<Object> get classAnnotations => List<Object>.unmodifiable(_classAnnotations);\n\n');
    } else {
      str.write('  @override\n');
      str.write(
          '  List<Object> get classAnnotations => List<Object>.unmodifiable(<Object>[]);\n\n');
    }

    str.write('\n  @override\n');
    str.write(
        '  List<EnumReflection> siblingsEnumReflection() => _siblingsReflection().whereType<EnumReflection>().toList();\n\n');

    str.write('\n  @override\n');
    str.write(
        '  List<Reflection> siblingsReflection() => _siblingsReflection();\n\n');

    _buildField(str);

    str.write('}\n\n');

    return str.toString();
  }

  void _buildField(StringBuffer str) {
    var entries = _toFieldEntries(fields);
    var names = _buildStringListCode(entries.keys, sorted: true);

    str.write('  @override\n');
    str.write('  List<String> get fieldsNames => $names;\n\n');

    str.write('  @override\n');
    str.write(
        '  Map<String,$enumName> get valuesByName => const <String,$enumName>{\n');
    for (var name in entries.keys) {
      str.write("  '$name': $enumName.$name,\n");
    }
    str.write('  };\n\n');

    str.write('  @override\n');
    str.write('  List<$enumName> get values => $enumName.values;\n\n');
  }

  Map<String, _Field> _toFieldEntries(Set<FieldElement> fields) {
    return Map.fromEntries(fields.map((e) => MapEntry(e.name, _Field(e))));
  }

  String buildReflectionExtension() {
    var str = StringBuffer();

    _buildExtension(str);

    return str.toString();
  }

  void _buildExtension(StringBuffer codeBuffer) {
    var str = StringBuffer();

    str.write('extension $reflectionExtension on $enumName {\n');

    var entriesCount = 0;

    if (!hasField('reflection')) {
      str.write(
          '  /// Returns a [EnumReflection] for type [$enumName]. (Generated by [ReflectionFactory])\n');
      str.write(
          '  EnumReflection<$enumName> get reflection => $reflectionClass(this);\n');
      entriesCount++;
    }

    if (!hasField('enumName')) {
      str.write(
          '  /// Returns the name of the [$enumName] instance. (Generated by [ReflectionFactory])\n');
      str.write('  String get enumName => $reflectionClass(this).name()!;\n');
      entriesCount++;
    }

    if (!hasField('toJson')) {
      str.write(
          '\n  /// Returns a JSON for type [$enumName]. (Generated by [ReflectionFactory])\n');
      str.write('  String? toJson() => reflection.toJson();\n');
      entriesCount++;
    }

    if (!hasField('toJsonMap')) {
      str.write(
          '\n  /// Returns a JSON [Map] for type [$enumName]. (Generated by [ReflectionFactory])\n');
      str.write(
          '  Map<String,Object>? toJsonMap() => reflection.toJsonMap();\n');
      entriesCount++;
    }

    if (!hasField('toJsonEncoded')) {
      str.write(
          '\n  /// Returns an encoded JSON [String] for type [$enumName]. (Generated by [ReflectionFactory])\n');
      str.write(
          '  String toJsonEncoded({bool pretty = false}) => reflection.toJsonEncoded(pretty: pretty);\n');
      entriesCount++;
    }

    str.write('}\n\n');

    if (entriesCount > 0) {
      codeBuffer.write(str);
    }
  }
}

class _ClassTree<T> extends RecursiveElementVisitor<T> {
  final ClassElement _classElement;

  final String reflectionClassName;
  final String reflectionExtensionName;

  final Version languageVersion;

  final bool verbose;

  final String className;

  _ClassTree(this._classElement, this.reflectionClassName,
      this.reflectionExtensionName, this.languageVersion,
      {this.verbose = false})
      : className = _classElement.name {
    scan(_classElement);
  }

  final Set<ClassElement> supperTypes = <ClassElement>{};

  final Queue<ClassElement> _visitingClassStack = Queue<ClassElement>();

  ClassElement? get _visitingClass => _visitingClassStack.last;

  bool get _isVisitingSupperClass => _visitingClass != _classElement;

  void scan(ClassElement classElement) {
    try {
      _visitingClassStack.addLast(classElement);

      if (classElement != _classElement) {
        supperTypes.add(classElement);
      }

      classElement.visitChildren(this);

      for (var t in classElement.allSupertypes) {
        var superClass = t.element;
        if (superClass.isDartCoreObject) {
          continue;
        }

        scan(superClass);
      }
    } finally {
      var c = _visitingClassStack.removeLast();
      if (c != classElement) {
        throw StateError('_visitingClassStack error!');
      }
    }
  }

  @override
  String toString() {
    return '_ClassTree{ '
        'className: $className, '
        'languageVersion: $languageVersion, '
        'staticMethods: $staticMethodsNames, '
        'methods: $methodsNames, '
        'staticFields: $staticFieldsNames, '
        'fields: $fieldsNames '
        '}';
  }

  String classGlobalFunction(String functionName) =>
      _buildClassGlobalFunction(className, reflectionClassName, functionName);

  String get reflectionClass =>
      _buildReflectionClassName(className, reflectionClassName);

  String get reflectionExtension =>
      _buildReflectionExtensionName(className, reflectionExtensionName);

  final Set<ConstructorElement> constructors = <ConstructorElement>{};

  ConstructorElement? get defaultConstructor =>
      constructors.firstWhereOrNull((e) => e.isDefaultConstructor);

  ConstructorElement? get emptyConstructor {
    var noArgsConstructors = constructors
        .where((e) => e.name.isNotEmpty && e.parameters.isEmpty)
        .toList();

    if (noArgsConstructors.isEmpty) {
      return null;
    } else if (noArgsConstructors.length == 1) {
      return noArgsConstructors[0];
    } else {
      var found = noArgsConstructors.firstWhereOrNull((e) {
        var name = e.name.toLowerCase();
        return name == 'empty' || name == 'create' || name == 'def';
      });

      if (found != null) {
        return found;
      } else {
        return noArgsConstructors.first;
      }
    }
  }

  ConstructorElement? get noRequiredArgsConstructor {
    var noArgsConstructors = constructors
        .where((e) =>
            e.name.isNotEmpty &&
            e.normalParameters.isEmpty &&
            e.optionalParameters.where((p) => p.required).isEmpty &&
            e.namedParameters.values.where((p) => p.required).isEmpty)
        .toList();

    if (noArgsConstructors.isEmpty) {
      return null;
    } else if (noArgsConstructors.length == 1) {
      return noArgsConstructors[0];
    } else {
      var found = noArgsConstructors.firstWhereOrNull((e) {
        var name = e.name.toLowerCase();
        return name == 'empty' || name == 'create' || name == 'def';
      });

      if (found != null) {
        return found;
      } else {
        return noArgsConstructors.first;
      }
    }
  }

  @override
  T? visitConstructorElement(ConstructorElement element) {
    if (element.isPrivate || !isValidMethodName(element.name)) {
      return super.visitConstructorElement(element);
    }

    if (!_isVisitingSupperClass) {
      _addWithUniqueName(constructors, element);
    }
  }

  static bool _addWithUniqueName(Set<Element> set, Element element) {
    if (set.where((e) => e.name == element.name).isEmpty) {
      set.add(element);
      return true;
    }

    return false;
  }

  final Set<MethodElement> staticMethods = <MethodElement>{};

  List<String> get staticMethodsNames =>
      staticMethods.map((e) => e.name).toList();

  final Set<MethodElement> methods = <MethodElement>{};

  List<String> get methodsNames => methods.map((e) => e.name).toList();

  bool hasMethod(String methodName) =>
      methods.where((m) => m.name == methodName).isNotEmpty;

  bool hasStaticMethod(String methodName) =>
      staticMethods.where((m) => m.name == methodName).isNotEmpty;

  bool isValidMethodName(String name) =>
      name != '==' &&
      name != '+' &&
      name != '-' &&
      name != '*' &&
      name != '/' &&
      name != '~/' &&
      name != '[]' &&
      name != '[]=' &&
      name != '<' &&
      name != '>' &&
      name != '<=' &&
      name != '>=' &&
      name != '&' &&
      name != '|' &&
      name != '^' &&
      name != '<<' &&
      name != '>>' &&
      name != '~' &&
      name != '%';

  @override
  T? visitMethodElement(MethodElement element) {
    if (element.isPrivate || !isValidMethodName(element.name)) {
      return super.visitMethodElement(element);
    }

    if (element.isStatic) {
      if (!_isVisitingSupperClass) {
        _addWithUniqueName(staticMethods, element);
      }
    } else {
      _addWithUniqueName(methods, element);
    }

    return super.visitMethodElement(element);
  }

  final Set<FieldElement> staticFields = <FieldElement>{};

  List<String> get staticFieldsNames =>
      staticFields.map((e) => e.name).toList();

  final Set<FieldElement> fields = <FieldElement>{};

  List<String> get fieldsNames => fields.map((e) => e.name).toList();

  bool hasField(String filedName) =>
      fields.where((m) => m.name == filedName).isNotEmpty;

  bool hasStaticField(String filedName) =>
      staticFields.where((m) => m.name == filedName).isNotEmpty;

  bool hasEntry(String name) =>
      hasMethod(name) ||
      hasStaticMethod(name) ||
      hasField(name) ||
      hasStaticField(name);

  @override
  T? visitFieldElement(FieldElement element) {
    if (element.isPrivate) {
      return super.visitFieldElement(element);
    }

    if (element.isStatic) {
      if (!_isVisitingSupperClass) {
        _addWithUniqueName(staticFields, element);
      }
    } else {
      _addWithUniqueName(fields, element);
    }

    return super.visitFieldElement(element);
  }

  String buildClassGlobalFunctions() {
    var str = StringBuffer();

    var reflectionClass = this.reflectionClass;

    var fromJsonName = classGlobalFunction('fromJson');

    str.write('// ignore: non_constant_identifier_names\n');
    str.write(
        '$className $fromJsonName(Map<String,Object?> map) => $reflectionClass.staticInstance.fromJson(map);\n');

    var fromJsonEncodedName = classGlobalFunction('fromJsonEncoded');

    str.write('// ignore: non_constant_identifier_names\n');
    str.write(
        '$className $fromJsonEncodedName(String jsonEncoded) => $reflectionClass.staticInstance.fromJsonEncoded(jsonEncoded);\n');

    return str.toString();
  }

  String buildReflectionClass() {
    var str = StringBuffer();

    var reflectionClass = this.reflectionClass;

    str.write(
        'class $reflectionClass extends ClassReflection<$className> {\n\n');

    str.write(
        '  $reflectionClass([$className? object]) : super($className, object);\n\n');

    str.write('  static bool _registered = false;\n');
    str.write('  @override\n');
    str.write('  void register() {\n');
    str.write('    if (!_registered) {\n');
    str.write('      _registered = true;\n');
    str.write('      super.register();\n');
    str.write('      _registerSiblingsReflection();\n');
    str.write('    }\n');
    str.write('  }\n\n');

    str.write('  @override\n');
    str.write(
        "  Version get languageVersion => Version.parse('$languageVersion');\n\n");

    str.write('  @override\n');
    str.write(
        "  Version get reflectionFactoryVersion => Version.parse('${ReflectionFactory.VERSION}');\n\n");

    str.write('  @override\n');
    str.write(
        '  $reflectionClass withObject([$className? obj]) => $reflectionClass(obj);\n\n');

    str.write('  static $reflectionClass? _withoutObjectInstance;\n');
    str.write('  @override\n');
    str.write(
        '  $reflectionClass withoutObjectInstance() => _withoutObjectInstance ??= super.withoutObjectInstance() as $reflectionClass;\n\n');

    str.write(
        '  static $reflectionClass get staticInstance => _withoutObjectInstance ??= $reflectionClass();\n\n');

    _buildConstructors(str);

    var classElement = _Element(_classElement);

    var classAnnotationListCode = classElement.annotationsAsListCode;
    if (classAnnotationListCode != 'null') {
      str.write(
          '  static const List<Object> _classAnnotations = $classAnnotationListCode; \n\n');
      str.write('  @override\n');
      str.write(
          '  List<Object> get classAnnotations => List<Object>.unmodifiable(_classAnnotations);\n\n');
    } else {
      str.write('  @override\n');
      str.write(
          '  List<Object> get classAnnotations => List<Object>.unmodifiable(<Object>[]);\n\n');
    }

    str.write('\n  @override\n');
    str.write(
        '  List<ClassReflection> siblingsClassReflection() => _siblingsReflection().whereType<ClassReflection>().toList();\n\n');

    str.write('\n  @override\n');
    str.write(
        '  List<Reflection> siblingsReflection() => _siblingsReflection();\n\n');

    str.write('\n  @override\n');
    str.write(
        '  List<Type> get supperTypes => const <Type>[${supperTypes.map((e) => e.name).join(', ')}];\n\n');

    _buildCallMethodToJson(str);

    _buildField(str);
    _buildStaticField(str);

    _buildMethod(str);
    _buildStaticMethod(str);

    str.write('}\n\n');

    return str.toString();
  }

  void _buildConstructors(StringBuffer str) {
    _buildDefaultConstructor(str);

    var entries =
        _toConstructorEntries(this, constructors.where(_canConstruct).toSet());
    var names = _buildStringListCode(entries.keys, sorted: true);

    str.write('  @override\n');
    str.write('  List<String> get constructorsNames => $names;\n\n');

    str.write('  @override\n');
    str.write(
        '  ConstructorReflection<$className>? constructor<R>(String constructorName) {\n');

    _buildSwitches(str, 'constructorName', entries.keys, (name) {
      var constructor = entries[name]!;
      if (verbose) {
        print(constructor);
      }

      var declaringType = constructor.declaringType!.typeNameResolvable;
      var callerCode = constructor.asCallerCode;

      return "ConstructorReflection<$className>("
          "this, $declaringType, '$name', () => $callerCode , "
          "${constructor.normalParametersAsCode} , "
          "${constructor.optionalParametersAsCode}, "
          "${constructor.namedParametersAsCode}, "
          "${constructor.annotationsAsListCode}"
          ")";
    });

    str.write('  }\n\n');
  }

  bool _canConstruct(ConstructorElement? c) {
    if (c == null) return false;
    if (c.isFactory) return true;
    return !_classElement.isAbstract;
  }

  void _buildDefaultConstructor(StringBuffer str) {
    var defaultConstructor = this.defaultConstructor;

    if (_canConstruct(defaultConstructor)) {
      str.write('  @override\n');
      str.write('  bool get hasDefaultConstructor => true;\n');

      str.write('  @override\n');
      str.write(
          '  $className? createInstanceWithDefaultConstructor() => $className();\n');
    } else {
      str.write('  @override\n');
      str.write('  bool get hasDefaultConstructor => false;\n');

      str.write('  @override\n');
      str.write(
          '  $className? createInstanceWithDefaultConstructor() => null;\n');
    }
    str.write('\n');

    var emptyConstructor = this.emptyConstructor;

    if (_canConstruct(emptyConstructor)) {
      str.write('  @override\n');
      str.write('  bool get hasEmptyConstructor => true;\n');

      str.write('  @override\n');
      var name = emptyConstructor!.name;
      str.write(
          '  $className? createInstanceWithEmptyConstructor() => $className.$name();\n');
    } else {
      str.write('  @override\n');
      str.write('  bool get hasEmptyConstructor => false;\n');

      str.write('  @override\n');
      str.write(
          '  $className? createInstanceWithEmptyConstructor() => null;\n');
    }

    var noRequiredArgsConstructor = this.noRequiredArgsConstructor;

    if (_canConstruct(noRequiredArgsConstructor)) {
      str.write('  @override\n');
      str.write('  bool get hasNoRequiredArgsConstructor => true;\n');

      str.write('  @override\n');
      var name = noRequiredArgsConstructor!.name;
      str.write(
          '  $className? createInstanceWithNoRequiredArgsConstructor() => $className.$name();\n');
    } else {
      str.write('  @override\n');
      str.write('  bool get hasNoRequiredArgsConstructor => false;\n');

      str.write('  @override\n');
      str.write(
          '  $className? createInstanceWithNoRequiredArgsConstructor() => null;\n');
    }

    str.write('\n');
  }

  void _buildField(StringBuffer str) {
    var entries = _toFieldEntries(fields);
    var names = _buildStringListCode(entries.keys, sorted: true);

    str.write('  @override\n');
    str.write('  List<String> get fieldsNames => $names;\n\n');

    str.write('  @override\n');
    str.write(
        '  FieldReflection<$className,T>? field<T>(String fieldName, [$className? obj]) {\n');
    str.write('    obj ??= object;\n\n');

    _buildSwitches(str, 'fieldName', entries.keys, (name) {
      var field = entries[name]!;

      if (verbose) {
        print(field);
      }

      var declaringType = field.declaringType!.typeNameResolvable;
      var typeCode = field.typeAsCode;
      var fullType = field.typeNameAsNullableCode;
      var nullable = field.nullable ? 'true' : 'false';
      var isFinal = field.isFinal ? 'true' : 'false';
      var getter = '(o) => () => o!.$name as T';
      var setter = !field.allowSetter
          ? 'null'
          : '(o) => (T? v) => o!.$name = v as $fullType';

      var annotations = field.annotationsAsListCode;

      return "FieldReflection<$className,T>(this, $declaringType, "
          "$typeCode, '$name', $nullable, "
          "$getter , $setter , "
          "obj, false, $isFinal, "
          "$annotations, "
          ")";
    });

    str.write('  }\n\n');
  }

  void _buildStaticField(StringBuffer str) {
    var entries = _toFieldEntries(staticFields);
    var names = _buildStringListCode(entries.keys, sorted: true);

    str.write('  @override\n');
    str.write('  List<String> get staticFieldsNames => $names;\n\n');

    str.write('  @override\n');
    str.write(
        '  FieldReflection<$className,T>? staticField<T>(String fieldName) {\n');

    _buildSwitches(str, 'fieldName', entries.keys, (name) {
      var field = entries[name]!;
      if (verbose) {
        print(field);
      }

      var declaringType = field.declaringType!.typeNameResolvable;
      var typeCode = field.typeAsCode;
      var fullType = field.typeNameAsNullableCode;
      var nullable = field.nullable ? 'true' : 'false';
      var isFinal = field.isFinal ? 'true' : 'false';
      var getter = '(o) => () => $className.$name as T';
      var setter = !field.allowSetter
          ? 'null'
          : '(o) => (T? v) => $className.$name = v as $fullType';

      return "FieldReflection<$className,T>(this, $declaringType, "
          "$typeCode, '$name', $nullable, "
          "$getter , $setter , "
          "null, true, $isFinal, "
          "${field.annotationsAsListCode}, "
          ")";
    });

    str.write('  }\n\n');
  }

  Map<String, _Field> _toFieldEntries(Set<FieldElement> fields) {
    return Map.fromEntries(fields.map((e) => MapEntry(e.name, _Field(e))));
  }

  void _buildCallMethodToJson(StringBuffer str) {
    var entries = _toMethodsEntries(methods);

    var toJsonMethod = entries.values
        .where((m) => m.name.toLowerCase() == 'tojson')
        .firstOrNull;

    if (toJsonMethod != null &&
        toJsonMethod.normalParameters.isEmpty &&
        !toJsonMethod.hasRequiredNamedParameter) {
      str.write('  @override\n');
      str.write('  bool get hasMethodToJson => true;\n\n');
      str.write('  @override\n');
      str.write(
          '  Object? callMethodToJson([$className? obj]) { obj ??= object ; return obj?.${toJsonMethod.name}();}\n\n');
    } else {
      str.write('  @override\n');
      str.write('  bool get hasMethodToJson => false;\n\n');
      str.write('  @override\n');
      str.write('  Object? callMethodToJson([$className? obj]) => null;\n\n');
    }
  }

  void _buildMethod(StringBuffer str) {
    var entries = _toMethodsEntries(methods);
    var names = _buildStringListCode(entries.keys, sorted: true);

    str.write('  @override\n');
    str.write('  List<String> get methodsNames => $names;\n\n');

    str.write('  @override\n');
    str.write(
        '  MethodReflection<$className,R>? method<R>(String methodName, [$className? obj]) {\n');
    str.write('    obj ??= object;\n\n');

    _buildSwitches(str, 'methodName', entries.keys, (name) {
      var method = entries[name]!;
      if (verbose) {
        print(method);
      }

      var declaringType = method.declaringType!.typeNameResolvable;
      var returnTypeAsCode = method.returnTypeAsCode;
      var nullable = method.returnNullable ? 'true' : 'false';

      return "MethodReflection<$className,R>("
          "this, $declaringType, '$name', $returnTypeAsCode, $nullable, (o) => o!.$name , obj , false, "
          "${method.normalParametersAsCode} , "
          "${method.optionalParametersAsCode}, "
          "${method.namedParametersAsCode}, "
          "${method.annotationsAsListCode}"
          ")";
    });

    str.write('  }\n\n');
  }

  void _buildStaticMethod(StringBuffer str) {
    var entries = _toMethodsEntries(staticMethods);
    var names = _buildStringListCode(entries.keys, sorted: true);

    str.write('  @override\n');
    str.write('  List<String> get staticMethodsNames => $names;\n\n');

    str.write('  @override\n');
    str.write(
        '  MethodReflection<$className,R>? staticMethod<R>(String methodName) {\n');

    _buildSwitches(str, 'methodName', entries.keys, (name) {
      var method = entries[name]!;
      if (verbose) {
        print(method);
      }

      var declaringType = method.declaringType!.typeNameResolvable;
      var returnTypeAsCode = method.returnTypeAsCode;
      var nullable = method.returnNullable ? 'true' : 'false';

      return "MethodReflection<$className,R>("
          "this, $declaringType, '$name', $returnTypeAsCode, $nullable, (o) => $className.$name , null , true, "
          "${method.normalParametersAsCode} , "
          "${method.optionalParametersAsCode}, "
          "${method.namedParametersAsCode}, "
          "${method.annotationsAsListCode}"
          ")";
    });

    str.write('  }\n\n');
  }

  Map<String, _Constructor> _toConstructorEntries(
      _ClassTree<T> classTree, Set<ConstructorElement> elements) {
    return Map.fromEntries(elements.map((c) {
      return MapEntry(c.name, _Constructor(classTree, c));
    }));
  }

  Map<String, _Method> _toMethodsEntries(Set<MethodElement> elements) {
    return Map.fromEntries(elements.map((m) {
      return MapEntry(m.name, _Method(m));
    }));
  }

  void _buildSwitches(StringBuffer str, String argName,
      Iterable<String> entriesNames, String Function(String name) caseReturn) {
    var namesLcConflicts = <String>{};

    var namesLC = <String, String>{};
    for (var m in entriesNames) {
      var mLC = m.toLowerCase();
      var prevM = namesLC[mLC];

      if (prevM != null) {
        namesLcConflicts.add(prevM);
        namesLcConflicts.add(m);
      } else {
        namesLC[mLC] = m;
      }
    }

    if (namesLcConflicts.isNotEmpty) {
      str.write('    switch($argName) {\n');

      for (var m in namesLcConflicts) {
        var ret = caseReturn(m);
        str.write("      case '$m': return $ret;\n");
        namesLC.remove(m);
      }

      str.write('      default: break;\n');

      str.write('    }\n\n');
    }

    if (namesLC.isNotEmpty) {
      str.write('    var lc = $argName.trim().toLowerCase();\n\n');

      str.write('    switch(lc) {\n');

      for (var m in namesLC.entries) {
        var ret = caseReturn(m.value);
        str.write("      case '${m.key}': return $ret;\n");
      }

      str.write('      default: return null;\n');
      str.write('    }\n');
    } else {
      str.write('    return null;\n');
    }
  }

  String buildReflectionExtension() {
    var str = StringBuffer();

    _buildExtension(str);

    return str.toString();
  }

  void _buildExtension(StringBuffer codeBuffer) {
    var str = StringBuffer();

    str.write('extension $reflectionExtension on $className {\n');

    var entriesCount = 0;

    if (!hasEntry('reflection')) {
      str.write(
          '  /// Returns a [ClassReflection] for type [$className]. (Generated by [ReflectionFactory])\n');
      str.write(
          '  ClassReflection<$className> get reflection => $reflectionClass(this);\n');
      entriesCount++;
    }

    if (!hasEntry('toJson')) {
      str.write(
          '\n  /// Returns a JSON for type [$className]. (Generated by [ReflectionFactory])\n');
      str.write('  Object? toJson() => reflection.toJson();\n');
      entriesCount++;
    }

    if (!hasEntry('toJsonMap')) {
      str.write(
          '\n  /// Returns a JSON [Map] for type [$className]. (Generated by [ReflectionFactory])\n');
      str.write(
          '  Map<String,dynamic>? toJsonMap() => reflection.toJsonMap();\n');
      entriesCount++;
    }

    if (!hasEntry('toJsonEncoded')) {
      str.write(
          '\n  /// Returns an encoded JSON [String] for type [$className]. (Generated by [ReflectionFactory])\n');
      str.write(
          '  String toJsonEncoded({bool pretty = false}) => reflection.toJsonEncoded(pretty: pretty);\n');
      entriesCount++;
    }

    if (!hasEntry('toJsonFromFields')) {
      str.write(
          '\n  /// Returns a JSON for type [$className] using the class fields. (Generated by [ReflectionFactory])\n');
      str.write(
          '  Object? toJsonFromFields() => reflection.toJsonFromFields();\n');
      entriesCount++;
    }

    str.write('}\n\n');

    if (entriesCount > 0) {
      codeBuffer.write(str);
    }
  }
}

class _Element {
  final Element _element;

  _Element(this._element);

  DartType? get declaringType {
    var element = _element;
    if (element is ClassElement) {
      return null;
    }

    var enclosingElement = element.enclosingElement;

    if (enclosingElement is ClassElement) {
      return enclosingElement.thisType;
    }

    return null;
  }

  List<ElementAnnotation> get annotations => _element.metadata;

  List<String> get annotationsAsCode {
    var element = _element;
    var metadata = List<ElementAnnotation>.from(element.metadata);

    if (element is FieldElement) {
      var getter = element.getter;
      if (getter != null) {
        metadata.addAll(getter.metadata);
      }

      var setter = element.setter;
      if (setter != null) {
        metadata.addAll(setter.metadata);
      }
    }

    return metadata
        .map((e) => e.toSource())
        .where((src) =>
            !src.startsWith('@EnableReflection(') &&
            !src.startsWith('@ReflectionBridge('))
        .map((src) {
      if (src.startsWith('@')) {
        src = src.substring(1);
      }
      return src;
    }).toList();
  }

  String get annotationsAsListCode {
    var codes = annotationsAsCode;
    return codes.isEmpty ? 'null' : '[${codes.join(',')}]';
  }
}

class _Parameter extends _Element {
  final ParameterElement parameterElement;
  final int parameterIndex;

  final DartType type;
  final String name;

  final bool nullable;

  final bool required;

  _Parameter(this.parameterElement, this.parameterIndex, this.type, this.name,
      this.nullable, this.required)
      : super(parameterElement);

  bool get isNullable => nullable || type.isDynamic;

  String? get defaultValue => parameterElement.defaultValueCode;

  bool get hasDefaultValue {
    var valCode = defaultValue;
    return valCode != null && valCode.isNotEmpty;
  }

  @override
  String toString() {
    return '_Parameter{type: $type, name: $name, nullable: $nullable, required: $required, parameterElement: $parameterElement, parameterIndex: $parameterIndex}';
  }
}

class _Constructor<T> extends _Element {
  final _ClassTree<T> classTree;

  final ConstructorElement constructorElement;

  _Constructor(this.classTree, this.constructorElement)
      : super(constructorElement);

  String get name => constructorElement.name;

  bool get returnNullable => constructorElement.returnType.isNullable;

  bool get isStatic => constructorElement.isStatic;

  String get returnTypeNameAsCode =>
      constructorElement.returnType.typeNameAsCode;

  String get returnTypeAsCode => constructorElement.returnType.typeAsCode;

  List<_Parameter> get normalParameters =>
      constructorElement.type.normalParameters;

  List<_Parameter> get optionalParameters =>
      constructorElement.type.optionalParameters;

  Map<String, _Parameter> get namedParameters =>
      constructorElement.type.namedParameters;

  String get normalParametersAsCode =>
      _buildParameterReflectionList(normalParameters,
          nullOnEmpty: true, required: true);

  String get optionalParametersAsCode =>
      _buildParameterReflectionList(optionalParameters,
          nullOnEmpty: true, required: false);

  String get namedParametersAsCode =>
      _buildNamedParameterReflectionMap(namedParameters, nullOnEmpty: true);

  String get asCallerCode {
    var s = StringBuffer();

    var normalParameters = constructorElement.normalParameters;
    var optionalParameters = constructorElement.optionalParameters;
    var namedParameters = constructorElement.namedParameters;

    s.write('(');

    for (var i = 0; i < normalParameters.length; ++i) {
      var p = normalParameters[i];
      if (i > 0) s.write(', ');

      s.write(p.type.typeNameAsNullableCode);
      s.write(' ');
      s.write(p.name);
    }

    if (optionalParameters.isNotEmpty) {
      if (normalParameters.isNotEmpty) s.write(', ');

      s.write('[');

      for (var i = 0; i < optionalParameters.length; ++i) {
        var p = optionalParameters[i];
        if (i > 0) s.write(',');
        s.write(p.type.typeNameAsNullableCode);
        s.write(' ');
        s.write(p.name);
        var defVal = p.defaultValue;
        if (defVal != null) {
          s.write(' = ');
          s.write(defVal);
        }
      }
      s.write(']');
    } else if (namedParameters.isNotEmpty) {
      if (normalParameters.isNotEmpty) s.write(', ');

      s.write('{');
      var i = 0;
      for (var e in namedParameters.entries) {
        var p = e.value;
        if (i > 0) s.write(', ');

        if (p.required) {
          s.write('required ');
        }

        s.write(p.type.typeNameAsNullableCode);
        s.write(' ');
        s.write(p.name);
        var defVal = p.defaultValue;
        if (defVal != null) {
          s.write(' = ');
          s.write(defVal);
        }
        i++;
      }
      s.write('}');
    }

    s.write(') => ');

    s.write(classTree.className);
    if (name.isNotEmpty) {
      s.write('.');
      s.write(name);
    }

    s.write('(');

    for (var i = 0; i < normalParameters.length; ++i) {
      var p = normalParameters[i];
      if (i > 0) s.write(',');
      s.write(p.name);
    }

    if (optionalParameters.isNotEmpty) {
      if (normalParameters.isNotEmpty) s.write(', ');

      for (var i = 0; i < optionalParameters.length; ++i) {
        var p = optionalParameters[i];
        if (i > 0) s.write(',');
        s.write(p.name);
      }
    } else if (namedParameters.isNotEmpty) {
      if (normalParameters.isNotEmpty) s.write(', ');

      var i = 0;
      for (var e in namedParameters.entries) {
        var k = e.key;
        var p = e.value;
        if (i > 0) s.write(',');
        s.write(k);
        s.write(': ');
        s.write(p.name);
        i++;
      }
    }

    s.write(') ');

    return s.toString();
  }

  @override
  String toString() {
    return '_Constructor{ '
        'name: $name, '
        'static: $isStatic, '
        'return: $returnTypeNameAsCode '
        '}( '
        'normal: $normalParameters, '
        'optional: $optionalParameters, '
        'named: $namedParameters '
        ')<$constructorElement>';
  }
}

class _Method extends _Element {
  final MethodElement methodElement;

  _Method(this.methodElement) : super(methodElement);

  String get name => methodElement.name;

  bool get returnNullable => methodElement.returnType.isNullable;

  bool get isStatic => methodElement.isStatic;

  String get returnTypeNameAsCode => methodElement.returnType.typeNameAsCode;

  String get returnTypeAsCode => methodElement.returnType.typeAsCode;

  List<_Parameter> get normalParameters => methodElement.type.normalParameters;

  List<_Parameter> get optionalParameters =>
      methodElement.type.optionalParameters;

  Map<String, _Parameter> get namedParameters =>
      methodElement.type.namedParameters;

  bool get hasRequiredNamedParameter => namedParameters.values
      .where((m) => m.required || (!m.isNullable && !m.hasDefaultValue))
      .isNotEmpty;

  String get normalParametersAsCode =>
      _buildParameterReflectionList(normalParameters,
          nullOnEmpty: true, required: true);

  String get optionalParametersAsCode =>
      _buildParameterReflectionList(optionalParameters,
          nullOnEmpty: true, required: false);

  String get namedParametersAsCode =>
      _buildNamedParameterReflectionMap(namedParameters, nullOnEmpty: true);

  @override
  String toString() {
    return '_Method{ '
        'name: $name, '
        'static: $isStatic, '
        'return: $returnTypeNameAsCode '
        '}( '
        'normal: $normalParameters, '
        'optional: $optionalParameters, '
        'named: $namedParameters '
        ')<$methodElement>';
  }
}

class _Field extends _Element {
  final FieldElement fieldElement;

  _Field(this.fieldElement) : super(fieldElement);

  String get name => fieldElement.name;

  bool get nullable => fieldElement.type.isNullable;

  bool get isStatic => fieldElement.isStatic;

  bool get isFinal => fieldElement.isFinal;

  bool get isConst => fieldElement.isConst;

  bool get allowSetter => !isFinal && !isConst && fieldElement.setter != null;

  String get typeNameAsCode => fieldElement.type.typeNameAsCode;

  String get typeNameAsNullableCode => fieldElement.type.typeNameAsNullableCode;

  String get typeAsCode => fieldElement.type.typeAsCode;

  @override
  String toString() {
    return '_Field{ '
        'name: $name, '
        'static: $isStatic, '
        'final: $isFinal, '
        'const: $isConst, '
        'allowSetter: $allowSetter '
        '}<$fieldElement>';
  }
}

extension _DartTypeExtension on DartType {
  bool get isNullable => nullabilitySuffix == NullabilitySuffix.question;

  bool get isParameterType => this is TypeParameterType;

  bool get isResolvableType => !isParameterType;

  String get typeNameResolvable {
    var name = !isResolvableType ? 'dynamic' : typeName;
    return name;
  }

  String get typeName {
    var name = element?.name;

    if (name == null) {
      name = getDisplayString(withNullability: false);

      var idx = name.indexOf('Function(');

      if (idx == 0 ||
          (idx > 0 && name.substring(idx - 1, idx).trim().isEmpty)) {
        name = 'Function';
      } else {
        idx = name.indexOf('<');
        if (idx > 0) {
          name = name.substring(0, idx);
        }
      }
    }

    return name;
  }

  bool get hasTypeArguments {
    var self = this;
    if (self is ParameterizedType) {
      return self.typeArguments.isNotEmpty;
    } else {
      return false;
    }
  }

  bool get hasSimpleTypeArguments {
    var self = this;

    if (self is ParameterizedType && self.typeArguments.isNotEmpty) {
      return self.typeArguments.where((e) => !e.hasTypeArguments).length ==
          self.typeArguments.length;
    }

    return false;
  }

  List<DartType> get resolvedTypeArguments {
    var self = this;
    if (self is ParameterizedType) {
      return self.typeArguments;
    } else {
      return <DartType>[];
    }
  }

  String get typeNameAsCode {
    var self = this;
    if (self is VoidType) {
      return 'null';
    }

    if (self is FunctionType) {
      var alias = self.alias;
      if (alias != null && alias.typeArguments.isEmpty) {
        var name = alias.element.name;
        return name;
      } else {
        var functionType = self.getDisplayString(withNullability: false);
        return functionType;
      }
    }

    var name = typeNameResolvable;
    var arguments = resolvedTypeArguments;

    if (arguments.isNotEmpty) {
      return '$name<${arguments.map((e) => e.typeNameAsCode).join(', ')}>';
    } else {
      return name;
    }
  }

  String get typeNameAsNullableCode =>
      isNullable && !isDynamic && isResolvableType
          ? '$typeNameAsCode?'
          : typeNameAsCode;

  String get typeAsCode {
    if (this is VoidType) {
      return 'null';
    }

    var name = typeNameResolvable;
    var arguments = resolvedTypeArguments;

    if (arguments.isNotEmpty) {
      if (hasSimpleTypeArguments) {
        var typeArgs = arguments.map((a) => a.typeNameResolvable).toList();

        var constName = TypeReflection.getConstantName(name, typeArgs);
        if (constName != null) {
          return 'TypeReflection.$constName';
        }
      }

      return 'TypeReflection($name, [${arguments.map((e) {
        if (!e.hasTypeArguments && !e.isNullable) {
          return e.typeNameAsCode;
        } else {
          return e.typeAsCode;
        }
      }).join(', ')}])';
    } else {
      var constName = _getTypeReflectionConstantName(name);
      if (constName != null) {
        return 'TypeReflection.$constName';
      } else {
        if (this is TypeParameterType) {
          return 'TypeReflection.tDynamic';
        } else {
          return 'TypeReflection($name)';
        }
      }
    }
  }

  String? _getTypeReflectionConstantName([String? name]) {
    if (isDartCoreObject) {
      return 'tObject';
    } else if (isDartCoreString) {
      return 'tString';
    } else if (isDartCoreInt) {
      return 'tInt';
    } else if (isDartCoreDouble) {
      return 'tDouble';
    } else if (isDartCoreNum) {
      return 'tNum';
    } else if (isDartCoreBool) {
      return 'tBool';
    }

    name ??= typeNameResolvable;
    return TypeReflection.getConstantName(name);
  }
}

extension _ConstructorElementExtension on ConstructorElement {
  List<_Parameter> parametersWhere(bool Function(ParameterElement p) filter) {
    var list = <_Parameter>[];
    var i = 0;
    for (var p in parameters) {
      if (filter(p)) {
        var param = _Parameter(
            p, i, p.type, p.name, p.type.isNullable, p.isRequiredNamed);
        list.add(param);
      }
      i++;
    }
    return list;
  }

  List<_Parameter> get normalParameters =>
      parametersWhere((p) => !p.isOptionalPositional && !p.isNamed);

  List<_Parameter> get optionalParameters =>
      parametersWhere((p) => p.isOptionalPositional);

  Map<String, _Parameter> get namedParameters =>
      Map<String, _Parameter>.fromEntries(
          parametersWhere((p) => p.isNamed).map((e) => MapEntry(e.name, e)));
}

extension _FunctionTypeExtension on FunctionType {
  List<_Parameter> get normalParameters {
    return List<_Parameter>.generate(normalParameterNames.length, (i) {
      var n = normalParameterNames[i];
      var t = normalParameterTypes[i];
      var p = parameters[i];
      return _Parameter(p, i, t, n, t.isNullable, true);
    });
  }

  List<_Parameter> get optionalParameters {
    return List<_Parameter>.generate(optionalParameterNames.length, (i) {
      var n = optionalParameterNames[i];
      var t = optionalParameterTypes[i];
      var idx = normalParameterNames.length + i;
      var p = parameters[idx];
      return _Parameter(p, idx, t, n, t.isNullable, false);
    });
  }

  Map<String, _Parameter> get namedParameters {
    var map = <String, _Parameter>{};
    var normalParametersLength = normalParameterNames.length;
    var namedParametersLength = namedParameterTypes.length;

    for (var i = 0; i < namedParametersLength; ++i) {
      var idx = normalParametersLength + i;
      var p = parameters[idx];
      var key = p.name;
      var type = p.type;
      var required = p.isRequiredNamed;
      var parameter = _Parameter(p, idx, type, key, type.isNullable, required);
      map[key] = parameter;
    }

    return map;
  }
}

String _buildStringListCode(Iterable? o,
    {bool sorted = false, bool nullOnEmpty = false}) {
  if (o == null || o.isEmpty) {
    return nullOnEmpty ? 'null' : 'const <String>[]';
  } else {
    if (sorted) {
      var l = o.toList();
      l.sort();
      o = l;
    }
    return 'const <String>[' + o.map((e) => "'$e'").join(', ') + ']';
  }
}

String _buildParameterReflectionList(Iterable<_Parameter>? o,
    {required bool nullOnEmpty, required bool required}) {
  if (o == null || o.isEmpty) {
    return nullOnEmpty ? 'null' : '<ParameterReflection>[]';
  } else {
    var parameters = o
        .map((e) => "ParameterReflection( "
            "${e.type.typeAsCode} , "
            "'${e.name}' , "
            "${e.isNullable ? 'true' : 'false'} , "
            "$required , "
            "${e.defaultValue ?? 'null'} , "
            "${e.annotationsAsListCode}"
            ")")
        .join(', ');
    return 'const <ParameterReflection>[$parameters]';
  }
}

String _buildNamedParameterReflectionMap(Map<String, _Parameter>? o,
    {bool nullOnEmpty = false}) {
  if (o == null || o.isEmpty) {
    return nullOnEmpty ? 'null' : 'const <String,Type>{}}';
  } else {
    var parameters = o.entries.map((e) {
      var key = e.key;
      var value = e.value;
      return "'$key': ParameterReflection( "
          "${value.type.typeAsCode} , "
          "'${e.value.name}' , "
          "${e.value.isNullable ? 'true' : 'false'} , "
          "${e.value.required ? 'true' : 'false'} , "
          "${e.value.defaultValue ?? 'null'} , "
          "${e.value.annotationsAsListCode}"
          ")";
    }).join(', ');
    return 'const <String,ParameterReflection>{$parameters}';
  }
}
