@GlobalQuantifyCapability(r'\.Column$', _reflector)
import 'package:reflectable/reflectable.dart';

import 'package:flutter/material.dart';

import '../../impl.dart';

const _reflector = WidgetIntrospect();

extension ColumnOptions on Column {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(Column, _reflector);
}
