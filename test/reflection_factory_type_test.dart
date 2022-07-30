import 'package:reflection_factory/reflection_factory.dart';
import 'package:test/test.dart';

import 'src/user_simple.dart';
import 'src/user_with_reflection.dart';

void main() {
  group('TypeExtension', () {
    test('basic', () async {
      {
        var t = int;
        expect(t.isPrimitiveType, isTrue);
      }

      {
        var t = double;
        expect(t.isPrimitiveType, isTrue);
      }

      {
        var t = num;
        expect(t.isPrimitiveType, isTrue);
      }

      {
        var t = BigInt;
        expect(t.isPrimitiveType, isFalse);
      }

      {
        var t = bool;
        expect(t.isPrimitiveType, isTrue);
      }

      {
        var t = String;
        expect(t.isPrimitiveType, isTrue);
      }
    });
  });

  group('GenericObjectExtension', () {
    test('basic', () async {
      {
        var v = 123;
        expect(v.isPrimitiveValue, isTrue);
        expect(v.isPrimitiveList, isFalse);
        expect(v.isPrimitiveMap, isFalse);
      }
      {
        var v = 12.3;
        expect(v.isPrimitiveValue, isTrue);
        expect(v.isPrimitiveList, isFalse);
        expect(v.isPrimitiveMap, isFalse);
      }
      {
        var v = 'abc';
        expect(v.isPrimitiveValue, isTrue);
        expect(v.isPrimitiveList, isFalse);
        expect(v.isPrimitiveMap, isFalse);
      }
      {
        var v = [123];
        expect(v.isPrimitiveValue, isFalse);
        expect(v.isPrimitiveList, isTrue);
        expect(v.isPrimitiveMap, isFalse);
      }
      {
        var v = [
          [123],
          [456]
        ];
        expect(v.isPrimitiveValue, isFalse);
        expect(v.isPrimitiveList, isFalse);
        expect(v.isPrimitiveMap, isFalse);
      }
      {
        var v = {'a': 123};
        expect(v.isPrimitiveValue, isFalse);
        expect(v.isPrimitiveList, isFalse);
        expect(v.isPrimitiveMap, isTrue);
      }
      {
        var v = {
          'a': [123]
        };
        expect(v.isPrimitiveValue, isFalse);
        expect(v.isPrimitiveList, isFalse);
        expect(v.isPrimitiveMap, isFalse);
      }
    });
  });

  group('TypeInfo', () {
    test('basic', () async {
      var t1 = TypeInfo(List);
      var t2 = TypeInfo(List);

      expect(t1.type, equals(t2.type));

      var t3 = TypeInfo.from([]);
      expect(t3.type, equals(t1.type));
      expect(t3.isList, isTrue);
      expect(t3.isSet, isFalse);
      expect(t3.isIterable, isTrue);
      expect(t3.isFuture, isFalse);
      expect(t3.isFutureOr, isFalse);
      expect(t3.isDynamic, isFalse);
      expect(t3.equalsType(TypeInfo.from([])), isTrue);
      expect(t3.equalsType(TypeInfo.from(<int>[])), isTrue);
      expect(t3.equalsType(TypeInfo.from(123)), isFalse);
      expect(t3.equalsTypeAndArguments(TypeInfo.from([])), isTrue);
      expect(t3.equalsTypeAndArguments(TypeInfo.from(<bool>[])), isTrue);
      expect(t3.equalsTypeAndArguments(TypeInfo.from({})), isFalse);
      expect(t3.equalsTypeAndArguments(TypeInfo.from(<bool>{})), isFalse);
      expect(t3.equalsTypeAndArguments(TypeInfo.from(123)), isFalse);

      var t4 = TypeInfo.from(<bool>{});
      expect(t4.isSet, isTrue);
      expect(t4.isList, isFalse);
      expect(t4.isIterable, isTrue);
      expect(t4.isFuture, isFalse);
      expect(t4.isFutureOr, isFalse);
      expect(t4.isDynamic, isFalse);
      expect(t4.equalsType(TypeInfo.from([])), isFalse);
      expect(t4.equalsType(TypeInfo.from(<int>[])), isFalse);
      expect(t4.equalsType(TypeInfo.from(123)), isFalse);
      expect(t4.equalsTypeAndArguments(TypeInfo.from(<bool>[])), isFalse);
      expect(t4.equalsTypeAndArguments(TypeInfo.from(<int>[])), isFalse);
      expect(t4.equalsTypeAndArguments(TypeInfo.from(<bool>{})), isTrue);
      expect(t4.equalsTypeAndArguments(TypeInfo.from(<int>{})), isTrue);
      expect(t4.equalsTypeAndArguments(TypeInfo.from(123)), isFalse);

      {
        var t = TypeInfo.fromType(List, [String]);
        expect(t.equalsType(TypeInfo.fromType(List, [String])), isTrue);
        expect(t.equalsType(TypeInfo.fromType(List, [int])), isTrue);
        expect(t.equalsType(TypeInfo.fromType(List, [String])), isTrue);
        expect(t.equalsType(TypeInfo.fromType(List)), isTrue);
        expect(t.equalsType(TypeInfo.fromType(Set)), isFalse);
        expect(t.equalsType(TypeInfo.fromType(Set, [String])), isFalse);

        expect(t.equalsTypeAndArguments(TypeInfo.fromType(List, [String])),
            isTrue);
        expect(
            t.equalsTypeAndArguments(TypeInfo.fromType(List, [int])), isFalse);
        expect(t.equalsTypeAndArguments(TypeInfo.fromType(List, [String])),
            isTrue);
        expect(t.equalsTypeAndArguments(TypeInfo.fromType(List)), isFalse);
        expect(t.equalsTypeAndArguments(TypeInfo.fromType(Set, [String])),
            isFalse);
        expect(
            t.equalsTypeAndArguments(TypeInfo.fromType(Set, [int])), isFalse);
        expect(t.equalsTypeAndArguments(TypeInfo.fromType(Set)), isFalse);
      }

      {
        var t = TypeInfo.fromType(List);
        expect(t.equalsType(TypeInfo.fromType(List)), isTrue);
        expect(t.equalsType(TypeInfo.fromType(List, [String])), isTrue);

        expect(t.equalsTypeAndArguments(TypeInfo.fromType(List)), isTrue);
        expect(t.equalsTypeAndArguments(TypeInfo.fromType(List, [String])),
            isFalse);
      }

      var t5 = TypeInfo.fromType(Future, [bool]);
      expect(t5.isFuture, isTrue);
      expect(t5.isFutureOr, isFalse);
      expect(t5.isDynamic, isFalse);
      expect(t5.arguments[0], equals(TypeInfo.tBool));

      var t6 = TypeInfo.fromType(FutureOr, [bool]);
      expect(t6.typeName, equals('FutureOr'));
      expect(t6.isFutureOr, isTrue);
      expect(t6.isFuture, isFalse);
      expect(t6.arguments[0], equals(TypeInfo.tBool));
      expect(t6.equivalentArgumentsTypes([bool]), isTrue);
      expect(t6.equivalentArgumentsTypes([int]), isFalse);

      var t7 = TypeInfo.fromType(Future, [bool]);
      expect(t7.typeName, equals('Future'));
      expect(t7.isFuture, isTrue);
      expect(t7.isFutureOr, isFalse);
      expect(t7.isVoid, isFalse);
      expect(t7.arguments[0], equals(TypeInfo.tBool));
      expect(t7.equivalentArgumentsTypes([bool]), isTrue);
      expect(t7.equivalentArgumentsTypes([int]), isFalse);

      var t8 = TypeInfo.fromType(Future);
      expect(t8.isFuture, isTrue);
      expect(t8.isFutureOr, isFalse);
      expect(t8.isVoid, isFalse);
      expect(t8.hasArguments, isFalse);
      expect(t8.equivalentArgumentsTypes([]), isTrue);
      expect(t8.equivalentArgumentsTypes([int]), isFalse);

      expect(TypeInfo.tVoid.isVoid, isTrue);
    });

    test('from', () async {
      {
        var typeInfo = TypeInfo.from(123);
        expect(typeInfo.isInt, isTrue);
        expect(typeInfo.isNumber, isTrue);
        expect(typeInfo.isDouble, isFalse);

        expect(typeInfo.isNum, isFalse);
        expect(typeInfo.isDynamic, isFalse);
        expect(typeInfo.isObject, isFalse);
      }

      {
        var typeInfo = TypeInfo.from(12.3);
        expect(typeInfo.isDouble, isTrue);
        expect(typeInfo.isInt, isFalse);
        expect(typeInfo.isNumber, isTrue);

        expect(typeInfo.isNum, isFalse);
        expect(typeInfo.isDynamic, isFalse);
        expect(typeInfo.isObject, isFalse);
      }

      {
        var typeInfo = TypeInfo.from(num);
        expect(typeInfo.isNum, isTrue);
        expect(typeInfo.isDouble, isFalse);
        expect(typeInfo.isInt, isFalse);
        expect(typeInfo.isNumber, isTrue);

        expect(typeInfo.isDynamic, isFalse);
        expect(typeInfo.isObject, isFalse);
      }

      {
        var typeInfo = TypeInfo.from(Object);
        expect(typeInfo.isNum, isFalse);
        expect(typeInfo.isDouble, isFalse);
        expect(typeInfo.isInt, isFalse);
        expect(typeInfo.isNumber, isFalse);
        expect(typeInfo.isDynamic, isFalse);

        expect(typeInfo.isObject, isTrue);
        expect(typeInfo.isDynamicOrObject, isTrue);
      }

      {
        var typeInfo = TypeInfo.from(dynamic);
        expect(typeInfo.isNum, isFalse);
        expect(typeInfo.isDouble, isFalse);
        expect(typeInfo.isInt, isFalse);
        expect(typeInfo.isNumber, isFalse);
        expect(typeInfo.isObject, isFalse);

        expect(typeInfo.isDynamic, isTrue);
        expect(typeInfo.isDynamicOrObject, isTrue);
      }

      {
        var typeInfo = TypeInfo(List, [TestUserWithReflection]);

        expect(typeInfo.isList, isTrue);
        expect(typeInfo.isListEntity, isTrue);

        expect(typeInfo.isDynamic, isFalse);
        expect(typeInfo.isObject, isFalse);

        expect(typeInfo.listEntityType,
            equals(TypeInfo.from(TestUserWithReflection)));
      }

      {
        expect(TypeInfo.from(bool).isPrimitiveType, isTrue);
        expect(TypeInfo.from(int).isPrimitiveType, isTrue);
        expect(TypeInfo.from(double).isPrimitiveType, isTrue);
        expect(TypeInfo.from(num).isPrimitiveType, isTrue);
        expect(TypeInfo.from(String).isPrimitiveType, isTrue);

        expect(TypeInfo.from(List).isPrimitiveType, isFalse);
        expect(TypeInfo.from(Map).isPrimitiveType, isFalse);
        expect(TypeInfo.from(Set).isPrimitiveType, isFalse);
        expect(TypeInfo.from(TestUserSimple).isPrimitiveType, isFalse);
      }

      {
        expect(TypeInfo.from(List).isCollection, isTrue);
        expect(TypeInfo.from(Map).isCollection, isTrue);
        expect(TypeInfo.from(Set).isCollection, isTrue);

        expect(TypeInfo.from(bool).isCollection, isFalse);
        expect(TypeInfo.from(int).isCollection, isFalse);
        expect(TypeInfo.from(double).isCollection, isFalse);
        expect(TypeInfo.from(num).isCollection, isFalse);
        expect(TypeInfo.from(String).isCollection, isFalse);

        expect(TypeInfo.from(TestUserSimple).isCollection, isFalse);
      }

      {
        expect(TypeInfo.from(int).isBasicType, isTrue);
        expect(TypeInfo.from(bool).isBasicType, isTrue);
        expect(TypeInfo.from(List).isBasicType, isTrue);
        expect(TypeInfo.from(Map).isBasicType, isTrue);

        expect(TypeInfo.from(TestUserSimple).isBasicType, isFalse);
      }

      {
        expect(TypeInfo.accepts<int>(int), isTrue);
        expect(TypeInfo.accepts<int>(double), isFalse);

        expect(TypeInfo.accepts<String>(String), isTrue);
        expect(TypeInfo.accepts<String>(int), isFalse);

        expect(TypeInfo.accepts<Object>(int), isTrue);
        expect(TypeInfo.accepts<Object>(double), isTrue);
        expect(TypeInfo.accepts<Object>(Object), isTrue);
        expect(TypeInfo.accepts<Object>(dynamic), isTrue);

        expect(TypeInfo.accepts<dynamic>(int), isTrue);
        expect(TypeInfo.accepts<dynamic>(double), isTrue);
        expect(TypeInfo.accepts<dynamic>(Object), isTrue);
        expect(TypeInfo.accepts<dynamic>(dynamic), isTrue);
      }

      {
        var t1 = TypeInfo(List);
        var t2 = TypeInfo(List);

        expect(t1.isList, isTrue);
        expect(t2.isList, isTrue);

        expect(t1.isIterable, isTrue);
        expect(t2.isIterable, isTrue);

        expect(t1.type, equals(t2.type));

        var t3 = TypeInfo.from([]);
        expect(t3.type, equals(t1.type));

        var company = TestCompanyWithReflection(
            'FooInc', TestAddressWithReflection('State1', 'City1'), [
          TestAddressWithReflection('State2', 'City2'),
          TestAddressWithReflection('State3', 'City3')
        ]);

        var fieldExtraAddressesTypeInfo =
            company.reflection.field('extraAddresses')!.type.typeInfo;

        expect(fieldExtraAddressesTypeInfo.type, equals(t1.type));

        var t4 = TypeInfo.from([TestAddressWithReflection.empty()],
            [TestAddressWithReflection.empty()]);
        expect(fieldExtraAddressesTypeInfo.type, equals(t4.type));
        expect(fieldExtraAddressesTypeInfo, equals(t4));
      }

      {
        var typeReflection =
            TypeReflection(Future, [TypeReflection(TestUserWithReflection)]);

        var typeInfo = typeReflection.typeInfo;

        expect(typeInfo.isFuture, isTrue);
        expect(typeInfo.equalsArgumentsTypes([TestUserWithReflection]), isTrue);
      }

      {
        var typeReflection =
            TypeReflection(FutureOr, [TypeReflection(TestUserWithReflection)]);

        var typeInfo = typeReflection.typeInfo;

        expect(typeInfo.isFutureOr, isTrue);
        expect(typeInfo.isDynamic, isFalse);
        expect(typeInfo.equalsArgumentsTypes([TestUserWithReflection]), isTrue);
      }

      {
        var typeReflection =
            TypeReflection(Future, [TestOpAWithReflection(123)]);

        var typeInfo = typeReflection.typeInfo;

        expect(typeInfo.isFuture, isTrue);
        expect(typeInfo.equalsArgumentsTypes([TestOpAWithReflection]), isTrue);

        expect(typeInfo, equals(TypeInfo(Future, [TestOpAWithReflection])));
      }

      {
        var typeReflection =
            TypeReflection(Future, [TestOpWithReflection<int>('test', 123)]);

        var typeInfo = typeReflection.typeInfo;

        expect(typeInfo.isFuture, isTrue);
        expect(
            typeInfo
                .equalsArgumentsTypes([TestOpWithReflection<int>('test', 456)]),
            isTrue);

        expect(typeInfo,
            equals(TypeInfo(Future, [TestOpWithReflection<int>('test', 789)])));

        expect(typeInfo.asTypeReflection, equals(typeReflection));
      }

      {
        var typeReflection = TypeReflection(
            Future, [TestOpWithReflection$reflection().reflectedType]);

        var typeInfo = typeReflection.typeInfo;

        print(typeInfo);

        expect(typeInfo.isFuture, isTrue);
        expect(typeInfo.equalsArgumentsTypes([TestOpWithReflection]), isTrue);

        expect(typeInfo, equals(TypeInfo(Future, [TestOpWithReflection])));
      }

      {
        var typeInfo1 = TypeInfo(Future, [
          TypeInfo(TestOpWithReflection, [int])
        ]);
        var typeInfo2 = TypeInfo(Future, [
          TypeInfo(TestOpWithReflection, [dynamic])
        ]);
        var typeInfo3 = TypeInfo(Future, [
          TypeInfo(TestOpWithReflection, [Object])
        ]);
        var typeInfo4 = TypeInfo(Future, [TestOpWithReflection]);

        expect(typeInfo1 == typeInfo2, isFalse);
        expect(typeInfo1 == typeInfo3, isFalse);
        expect(typeInfo1 == typeInfo4, isFalse);

        expect(typeInfo2 == typeInfo3, isFalse);
        expect(typeInfo2 == typeInfo4, isFalse);

        expect(typeInfo3 == typeInfo4, isFalse);

        expect(typeInfo2.isEquivalent(typeInfo3), isTrue);
        expect(typeInfo2.isEquivalent(typeInfo4), isTrue);
        expect(typeInfo2.isEquivalent(typeInfo1), isFalse);

        expect(typeInfo3.isEquivalent(typeInfo2), isTrue);
        expect(typeInfo4.isEquivalent(typeInfo2), isTrue);
        expect(typeInfo1.isEquivalent(typeInfo2), isFalse);

        //expect(typeInfo.equalsArgumentsTypes([TestOpWithReflection]), isTrue);

      }
    });

    test('TypeInfo.parse', () async {
      {
        var t = TypeInfo(bool);
        expect(t.parse(true), isTrue);
        expect(t.parse(false), isFalse);
        expect(t.parse('1'), isTrue);
        expect(t.parse(' 0 '), isFalse);
      }

      {
        var t = TypeInfo(int);
        expect(t.parse('123'), equals(123));
        expect(t.parse(' 123 '), equals(123));
        expect(t.parse(123), equals(123));
      }

      {
        var t = TypeInfo(double);
        expect(t.parse('123'), equals(123.0));
        expect(t.parse(' 123.1 '), equals(123.1));
        expect(t.parse(123.2), equals(123.2));
      }

      {
        var t = TypeInfo(String);
        expect(t.parse('123'), equals('123'));
        expect(t.parse(' 123 '), equals(' 123 '));
        expect(t.parse(123), equals('123'));
      }

      {
        var t = TypeInfo(DateTime);
        var dateTime = DateTime.fromMillisecondsSinceEpoch(1577934245000);
        expect(t.parse('1577934245000'), equals(dateTime));
        expect(t.parse(' 1577934245000 '), equals(dateTime));
        expect(t.parse(1577934245000), equals(dateTime));
        expect(t.parse('2020-01-02 03:04:05.000Z'), equals(dateTime.toUtc()));
      }

      {
        var t = TypeInfo(BigInt);
        var n = BigInt.from(1577934245000);
        expect(t.parse('1577934245000'), equals(n));
        expect(t.parse(' 1577934245000 '), equals(n));
        expect(t.parse(1577934245000), equals(n));
      }

      {
        var t = TypeInfo(List);
        var l = ['a', 'b', 'c'];
        expect(t.parse('a,b,c'), equals(l));
        expect(t.parse('a;b;c'), equals(l));
        expect(t.parse(['a', 'b', 'c']), equals(l));
      }

      {
        var t = TypeInfo(Set);
        var l = {'a', 'b', 'c'};
        expect(t.parse('a,b,c'), equals(l));
        expect(t.parse('a;b;c'), equals(l));
        expect(t.parse({'a', 'b', 'c'}), equals(l));
      }

      {
        var t = TypeInfo(Map);
        var m = {'a': '1', 'b': '2', 'c': '3'};
        expect(t.parse('a:1;b:2;c:3'), equals(m));
        expect(t.parse({'a': '1', 'b': '2', 'c': '3'}), equals(m));
      }

      {
        var t = TypeInfo(MapEntry);
        var m = t.parse<MapEntry>('a:1')!;
        expect(m.key, equals('a'));
        expect(m.value, equals('1'));
      }
    });

    test('TypeInfo.fromJson', () async {
      {
        TestUserWithReflection$reflection.boot();

        var typeListOfUser = TypeInfo.fromType(List, [TestUserWithReflection]);

        var users = [
          TestUserWithReflection.fields('joe', 'joe@mail.com', 'j123456',
              id: 101),
          TestUserWithReflection.fields('smith', 'smith@mail.com', 's123456',
              id: 102)
        ];

        var usersJson = JsonEncoder.defaultEncoder
            .toJson(users, duplicatedEntitiesAsID: true);

        expect(
            usersJson,
            equals([
              {
                'axis': 'x',
                'email': 'joe@mail.com',
                'enabled': true,
                'id': 101,
                'isEnabled': true,
                'theLevel': null,
                'name': 'joe',
                'password': 'j123456'
              },
              {
                'axis': 'x',
                'email': 'smith@mail.com',
                'enabled': true,
                'id': 102,
                'isEnabled': true,
                'theLevel': null,
                'name': 'smith',
                'password': 's123456'
              }
            ]));

        var usersDecoded = typeListOfUser.fromJson(usersJson);

        expect(
            JsonEncoder.defaultEncoder
                .toJson(usersDecoded, duplicatedEntitiesAsID: true),
            equals([
              {
                'axis': 'x',
                'email': 'joe@mail.com',
                'enabled': true,
                'id': 101,
                'isEnabled': true,
                'theLevel': null,
                'name': 'joe',
                'password': 'j123456'
              },
              {
                'axis': 'x',
                'email': 'smith@mail.com',
                'enabled': true,
                'id': 102,
                'isEnabled': true,
                'theLevel': null,
                'name': 'smith',
                'password': 's123456'
              }
            ]));
      }

      {
        TestUserWithReflection$reflection.boot();

        var typeListOfUser = TypeInfo.fromType(List, [TestUserWithReflection]);

        var user1 = TestUserWithReflection.fields(
            'joe', 'joe@mail.com', 'j123456',
            id: 101);
        var user2 = TestUserWithReflection.fields(
            'smith', 'smith@mail.com', 's123456',
            id: 102);

        var users = [user1, user2, user1];

        var usersJson = JsonEncoder.defaultEncoder
            .toJson(users, duplicatedEntitiesAsID: true);

        expect(
            usersJson,
            equals([
              {
                'axis': 'x',
                'email': 'joe@mail.com',
                'enabled': true,
                'id': 101,
                'isEnabled': true,
                'theLevel': null,
                'name': 'joe',
                'password': 'j123456'
              },
              {
                'axis': 'x',
                'email': 'smith@mail.com',
                'enabled': true,
                'id': 102,
                'isEnabled': true,
                'theLevel': null,
                'name': 'smith',
                'password': 's123456'
              },
              101
            ]));

        var usersDecoded = typeListOfUser.fromJson(usersJson) as List;

        expect(usersDecoded, equals([user1, user2, user1]));

        expect(identical(usersDecoded[0], usersDecoded[1]), isFalse);
        expect(identical(usersDecoded[0], usersDecoded[2]), isTrue);
        expect(identical(usersDecoded[1], usersDecoded[2]), isFalse);

        expect(
            JsonEncoder.defaultEncoder
                .toJson(usersDecoded, duplicatedEntitiesAsID: true),
            equals([
              {
                'axis': 'x',
                'email': 'joe@mail.com',
                'enabled': true,
                'id': 101,
                'isEnabled': true,
                'theLevel': null,
                'name': 'joe',
                'password': 'j123456'
              },
              {
                'axis': 'x',
                'email': 'smith@mail.com',
                'enabled': true,
                'id': 102,
                'isEnabled': true,
                'theLevel': null,
                'name': 'smith',
                'password': 's123456'
              },
              101
            ]));
      }

      {
        var typeMapOfUser =
            TypeInfo.fromType(Map, [String, TestUserWithReflection]);

        var users = <String, TestUserWithReflection>{
          'a': TestUserWithReflection.fields('joe', 'j@mail', '123'),
          'b': TestUserWithReflection.fields('smith', 's@mail', 'abc'),
        };

        var usersJson = JsonEncoder.defaultEncoder
            .toJson(users, duplicatedEntitiesAsID: true);

        expect(
            usersJson,
            equals({
              'a': {
                'axis': 'x',
                'email': 'j@mail',
                'enabled': true,
                'id': null,
                'isEnabled': true,
                'theLevel': null,
                'name': 'joe',
                'password': '123'
              },
              'b': {
                'axis': 'x',
                'email': 's@mail',
                'enabled': true,
                'id': null,
                'isEnabled': true,
                'theLevel': null,
                'name': 'smith',
                'password': 'abc'
              }
            }));

        var users2 = typeMapOfUser.fromJson(usersJson);

        expect(users2, equals(users));
      }
    });
  });

  group('TypeParser', () {
    test('TypeParser.isPrimitiveType/isPrimitiveValue', () async {
      expect(TypeParser.isPrimitiveType(bool), isTrue);
      expect(TypeParser.isPrimitiveType(int), isTrue);
      expect(TypeParser.isPrimitiveType(double), isTrue);
      expect(TypeParser.isPrimitiveType(num), isTrue);
      expect(TypeParser.isPrimitiveType(String), isTrue);
      expect(TypeParser.isPrimitiveType(TestUserWithReflection), isFalse);

      expect(TypeParser.isPrimitiveValue(123), isTrue);
      expect(TypeParser.isPrimitiveValue(TestUserWithReflection()), isFalse);
    });

    test('TypeParser.isAnyType', () async {
      expect(TypeParser.isAnyType(bool), isFalse);
      expect(TypeParser.isAnyType(int), isFalse);
      expect(TypeParser.isAnyType(double), isFalse);
      expect(TypeParser.isAnyType(num), isFalse);
      expect(TypeParser.isAnyType(String), isFalse);
      expect(TypeParser.isAnyType(TestUserWithReflection), isFalse);

      expect(TypeParser.isAnyType(Object), isTrue);
      expect(TypeParser.isAnyType(dynamic), isTrue);
    });

    test('TypeParser.isCollectionType/isCollectionValue', () async {
      expect(TypeParser.isCollectionType(bool), isFalse);
      expect(TypeParser.isCollectionType(int), isFalse);
      expect(TypeParser.isCollectionType(double), isFalse);
      expect(TypeParser.isCollectionType(num), isFalse);
      expect(TypeParser.isCollectionType(String), isFalse);
      expect(TypeParser.isCollectionType(TestUserWithReflection), isFalse);
      expect(TypeParser.isCollectionType(Object), isFalse);
      expect(TypeParser.isCollectionType(dynamic), isFalse);

      expect(TypeParser.isCollectionType(List), isTrue);
      expect(TypeParser.isCollectionType(Set), isTrue);
      expect(TypeParser.isCollectionType(Map), isTrue);

      expect(TypeParser.isCollectionValue(true), isFalse);
      expect(TypeParser.isCollectionValue(123), isFalse);
      expect(TypeParser.isCollectionValue(12.3), isFalse);
      expect(TypeParser.isCollectionValue('x'), isFalse);

      expect(TypeParser.isCollectionValue([1, 2]), isTrue);
      expect(TypeParser.isCollectionValue({'a': 1}), isTrue);
      expect(TypeParser.isCollectionValue({1, 2}), isTrue);
    });

    test('TypeParser.parseInt', () async {
      expect(TypeParser.parseInt(10), equals(10));
      expect(TypeParser.parseInt('11'), equals(11));
      expect(TypeParser.parseInt(' 12 '), equals(12));
      expect(TypeParser.parseInt(' -12 '), equals(-12));
      expect(TypeParser.parseInt(13.1), equals(13));
      expect(TypeParser.parseInt(" '123' "), equals(123));
      expect(TypeParser.parseInt(" '-123' "), equals(-123));
      expect(TypeParser.parseInt(' -1.2345e3 '), equals(-1234));
      expect(TypeParser.parseInt(' 123,456.78 '), equals(123456));
      expect(TypeParser.parseInt(' -123,456.78 '), equals(-123456));
      expect(TypeParser.parseInt(' "123,456.78 " '), equals(123456));
      expect(TypeParser.parseInt(' "-123,456.78 " '), equals(-123456));
      expect(TypeParser.parseInt(DateTime.utc(2020, 1, 2, 3, 4, 5, 0, 0)),
          equals(1577934245000));
      expect(TypeParser.parseInt(null, 404), equals(404));
      expect(TypeParser.parseInt('', 404), equals(404));
      expect(TypeParser.parseInt(' x ', 404), equals(404));
      expect(TypeParser.parseInt(null), isNull);

      expect(TypeParser.parseInt(BigInt.two), equals(2));
    });

    test('TypeParser.parseDouble', () async {
      expect(TypeParser.parseDouble(10), equals(10));
      expect(TypeParser.parseDouble(10.11), equals(10.11));
      expect(TypeParser.parseDouble('11'), equals(11.0));
      expect(TypeParser.parseDouble(' 12 '), equals(12.0));
      expect(TypeParser.parseDouble(' -12 '), equals(-12.0));
      expect(TypeParser.parseDouble(13.1), equals(13.1));
      expect(TypeParser.parseDouble(" '123' "), equals(123.0));
      expect(TypeParser.parseDouble(" '-123' "), equals(-123.0));
      expect(TypeParser.parseDouble(" '123.4' "), equals(123.4));
      expect(TypeParser.parseDouble(" '-123.4' "), equals(-123.4));
      expect(TypeParser.parseDouble('    -1.2345e3 '), equals(-1234.5));
      expect(TypeParser.parseDouble('   " 1.2345e3 "'), equals(1234.5));
      expect(TypeParser.parseDouble('   " -1.2345e3 "'), equals(-1234.5));
      expect(TypeParser.parseDouble(' 123,456.78 '), equals(123456.78));
      expect(TypeParser.parseDouble(' -123,456.78 '), equals(-123456.78));
      expect(TypeParser.parseDouble(' "123,456.78 " '), equals(123456.78));
      expect(TypeParser.parseDouble(' "-123,456.78 " '), equals(-123456.78));
      expect(TypeParser.parseDouble(DateTime.utc(2020, 1, 2, 3, 4, 5, 0, 0)),
          equals(1577934245000));
      expect(TypeParser.parseDouble(null, 404), equals(404));
      expect(TypeParser.parseDouble('', 404), equals(404));
      expect(TypeParser.parseDouble(' x ', 404), equals(404));
      expect(TypeParser.parseDouble(null), isNull);
    });

    test('TypeParser.parseNum', () async {
      expect(TypeParser.parseNum(10), equals(10));
      expect(TypeParser.parseNum(10.11), equals(10.11));
      expect(TypeParser.parseNum('11'), equals(11.0));
      expect(TypeParser.parseNum(' 12 '), equals(12));
      expect(TypeParser.parseNum(' -12 '), equals(-12));
      expect(TypeParser.parseNum(13.1), equals(13.1));
      expect(TypeParser.parseNum(" '123' "), equals(123));
      expect(TypeParser.parseNum(" '-123' "), equals(-123));
      expect(TypeParser.parseNum(" '123.4' "), equals(123.4));
      expect(TypeParser.parseNum(" '-123.4' "), equals(-123.4));
      expect(TypeParser.parseNum('    -1.2345e3 '), equals(-1234.5));
      expect(TypeParser.parseNum('   " 1.2345e3 "'), equals(1234.5));
      expect(TypeParser.parseNum('   " -1.2345e3 "'), equals(-1234.5));
      expect(TypeParser.parseNum(' 123,456.78 '), equals(123456.78));
      expect(TypeParser.parseNum(' -123,456.78 '), equals(-123456.78));
      expect(TypeParser.parseNum(' "123,456.78 " '), equals(123456.78));
      expect(TypeParser.parseNum(' "-123,456.78 " '), equals(-123456.78));
      expect(TypeParser.parseNum(DateTime.utc(2020, 1, 2, 3, 4, 5, 0, 0)),
          equals(1577934245000));
      expect(TypeParser.parseNum(null, 404), equals(404));
      expect(TypeParser.parseNum('', 404), equals(404));
      expect(TypeParser.parseNum(' x ', 404), equals(404));
      expect(TypeParser.parseNum(null), isNull);
    });

    test('TypeParser.parseBool', () async {
      expect(TypeParser.parseBool(true), isTrue);
      expect(TypeParser.parseBool(false), isFalse);

      expect(TypeParser.parseBool(1), isTrue);
      expect(TypeParser.parseBool(0), isFalse);
      expect(TypeParser.parseBool(-1), isFalse);

      expect(TypeParser.parseBool(' x ', true), isTrue);
      expect(TypeParser.parseBool(' x ', false), isFalse);

      expect(TypeParser.parseBool('null', true), isTrue);
      expect(TypeParser.parseBool('null', false), isFalse);

      expect(TypeParser.parseBool('1'), isTrue);
      expect(TypeParser.parseBool('0'), isFalse);
      expect(TypeParser.parseBool('-1'), isFalse);

      expect(TypeParser.parseBool('true'), isTrue);
      expect(TypeParser.parseBool('t'), isTrue);
      expect(TypeParser.parseBool('yes'), isTrue);
      expect(TypeParser.parseBool('ok'), isTrue);

      expect(TypeParser.parseBool('false'), isFalse);
      expect(TypeParser.parseBool('f'), isFalse);
      expect(TypeParser.parseBool('no'), isFalse);
      expect(TypeParser.parseBool('fail'), isFalse);
      expect(TypeParser.parseBool('error'), isFalse);
    });

    test('TypeParser.parseMap', () async {
      expect(TypeParser.parseMap({'a': 1, 'b': 2}), equals({'a': 1, 'b': 2}));
      expect(TypeParser.parseMap('a:1&b:2'), equals({'a': '1', 'b': '2'}));

      expect(TypeParser.parseMap<String, int>({'a': '1', 'b': '2'}),
          equals({'a': 1, 'b': 2}));
      expect(TypeParser.parseMap<String, int>('a:1&b:2'),
          equals({'a': 1, 'b': 2}));

      expect(TypeParser.parseMap(['a:1', 'b:2']), equals({'a': '1', 'b': '2'}));
    });

    test('TypeParser.parseMapEntry', () async {
      expect(TypeParser.parseMapEntry(MapEntry('a', 1)).toString(),
          equals('MapEntry(a: 1)'));

      expect(
          TypeParser.parseMapEntry('a:1').toString(), equals('MapEntry(a: 1)'));
      expect(
          TypeParser.parseMapEntry('a=1').toString(), equals('MapEntry(a: 1)'));

      expect(TypeParser.parseMapEntry(['x', 12]).toString(),
          equals('MapEntry(x: 12)'));

      expect(TypeParser.parseMapEntry('y').toString(),
          equals('MapEntry(y: null)'));

      {
        var me = TypeParser.parseMapEntry<String, int>(MapEntry('A', '123'))!;
        expect(me.key, equals('A'));
        expect(me.value, equals(123));
      }

      {
        var me = TypeParser.parseMapEntry<String, double>(['X', 123])!;
        expect(me.key, equals('X'));
        expect(me.value, equals(123.0));
      }
    });

    test('TypeParser.parserFor', () async {
      expect(TypeParser.parserFor<int>()!('123'), isA<int>());
      expect(TypeParser.parserFor<double>()!('123,4'), isA<double>());
      expect(TypeParser.parserFor<num>()!('123,4'), isA<num>());
      expect(TypeParser.parserFor<bool>()!('true'), isA<bool>());
      expect(TypeParser.parserFor<String>()!('x'), isA<String>());
      expect(TypeParser.parserFor<Map>()!('a:1'), isA<Map>());
      expect(TypeParser.parserFor<Set>()!('1,2'), isA<Set>());
      expect(TypeParser.parserFor<List>()!('1,2'), isA<List>());
      expect(TypeParser.parserFor<Iterable>()!('1,2'), isA<List>());

      expect(TypeParser.parserFor(type: int)!('123'), isA<int>());
      expect(TypeParser.parserFor(type: double)!('123,4'), isA<double>());
      expect(TypeParser.parserFor(type: num)!('123,4'), isA<num>());
      expect(TypeParser.parserFor(type: bool)!('t'), isA<bool>());
      expect(TypeParser.parserFor(type: String)!('x'), isA<String>());
      expect(TypeParser.parserFor(type: Map)!('a:1'), isA<Map>());
      expect(TypeParser.parserFor(type: Set)!('1,2'), isA<Set>());
      expect(TypeParser.parserFor(type: List)!('1,2'), isA<List>());
      expect(TypeParser.parserFor(type: Iterable)!('1,2'), isA<Iterable>());

      expect(TypeParser.parserFor(obj: 123)!('123'), isA<int>());
      expect(TypeParser.parserFor(obj: 123.4)!('123,4'), isA<double>());
      expect(TypeParser.parserFor(obj: 123)!('123,4'), isA<num>());
      expect(TypeParser.parserFor(obj: true)!('123,4'), isA<bool>());
      expect(TypeParser.parserFor(obj: 'x')!('x'), isA<String>());

      expect(
          TypeParser.parserFor(obj: BigInt.from(101))!('101'), isA<BigInt>());
      expect(
          TypeParser.parserFor(obj: DateTime(2020, 1, 2, 3, 4, 5, 0, 0))!(
              '2020-01-02 03:04:05.000Z'),
          isA<DateTime>());

      expect(TypeParser.parserFor(obj: {'a': 1})!('a:1'), isA<Map>());
      expect(TypeParser.parserFor(obj: {1, 2})!('1,2'), isA<Set>());
      expect(TypeParser.parserFor(obj: [1, 2])!('1,2'), isA<List>());
      expect(TypeParser.parserFor(obj: [1, 2].map((e) => e))!('1,2'),
          isA<Iterable>());
    });

    test('TypeParser.parserFor', () async {
      expect(TypeParser.parseValueForType(double, '12.3'), equals(12.3));

      expect(TypeParser.parseValueForType(BigInt, '123'),
          equals(BigInt.from(123)));

      expect(TypeParser.parseValueForType(DateTime, '2020-01-02 03:04:05.000Z'),
          equals(DateTime.parse('2020-01-02 03:04:05.000Z')));
    });

    test('TypeParser.parseList', () async {
      expect(TypeParser.parseList([1, 2, 3]), equals([1, 2, 3]));
      expect(TypeParser.parseList('1,2,3'), equals(['1', '2', '3']));
      expect(TypeParser.parseList('1,2,3', elementParser: TypeParser.parseInt),
          equals([1, 2, 3]));
      expect(TypeParser.parseList<int>('1,2,3'), equals([1, 2, 3]));
    });

    test('TypeParser.parseSet', () async {
      expect(TypeParser.parseSet([1, 2, 3]), equals({1, 2, 3}));
      expect(TypeParser.parseSet('1,2,3'), equals({'1', '2', '3'}));
      expect(TypeParser.parseSet('1,2,3', elementParser: TypeParser.parseInt),
          equals({1, 2, 3}));
      expect(TypeParser.parseSet<int>('1,2,3'), equals({1, 2, 3}));
    });

    test('TypeParser.parseMap', () async {
      expect(TypeParser.parseMap({'a': 1, 'b': 2}), equals({'a': 1, 'b': 2}));
      expect(TypeParser.parseMap('a:1&b:2'), equals({'a': '1', 'b': '2'}));
      expect(
          TypeParser.parseMap('a:1&b:2',
              keyParser: TypeParser.parseString,
              valueParser: TypeParser.parseInt),
          equals({'a': 1, 'b': 2}));
      expect(TypeParser.parseMap<String, int>('a:1&b:2'),
          equals({'a': 1, 'b': 2}));
    });

    test('TypeParser.parseDateTime', () async {
      expect(TypeParser.parseDateTime(DateTime.utc(2020, 1, 2, 3, 4, 5, 0, 0)),
          equals(DateTime.utc(2020, 1, 2, 3, 4, 5, 0, 0)));

      expect(TypeParser.parseDateTime('2020-01-02 03:04:05.000Z'),
          equals(DateTime.utc(2020, 1, 2, 3, 4, 5, 0, 0)));

      expect(TypeParser.parseDateTime(1577934245000),
          equals(DateTime.fromMillisecondsSinceEpoch(1577934245000)));
    });

    test('TypeParser.parseBigInt', () async {
      expect(TypeParser.parseBigInt(1577934245000),
          equals(BigInt.from(1577934245000)));

      expect(TypeParser.parseBigInt('1577934245000'),
          equals(BigInt.from(1577934245000)));

      expect(TypeParser.parseBigInt(' 1577934245000 '),
          equals(BigInt.from(1577934245000)));

      expect(TypeParser.parseBigInt(' -1577934245000 '),
          equals(BigInt.from(-1577934245000)));

      expect(TypeParser.parseBigInt('1,577,934,245,000'),
          equals(BigInt.from(1577934245000)));

      expect(TypeParser.parseBigInt('-1,577,934,245,000'),
          equals(BigInt.from(-1577934245000)));

      expect(TypeParser.parseBigInt(DateTime.utc(2020, 10, 2, 3, 4, 5, 0, 0)),
          equals(BigInt.from(1601607845000)));
    });
  });
}
