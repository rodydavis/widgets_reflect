@GlobalQuantifyCapability(r'\.Container$', _reflector)
import 'package:reflectable/reflectable.dart';

import 'package:flutter/material.dart';

import '../accept.dart';
import '../impl.dart';
import '../utils.dart';
import 'color.dart';
import 'dynamic.dart';

const _reflector = WidgetIntrospect();

extension ContainerOptions on Container {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(Container, _reflector);
}

class ContainerWidget extends DynamicWidget {
  ContainerWidget(this.data);

  @override
  Map<String, dynamic> data;

  static const widgetKey = 'key';
  static const childKey = 'child';
  static const alignmentKey = 'alignment';
  static const paddingKey = 'padding';
  static const colorKey = 'color';
  static const decorationKey = 'decoration';
  static const foregroundDecorationKey = 'foregroundDecoration';
  static const widthKey = 'width';
  static const heightKey = 'height';
  static const constraintsKey = 'constraints';
  static const marginKey = 'margin';
  static const transformKey = 'transform';
  static const clipBehaviorKey = 'clipBehavior';

  @override
  Widget render(DynamicContext context) {
    final key = getKey(params[widgetKey], UniqueKey());
    final child = CustomRenderWidget.getWidget(
      context,
      childKey,
      params,
    );
    final alignment = getAlignment(params[alignmentKey]);
    final padding = getEdgeInsets(params[paddingKey]);
    final color = getColor(params[colorKey]);
    final decoration = getDecoration(params[decorationKey]);
    final foregroundDecoration = getDecoration(params[foregroundDecorationKey]);
    final width = getDouble(params[widthKey]);
    final height = getDouble(params[heightKey]);
    final constraints = getBoxConstraints(params[constraintsKey]);
    final margin = getEdgeInsets(params[marginKey]);
    final transform = getMatrix4(params[transformKey]);
    final clipBehavior = getEnum<Clip>(params[clipBehaviorKey],
        values: Clip.values, fallback: Clip.none);
    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      clipBehavior: clipBehavior,
      child: WidgetAccept(
        child: child,
        size: const Size(double.infinity, double.infinity),
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
