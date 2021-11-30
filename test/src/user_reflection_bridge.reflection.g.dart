//
// GENERATED CODE - DO NOT MODIFY BY HAND!
// BUILDER: reflection_factory/1.0.20
// BUILD COMMAND: dart run build_runner build
//

// ignore_for_file: unnecessary_const

part of 'user_reflection_bridge.dart';

// ignore: non_constant_identifier_names
TestUserSimple TestUserSimple$fromJson(Map<String, Object?> map) =>
    TestUserSimple$reflection.staticInstance.fromJson(map);
// ignore: non_constant_identifier_names
TestUserSimple TestUserSimple$fromJsonEncoded(String jsonEncoded) =>
    TestUserSimple$reflection.staticInstance.fromJsonEncoded(jsonEncoded);

class TestUserSimple$reflection extends ClassReflection<TestUserSimple> {
  TestUserSimple$reflection([TestUserSimple? object])
      : super(TestUserSimple, object);

  static bool _registered = false;
  @override
  void register() {
    if (!_registered) {
      _registered = true;
      super.register();
      _registerSiblingsReflection();
    }
  }

  @override
  Version get languageVersion => Version.parse('2.13.0');

  @override
  Version get reflectionFactoryVersion => Version.parse('1.0.20');

  @override
  TestUserSimple$reflection withObject([TestUserSimple? obj]) =>
      TestUserSimple$reflection(obj);

  static TestUserSimple$reflection? _withoutObjectInstance;
  @override
  TestUserSimple$reflection withoutObjectInstance() =>
      _withoutObjectInstance ??=
          super.withoutObjectInstance() as TestUserSimple$reflection;

  static TestUserSimple$reflection get staticInstance =>
      _withoutObjectInstance ??= TestUserSimple$reflection();

  @override
  bool get hasDefaultConstructor => false;
  @override
  TestUserSimple? createInstanceWithDefaultConstructor() => null;

  @override
  bool get hasEmptyConstructor => true;
  @override
  TestUserSimple? createInstanceWithEmptyConstructor() =>
      TestUserSimple.empty();
  @override
  bool get hasNoRequiredArgsConstructor => true;
  @override
  TestUserSimple? createInstanceWithNoRequiredArgsConstructor() =>
      TestUserSimple.empty();

  @override
  List<String> get constructorsNames => const <String>['', 'empty'];

  @override
  ConstructorReflection<TestUserSimple>? constructor<R>(
      String constructorName) {
    var lc = constructorName.trim().toLowerCase();

    switch (lc) {
      case '':
        return ConstructorReflection<TestUserSimple>(
            this,
            TestUserSimple,
            '',
            () => (String name, String? email, String password) =>
                TestUserSimple(name, email, password),
            const <ParameterReflection>[
              ParameterReflection(
                  TypeReflection.tString, 'name', false, true, null, null),
              ParameterReflection(
                  TypeReflection.tString, 'email', true, true, null, null),
              ParameterReflection(
                  TypeReflection.tString, 'password', false, true, null, null)
            ],
            null,
            null,
            null);
      case 'empty':
        return ConstructorReflection<TestUserSimple>(
            this,
            TestUserSimple,
            'empty',
            () => () => TestUserSimple.empty(),
            null,
            null,
            null,
            null);
      default:
        return null;
    }
  }

  static const List<Object> _classAnnotations = [
    TestAnnotation(['class', 'user'])
  ];

  @override
  List<Object> get classAnnotations =>
      List<Object>.unmodifiable(_classAnnotations);

  @override
  List<ClassReflection> siblingsClassReflection() =>
      _siblingsReflection().whereType<ClassReflection>().toList();

  @override
  List<Reflection> siblingsReflection() => _siblingsReflection();

  @override
  List<Type> get supperTypes => const <Type>[];

  @override
  bool get hasMethodToJson => false;

  @override
  Object? callMethodToJson([TestUserSimple? obj]) => null;

  @override
  List<String> get fieldsNames => const <String>['email', 'name', 'password'];

  @override
  FieldReflection<TestUserSimple, T>? field<T>(String fieldName,
      [TestUserSimple? obj]) {
    obj ??= object;

    var lc = fieldName.trim().toLowerCase();

    switch (lc) {
      case 'name':
        return FieldReflection<TestUserSimple, T>(
          this,
          TestUserSimple,
          TypeReflection.tString,
          'name',
          false,
          (o) => () => o!.name as T,
          null,
          obj,
          false,
          true,
          [
            TestAnnotation(['field', 'name'])
          ],
        );
      case 'email':
        return FieldReflection<TestUserSimple, T>(
          this,
          TestUserSimple,
          TypeReflection.tString,
          'email',
          true,
          (o) => () => o!.email as T,
          (o) => (T? v) => o!.email = v as String?,
          obj,
          false,
          false,
          null,
        );
      case 'password':
        return FieldReflection<TestUserSimple, T>(
          this,
          TestUserSimple,
          TypeReflection.tString,
          'password',
          false,
          (o) => () => o!.password as T,
          (o) => (T? v) => o!.password = v as String,
          obj,
          false,
          false,
          null,
        );
      default:
        return null;
    }
  }

