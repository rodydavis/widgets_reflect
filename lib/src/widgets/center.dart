@GlobalQuantifyCapability(r'\.Center$', _reflector)
import 'package:reflectable/reflectable.dart';

import 'package:flutter/material.dart';
import 'package:widgets_reflect/src/accept.dart';
import 'package:widgets_reflect/src/utils.dart';

import '../impl.dart';
import 'dynamic.dart';

const _reflector = WidgetIntrospect();

extension CenterOptions on Center {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(Center, _reflector);
}

class CenterWidget extends DynamicWidget {
  CenterWidget(this.data);

  @override
  Map<String, dynamic> data;

  static const widgetKey = 'key';
  static const childKey = 'child';
  static const widthFactorKey = 'widthFactor';
  static const heightFactorKey = 'heightFactor';

  @override
  Widget render(DynamicContext context) {
    final key = getKey(params[widgetKey], UniqueKey());
    final child = CustomRenderWidget.getWidget(
      context,
      childKey,
      params,
    );
    final widthFactor = getDouble(params[widthFactorKey]);
    final heightFactor = getDouble(params[heightFactorKey]);
    return Center(
      key: key,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: WidgetAccept(
        child: child,
        scope: context,
        id: id,
        onAccept: (_, val) {
          data['params'][childKey] = val;
          context.onUpdate(id, data);
        },
      ),
    );
  }
}
