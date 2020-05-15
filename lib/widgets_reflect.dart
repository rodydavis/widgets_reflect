export 'main.dart' hide main;
export 'src/impl.dart';
export 'src/index.dart';
export 'main.reflectable.dart';

import 'package:flutter/material.dart';
import 'package:reflectable/reflectable.dart';
import 'package:shortid/shortid.dart';

import 'main.reflectable.dart';

export 'package:reflectable/reflectable.dart';
export 'src/widgets/dynamic.dart';
export 'src/widgets/color.dart';
export 'src/utils.dart';
export 'src/accept.dart';
export 'src/widgets/icon.dart';

class WidgetsReflect {
  static String get newId => shortid.generate();
  const WidgetsReflect._();
  static const WidgetsReflect instance = WidgetsReflect._();

  void init() {
    initializeReflectable();
  }
}

extension ParamsUtils on List<ParameterMirror> {
  void debug([String name]) {
    for (final param in this) {
      try {
        print('''
Params: $name
Name: ${param.simpleName}
Type: ${param.reflectedType}
Default: ${param.defaultValue}
Optional: ${param.isOptional}

''');
      } catch (e) {
        debugPrint('Error: $e');
      }
    }
  }

  List<ParameterMirror> get distinct {
    final _map = <String, ParameterMirror>{};
    if (this == null) return [];
    for (final param in this) {
      _map[param.simpleName] = param;
    }
    return _map.values.toList();
  }
}
