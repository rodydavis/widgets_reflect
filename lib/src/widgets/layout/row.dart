@GlobalQuantifyCapability(r'\.Row$', _reflector)
import 'package:reflectable/reflectable.dart';

import 'package:flutter/material.dart';

import '../../impl.dart';

const _reflector = WidgetIntrospect();

extension RowOptions on Row {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(Row, _reflector);
}
