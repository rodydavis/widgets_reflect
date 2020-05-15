@GlobalQuantifyCapability(r'\.Color$', _reflector)
import 'package:reflectable/reflectable.dart';

import 'package:flutter/material.dart';

import '../impl.dart';

const _reflector = WidgetIntrospect();

extension ColorOptions on Color {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(Color, _reflector);
}

Color getColor(dynamic data, [Color fallback]) {
  if (data != null) {
    if (data is Map) {
      if (data['name'] != null) {
        if (data['params'] != null) {
          final _params = data['params'];
          if (_params['0'] != null) {
            final _colorValue = _params['0'].toString();
            return Color(int.tryParse(_colorValue));
          }
        }
      }
    } else if (data is String && data.startsWith('#')) {
      final _colorValue = data
          .toString()
          .replaceAll('#', '')
          .replaceAll('Color(', '')
          .replaceAll(')', '');

      if (_colorValue == 'null') {
        return fallback;
      }
      final _value = int.tryParse(_colorValue.toString());
      return Color(_value);
    }
  }
  return fallback;
}
