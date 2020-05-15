@GlobalQuantifyCapability(r'\.Wrap$', _reflector)
import 'package:reflectable/reflectable.dart';

import 'package:flutter/material.dart';

import '../../impl.dart';

const _reflector = WidgetIntrospect();

extension WrapOptions on Wrap {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(Wrap, _reflector);
}
