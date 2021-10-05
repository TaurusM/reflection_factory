//
// GENERATED CODE - DO NOT MODIFY BY HAND!
// BUILDER: reflection_factory/1.0.12
// BUILD COMMAND: dart run build_runner build
//

part of 'reflection_factory_bridge_example.dart';

class User$reflection extends ClassReflection<User> {
  User$reflection([User? object]) : super(User, object);

  bool _registered = false;
  @override
  void register() {
    if (!_registered) {
      _registered = true;
      super.register();
    }
  }

  @override
  Version get languageVersion => Version.parse('2.13.0');

  @override
  User$reflection withObject([User? obj]) => User$reflection(obj);

  @override
  bool get hasDefaultConstructor => false;
  @override
  User? createInstanceWithDefaultConstructor() => null;

  @override
  bool get hasEmptyConstructor => true;
  @override
  User? createInstanceWithEmptyConstructor() => User.empty();

  @override
  List<String> get constructorsNames => const <String>['', 'empty'];

  @override
  ConstructorReflection<User>? constructor<R>(String constructorName) {
    var lc = constructorName.trim().toLowerCase();

    switch (lc) {
      case '':
        return ConstructorReflection<User>(
            this,
            '',
            () => (String? email, String pass) => User(email, pass),
            const <ParameterReflection>[
              ParameterReflection(
                  TypeReflection.tString, 'email', true, true, null, null),
              ParameterReflection(
                  TypeReflection.tString, 'pass', false, true, null, null)
            ],
            null,
            null,
            null);
      case 'empty':
        return ConstructorReflection<User>(
            this, 'empty', () => () => User.empty(), null, null, null, null);
      default:
        return null;
    }
  }

  @override
  List<Object> get classAnnotations => List<Object>.unmodifiable(<Object>[]);

  @override
  List<String> get fieldsNames => const <String>['email', 'hasEmail', 'pass'];

  @override
  FieldReflection<User, T>? field<T>(String fieldName, [User? obj]) {
    obj ??= object!;

    var lc = fieldName.trim().toLowerCase();

    switch (lc) {
      case 'email':
        return FieldReflection<User, T>(
          this,
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
      case 'pass':
        return FieldReflection<User, T>(
          this,
          TypeReflection.tString,
          'pass',
          false,
          (o) => () => o!.pass as T,
          (o) => (T? v) => o!.pass = v as String,
          obj,
          false,
          false,
          null,
        );
      case 'hasemail':
        return FieldReflection<User, T>(
          this,
          TypeReflection.tBool,
          'hasEmail',
          false,
          (o) => () => o!.hasEmail as T,
          null,
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
  List<String> get staticFieldsNames => const <String>[];

  @override
  FieldReflection<User, T>? staticField<T>(String fieldName) {
    return null;
  }

  @override
  List<String> get methodsNames => const <String>['checkPassword'];

  @override
  MethodReflection<User, R>? method<R>(String methodName, [User? obj]) {
    obj ??= object;

    var lc = methodName.trim().toLowerCase();

    switch (lc) {
      case 'checkpassword':
        return MethodReflection<User, R>(
            this,
            'checkPassword',
            TypeReflection.tBool,
            false,
            (o) => o!.checkPassword,
            obj,
            false,
            const <ParameterReflection>[
              ParameterReflection(
                  TypeReflection.tString, 'pass', false, true, null, null)
            ],
            null,
            null,
            null);
      default:
        return null;
    }
  }

  @override
  List<String> get staticMethodsNames => const <String>[];

  @override
  MethodReflection<User, R>? staticMethod<R>(String methodName) {
    return null;
  }
}

extension User$reflectionExtension on User {
  /// Returns a [ClassReflection] for type [User]. (Generated by [ReflectionFactory])
  ClassReflection<User> get reflection => User$reflection(this);

  /// Returns a JSON [Map] for type [User]. (Generated by [ReflectionFactory])
  Map<String, dynamic> toJson() => reflection.toJson();

  /// Returns an encoded JSON [String] for type [User]. (Generated by [ReflectionFactory])
  String toJsonEncoded() => reflection.toJsonEncoded();
}

extension UserReflectionBridge$reflectionExtension on UserReflectionBridge {
  /// Returns a [ClassReflection] for type [T] or [obj]. (Generated by [ReflectionFactory])
  ClassReflection<T> reflection<T>([T? obj]) {
    switch (T) {
      case User:
        return User$reflection(obj as User?) as ClassReflection<T>;
      default:
        throw UnsupportedError('<$runtimeType> No reflection for Type: $T');
    }
  }
}
