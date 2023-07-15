import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reflection_factory/reflection_factory.dart';

part 'reflection_factory_bridge_example.reflection.g.dart';

@ReflectionBridge([GetMaterialApp])
class ReflectionBridge1 {}

main() {
  List<ParameterReflection>? fields = GetMaterialApp$reflection().constructor('')!.allParameters;
  for (var element in fields) {
    print('${element.rawTypeName} ${element.name}${element.defaultValue != null ? ' = ${element.defaultValue.toString()}' : ''}');
  }
}