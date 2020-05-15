@GlobalQuantifyCapability(r'\.Material$', _reflector)
import 'package:reflectable/reflectable.dart';

import 'package:flutter/material.dart';

import '../accept.dart';
import '../impl.dart';
import '../utils.dart';
import 'color.dart';
import 'dynamic.dart';
import 'text.dart';

const _reflector = WidgetIntrospect();

extension MaterialOptions on Material {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(Material, _reflector);
}

class MaterialWidget extends DynamicWidget {
  MaterialWidget(this.data);

  @override
  Map<String, dynamic> data;

  static const widgetKey = 'key';
  static const childKey = 'child';
  static const typeKey = 'type';
  static const elevationKey = 'elevation ';
  static const colorKey = 'color';
  static const shadowColorKey = 'shadowColor';
  static const textStyleKey = 'textStyle';
  static const borderRadiusKey = 'borderRadius';
  static const shapeKey = 'shape';
  static const borderOnForegroundKey = 'borderOnForeground';
  static const clipBehaviorKey = 'clipBehavior';
  static const animationDurationKey = 'animationDuration';

  @override
  Widget render(DynamicContext context) {
    final key = getKey(params[widgetKey], UniqueKey());
    final child = CustomRenderWidget.getWidget(
      context,
      childKey,
      params,
    );
    final type = getEnum<MaterialType>(
      params[typeKey],
      values: MaterialType.values,
      fallback: MaterialType.canvas,
    );
    final elevation = getDouble(params[elevationKey], 0.0);
    final color = getColor(params[colorKey]);
    final shadowColor =
        getColor(params[shadowColorKey], const Color(0xFF000000));
    final textStyle = getTextStyle(params[textStyleKey]);
    final borderRadius = getBorderRadiusGeometry(params[borderRadiusKey]);
    final shape = getShapeBorder(params[shapeKey]);
    final borderOnForeground = getBool(params[borderOnForegroundKey], true);
    final clipBehavior = getEnum<Clip>(
      params[clipBehaviorKey],
      values: Clip.values,
      fallback: Clip.none,
    );
    final animationDuration =
        getDuration(params[animationDurationKey], kThemeChangeDuration);

    return Material(
      key: key,
      type: type,
      elevation: elevation,
      color: color,
      shadowColor: shadowColor,
      textStyle: textStyle,
      borderRadius: borderRadius,
      shape: shape,
      borderOnForeground: borderOnForeground,
      clipBehavior: clipBehavior,
      animationDuration: animationDuration,
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
