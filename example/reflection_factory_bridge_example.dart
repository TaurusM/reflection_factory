import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reflection_factory/reflection_factory.dart';

part 'reflection_factory_bridge_example.reflection.g.dart';

@ReflectionBridge([MaterialApp])
class ReflectionBridge1 {}

main() {
  List<ParameterReflection>? fields = MaterialApp$reflection().constructor('')!.allParameters;
  for (var element in fields) {
    print('======');
    print('${element.type}${element.nullable ? '?' : ''} ${element.name}');
    print('${MaterialApp$reflection().field(element.name)!.documentCommentOfEn}');
  }
}