  @override
  List<String> get staticFieldsNames =>
      const <String>['version', 'withReflection'];

  @override
  FieldReflection<TestUserSimple, T>? staticField<T>(String fieldName) {
    var lc = fieldName.trim().toLowerCase();

    switch (lc) {
      case 'version':
        return FieldReflection<TestUserSimple, T>(
          this,
          TestUserSimple,
          TypeReflection.tDouble,
          'version',
          false,
          (o) => () => TestUserSimple.version as T,
          null,
          null,
          true,
          true,
          [
            TestAnnotation(['static field', 'version'])
          ],
        );
      case 'withreflection':
        return FieldReflection<TestUserSimple, T>(
          this,
          TestUserSimple,
          TypeReflection.tBool,
          'withReflection',
          false,
          (o) => () => TestUserSimple.withReflection as T,
          null,
          null,
          true,
          true,
          null,
        );
      default:
        return null;
    }
  }

  @override
  List<String> get methodsNames =>
      const <String>['checkThePassword', 'hasEmail'];

  @override
  MethodReflection<TestUserSimple, R>? method<R>(String methodName,
      [TestUserSimple? obj]) {
    obj ??= object;

    var lc = methodName.trim().toLowerCase();

    switch (lc) {
      case 'checkthepassword':
        return MethodReflection<TestUserSimple, R>(
            this,
            TestUserSimple,
            'checkThePassword',
            TypeReflection.tBool,
            false,
            (o) => o!.checkThePassword,
            obj,
            false,
            const <ParameterReflection>[
              ParameterReflection(
                  TypeReflection.tString, 'password', false, true, null, [
                TestAnnotation(['parameter', 'password'])
              ])
            ],
            null,
            const <String, ParameterReflection>{
              'ignoreCase': ParameterReflection(
                  TypeReflection.tBool, 'ignoreCase', false, false, false, null)
            },
            [
              TestAnnotation(['method', 'password checker'])
            ]);
      case 'hasemail':
        return MethodReflection<TestUserSimple, R>(
            this,
            TestUserSimple,
            'hasEmail',
            TypeReflection.tBool,
            false,
            (o) => o!.hasEmail,
            obj,
            false,
            null,
            null,
            null,
            null);
      default:
        return null;
    }
  }

  @override
  List<String> get staticMethodsNames => const <String>['isVersion'];

  @override
  MethodReflection<TestUserSimple, R>? staticMethod<R>(String methodName) {
    var lc = methodName.trim().toLowerCase();

    switch (lc) {
      case 'isversion':
        return MethodReflection<TestUserSimple, R>(
            this,
            TestUserSimple,
            'isVersion',
            TypeReflection.tBool,
            false,
            (o) => TestUserSimple.isVersion,
            null,
            true,
            const <ParameterReflection>[
              ParameterReflection(
                  TypeReflection.tDouble, 'ver', false, true, null, null)
            ],
            null,
            null,
            [
              TestAnnotation(['static method', 'version checker'])
            ]);
      default:
        return null;
    }
  }
}

extension TestUserReflectionBridge$reflectionExtension
    on TestUserReflectionBridge {
  /// Returns a [ClassReflection] for type [T] or [obj]. (Generated by [ReflectionFactory])
  ClassReflection<T> reflection<T>([T? obj]) {
    switch (T) {
      case TestUserSimple:
        return TestUserSimple$reflection(obj as TestUserSimple?)
            as ClassReflection<T>;
      default:
        throw UnsupportedError('<$runtimeType> No reflection for Type: $T');
    }
  }
}

extension TestUserSimple$reflectionExtension on TestUserSimple {
  /// Returns a [ClassReflection] for type [TestUserSimple]. (Generated by [ReflectionFactory])
  ClassReflection<TestUserSimple> get reflection =>
      TestUserSimple$reflection(this);

  /// Returns a JSON for type [TestUserSimple]. (Generated by [ReflectionFactory])
  Object? toJson() => reflection.toJson();

  /// Returns a JSON [Map] for type [TestUserSimple]. (Generated by [ReflectionFactory])
  Map<String, dynamic>? toJsonMap() => reflection.toJsonMap();

  /// Returns an encoded JSON [String] for type [TestUserSimple]. (Generated by [ReflectionFactory])
  String toJsonEncoded({bool pretty = false}) =>
      reflection.toJsonEncoded(pretty: pretty);

  /// Returns a JSON for type [TestUserSimple] using the class fields. (Generated by [ReflectionFactory])
  Object? toJsonFromFields() => reflection.toJsonFromFields();
}

List<Reflection> _listSiblingsReflection() => <Reflection>[
      TestUserSimple$reflection(),
    ];

List<Reflection>? _siblingsReflectionList;
List<Reflection> _siblingsReflection() => _siblingsReflectionList ??=
    List<Reflection>.unmodifiable(_listSiblingsReflection());

bool _registerSiblingsReflectionCalled = false;
void _registerSiblingsReflection() {
  if (_registerSiblingsReflectionCalled) return;
  _registerSiblingsReflectionCalled = true;
  var length = _listSiblingsReflection().length;
  assert(length > 0);
}
