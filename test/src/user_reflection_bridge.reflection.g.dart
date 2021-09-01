//
// GENERATED CODE - DO NOT MODIFY BY HAND!
// BUILDER: "reflection_factory"
// BUILD COMMAND: dart run build_runner build
//

part of 'user_reflection_bridge.dart';

class TestUserSimple$reflection extends ClassReflection<TestUserSimple> {
  TestUserSimple$reflection([TestUserSimple? object])
      : super(TestUserSimple, object);

  bool _registered = false;
  @override
  void register() {
    if (!_registered) {
      _registered = true;
      super.register();
    }
  }

  @override
  TestUserSimple$reflection withObject([TestUserSimple? obj]) =>
      TestUserSimple$reflection(obj);

  @override
  Version get languageVersion => Version.parse('2.13.0');

  static const List<Object> _classAnnotations = [
    TestAnnotation(['class', 'user'])
  ];

  @override
  List<Object> get classAnnotations =>
      List<Object>.unmodifiable(_classAnnotations);

  @override
  List<String> get fieldsNames => const <String>['email', 'name', 'password'];

  @override
  FieldReflection<TestUserSimple, T>? field<T>(String fieldName,
      [TestUserSimple? obj]) {
    obj ??= object!;

    var lc = fieldName.trim().toLowerCase();

    switch (lc) {
      case 'name':
        return FieldReflection<TestUserSimple, T>(
          this,
          String,
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
          String,
          'email',
          true,
          (o) => () => o!.email as T,
          (o) => (T v) => o!.email = v as String?,
          obj,
          false,
          false,
          null,
        );
      case 'password':
        return FieldReflection<TestUserSimple, T>(
          this,
          String,
          'password',
          false,
          (o) => () => o!.password as T,
          (o) => (T v) => o!.password = v as String,
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
          double,
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
          bool,
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
  MethodReflection<TestUserSimple>? method(String methodName,
      [TestUserSimple? obj]) {
    obj ??= object;

    var lc = methodName.trim().toLowerCase();

    switch (lc) {
      case 'checkthepassword':
        return MethodReflection<TestUserSimple>(
            this,
            'checkThePassword',
            bool,
            false,
            (o) => o!.checkThePassword,
            obj,
            false,
            const <ParameterReflection>[
              ParameterReflection(String, 'password', false, false, [
                TestAnnotation(['parameter', 'password'])
              ])
            ],
            null,
            const <String, ParameterReflection>{
              'ignoreCase':
                  ParameterReflection(bool, 'ignoreCase', false, false, null)
            },
            [
              TestAnnotation(['method', 'password checker'])
            ]);
      case 'hasemail':
        return MethodReflection<TestUserSimple>(this, 'hasEmail', bool, false,
            (o) => o!.hasEmail, obj, false, null, null, null, null);
      default:
        return null;
    }
  }

  @override
  List<String> get staticMethodsNames => const <String>['isVersion'];

  @override
  MethodReflection<TestUserSimple>? staticMethod(String methodName) {
    var lc = methodName.trim().toLowerCase();

    switch (lc) {
      case 'isversion':
        return MethodReflection<TestUserSimple>(
            this,
            'isVersion',
            bool,
            false,
            (o) => TestUserSimple.isVersion,
            null,
            true,
            const <ParameterReflection>[
              ParameterReflection(double, 'ver', false, false, null)
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

  /// Returns a JSON [Map] for type [TestUserSimple]. (Generated by [ReflectionFactory])
  Map<String, dynamic> toJson() => reflection.toJson();

  /// Returns an encoded JSON [String] for type [TestUserSimple]. (Generated by [ReflectionFactory])
  String toJsonEncoded() => reflection.toJsonEncoded();
}
