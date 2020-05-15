@GlobalQuantifyCapability(r'\.Flex$', _reflector)
import 'package:reflectable/reflectable.dart';

import 'package:flutter/material.dart';

import '../../impl.dart';

const _reflector = WidgetIntrospect();

extension FlexOptions on Flex {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(Flex, _reflector);
}
