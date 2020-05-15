@GlobalQuantifyCapability(r'\.Stack$', _reflector)
import 'package:reflectable/reflectable.dart';

import 'package:flutter/material.dart';

import '../../impl.dart';

const _reflector = WidgetIntrospect();

extension StackOptions on Stack {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(Stack, _reflector);
}
