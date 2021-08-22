import 'package:reflection_factory/reflection_factory.dart';

// Add a reference to the code generated by:
// $> dart run build_runner build
part 'reflection_factory_example.reflection.g.dart';

void main() {
  var user = User('joe@mail.com', '123');

  // The generated reflection:
  var userReflection = user.reflection;

  var fieldEmail = userReflection.field('email')!;
  print('email: ${fieldEmail.get()}');

  var methodCheckPassword = userReflection.method('checkPassword')!;

  var passOk1 = methodCheckPassword.invoke(['wrong']); // false
  print('pass("wrong"): $passOk1');

  var passOk2 = methodCheckPassword.invoke(['123']); // true
  print('pass("123"): $passOk2');

  print('User JSON:');
  print(user.toJson());

  print('User JSON encoded:');
  print(user.toJsonEncoded());
}

// Indicated that reflection for class `User` will be generated/enabled:
@EnableReflection()
class User {
  String? email;

  String pass;

  User(this.email, this.pass);

  bool get hasEmail => email != null;

  bool checkPassword(String pass) {
    return this.pass == pass;
  }
}

// ------------------------
// OUTPUT:
// ------------------------
// email: joe@mail.com
// pass("wrong"): false
// pass("123"): true
// User JSON:
// {email: joe@mail.com, pass: 123, hasEmail: true}
// User JSON encoded:
// {"email":"joe@mail.com","pass":"123","hasEmail":true}