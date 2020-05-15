@GlobalQuantifyCapability(r'\.Icon$', _reflector)
@GlobalQuantifyCapability(r'\.IconData$', _reflector2)
@GlobalQuantifyCapability(r'\.IconButton$', _reflector3)
@GlobalQuantifyCapability(r'\.IconThemeData$', _reflector4)
import 'package:reflectable/reflectable.dart';

import 'package:flutter/material.dart';

import '../accept.dart';
import '../impl.dart';
import '../utils.dart';
import 'color.dart';
import 'dynamic.dart';

const _reflector = WidgetIntrospect();
const _reflector2 = WidgetIntrospect();
const _reflector3 = WidgetIntrospect();
const _reflector4 = WidgetIntrospect();

extension IconOptions on Icon {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(Icon, _reflector);
}

extension IconDataOptions on IconData {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(IconData, _reflector2);
}

extension IconButtonOptions on IconButton {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(IconButton, _reflector3);
}

extension IconThemeDataOptions on IconThemeData {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(IconThemeData, _reflector3);
}

IconThemeData getIconThemeData(Map<String, dynamic> params,
    [IconThemeData fallback]) {
  if (params == null) return fallback;
  final opacity = getDouble(params['opacity']);
  final size = getDouble(params['size']);
  final color = getColor(params['color']);
  return IconThemeData(
    opacity: opacity,
    size: size,
    color: color,
  );
}

Map<String, dynamic> setIconData(IconData value) {
  return {
    'name': 'IconData',
    'params': {
      '0': value.codePoint,
      if (value?.fontFamily != null) 'fontFamily': value?.fontFamily,
      if (value?.fontPackage != null) 'fontPackage': value?.fontPackage,
      if (value?.matchTextDirection != null)
        'matchTextDirection': value?.matchTextDirection,
    },
  };
}

IconData getIconData(Map<String, dynamic> data, [IconData fallback]) {
  if (data == null) return fallback;
  final name = data['name'];
  if (name == 'IconData') {
    final params = data['params'];
    int codePoint;
    if (params['0'] != null) {
      codePoint = getInt(params['0']);
    }
    final _icon = Icons.info;
    String fontFamily = _icon.fontFamily;
    String fontPackage = _icon.fontPackage;
    bool matchTextDirection = _icon.matchTextDirection;
    if (params['fontFamily'] != null) {
      fontFamily = getString(params['fontFamily'], fontFamily);
    }
    if (params['fontPackage'] != null) {
      fontPackage = getString(params['fontPackage'], fontPackage);
    }
    if (params['matchTextDirection'] != null) {
      matchTextDirection =
          getBool(params['matchTextDirection'], matchTextDirection);
    }
    return IconData(
      codePoint ?? fallback?.codePoint,
      fontFamily: fontFamily ?? fallback?.fontFamily,
      fontPackage: fontPackage ?? fallback?.fontPackage,
      matchTextDirection: matchTextDirection ?? fallback?.matchTextDirection,
    );
  }
  return fallback;
}

class IconWidget extends DynamicWidget {
  IconWidget(this.data);

  @override
  Map<String, dynamic> data;

  @override
  String get name => params['name'];

  static const widgetKey = 'key';
  static const dataKey = '0';
  static const sizeKey = 'size';
  static const colorKey = 'color';
  static const semanticLabelKey = 'semanticLabel';
  static const textDirectionKey = 'textDirection';

  @override
  Widget render(DynamicContext context) {
    final key = getKey(params[widgetKey], UniqueKey());
    final icon = getIconData(params[dataKey], Icons.info);
    final size = getDouble(params[sizeKey]);
    final color = getColor(params[colorKey]);
    final semanticLabel = getString(params[semanticLabelKey]);
    final textDirection = getEnum<TextDirection>(
      params[textDirectionKey],
      values: TextDirection.values,
    );
    return Icon(
      icon,
      key: key,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}

class IconButtonWidget extends DynamicWidget {
  IconButtonWidget(this.data);

  @override
  Map<String, dynamic> data;

  static const widgetKey = 'key';
  static const iconKey = 'icon';
  static const onPressedKey = 'onPressed';
  static const iconSizeKey = 'iconSize';
  static const visualDensityKey = 'visualDensity';
  static const paddingKey = 'padding';
  static const alignmentKey = 'alignment';
  static const splashRadiusKey = 'splashRadius';
  static const colorKey = 'color';
  static const focusColorKey = 'focusColor';
  static const hoverColorKey = 'hoverColor';
  static const highlightColorKey = 'highlightColor';
  static const splashColorKey = 'splashColor';
  static const disabledColorKey = 'disabledColor';
  static const focusNodeKey = 'focusNode';
  static const autofocusKey = 'autofocus';
  static const enableFeedbackKey = 'enableFeedback';
  static const tooltipKey = 'tooltip';
  static const constraintsKey = 'constraints';

  @override
  Widget render(DynamicContext context) {
    final key = getKey(params[widgetKey], UniqueKey());
    final icon = CustomRenderWidget.getWidget(context, iconKey, params);
    final onPressed = getFunction(context.context, params[onPressedKey]);
    final iconSize = getDouble(params[iconSizeKey], 24.0);
    final visualDensity = getEnum<VisualDensity>(
      params[visualDensityKey],
      values: [
        VisualDensity.adaptivePlatformDensity,
        VisualDensity.comfortable,
        VisualDensity.compact,
        VisualDensity.standard,
      ],
    );
    final padding = getEdgeInsets(params[paddingKey], EdgeInsets.all(8));
    final alignment = getAlignment(params[alignmentKey]);
    final splashRadius = getDouble(params[splashRadiusKey]);
    final color = getColor(params[colorKey]);
    final focusColor = getColor(params[focusColorKey]);
    final hoverColor = getColor(params[hoverColorKey]);
    final highlightColor = getColor(params[highlightColorKey]);
    final splashColor = getColor(params[splashColorKey]);
    final disabledColor = getColor(params[disabledColorKey]);
    final focusNode = getFocusNode(params[focusNodeKey]);
    final autofocus = getBool(params[autofocusKey], false);
    final enableFeedback = getBool(params[enableFeedbackKey], true);
    final tooltip = getString(params[tooltipKey]);
    final constraints = getBoxConstraints(params[constraintsKey]);
    return IconButton(
      key: key,
      constraints: constraints,
      tooltip: tooltip,
      autofocus: autofocus,
      enableFeedback: enableFeedback,
      focusNode: focusNode,
      splashRadius: splashRadius,
      padding: padding,
      alignment: alignment,
      onPressed: onPressed,
      iconSize: iconSize,
      visualDensity: visualDensity,
      color: color,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      disabledColor: disabledColor,
      icon: WidgetAccept(
        child: icon,
        scope: context,
        id: id,
        onAccept: (_, val) {
          data['params'][iconKey] = val;
          context.onUpdate(id, data);
        },
      ),
    );
  }
}
