// @GlobalQuantifyCapability(r'\.FloatingActionButton$', _reflector)
import 'package:reflectable/reflectable.dart';

import 'package:flutter/material.dart';

import '../accept.dart';
import '../impl.dart';
import '../utils.dart';
import 'color.dart';
import 'dynamic.dart';

// const _reflector = WidgetReflect();
// const fabReflector = _reflector;

extension FloatingActionButtonOptions on FloatingActionButton {
  List<ParameterMirror> get constructor {
    return [
      CustomParam(
        simpleName: 'key',
        reflectedType: Key,
        isOptional: true,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'heroTag',
        reflectedType: Key,
        isOptional: true,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'label',
        reflectedType: Widget,
        isOptional: true,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'elevation',
        reflectedType: num,
        isOptional: true,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'isExtended',
        reflectedType: bool,
        isOptional: false,
        defaultValue: false,
      ),
      CustomParam(
        simpleName: 'mini',
        reflectedType: bool,
        isOptional: false,
        defaultValue: false,
      ),
      CustomParam(
        simpleName: 'tooltip',
        reflectedType: String,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'backgroundColor',
        reflectedType: Color,
        isOptional: true,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'foregroundColor',
        reflectedType: Color,
        isOptional: true,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'child',
        reflectedType: Widget,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'icon',
        reflectedType: Widget,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'onPressed',
        reflectedType: VoidCallback,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'tooltip',
        reflectedType: String,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'foregroundColor',
        reflectedType: Color,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'backgroundColor',
        reflectedType: Color,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'focusColor',
        reflectedType: Color,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'hoverColor',
        reflectedType: Color,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'splashColor',
        reflectedType: Color,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'focusElevation',
        reflectedType: double,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'hoverElevation',
        reflectedType: double,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'highlightElevation',
        reflectedType: double,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'disabledElevation',
        reflectedType: double,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'shape',
        reflectedType: ShapeBorder,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'autofocus',
        reflectedType: bool,
        isOptional: false,
        defaultValue: false,
      ),
      CustomParam(
        simpleName: 'materialTapTargetSize',
        reflectedType: MaterialTapTargetSize,
        isOptional: false,
        defaultValue: null,
      ),
      CustomParam(
        simpleName: 'clipBehavior',
        reflectedType: Clip,
        isOptional: false,
        defaultValue: Clip.none,
      ),
      CustomParam(
        simpleName: 'focusNode',
        reflectedType: FocusNode,
        isOptional: false,
        defaultValue: null,
      ),
    ];
  }
}

class FloatingActionButtonWidget extends DynamicWidget {
  FloatingActionButtonWidget(this.data);

  @override
  Map<String, dynamic> data;

  static const widgetKey = 'key';
  static const childKey = 'child';
  static const labelKey = 'label';
  static const iconKey = 'icon';
  static const miniKey = 'mini';
  static const onPressedKey = 'onPressed';
  static const isExtendedKey = 'isExtended';
  static const heroTagKey = 'heroTag';
  static const tooltipKey = 'tooltip';
  static const foregroundColorKey = 'foregroundColor';
  static const backgroundColorKey = 'backgroundColor';
  static const focusColorKey = 'focusColor';
  static const hoverColorKey = 'hoverColor';
  static const splashColorKey = 'splashColor';
  static const elevationKey = 'elevation';
  static const focusElevationKey = 'focusElevation';
  static const hoverElevationKey = 'hoverElevation';
  static const highlightElevationKey = 'highlightElevation';
  static const disabledElevationKey = 'disabledElevation';
  static const shapeKey = 'shape';
  static const autofocusKey = 'autofocus';
  static const materialTapTargetSizeKey = 'materialTapTargetSize';
  static const clipBehaviorKey = 'clipBehavior';
  static const focusNodeKey = 'focusNode';

  @override
  Widget render(DynamicContext context) {
    final child = CustomRenderWidget.getWidget(context, childKey, params);
    final icon = CustomRenderWidget.getWidget(context, iconKey, params);
    final label = CustomRenderWidget.getWidget(context, labelKey, params);
    final onPressed = getFunction(context.context, params[onPressedKey]);
    final mini = getBool(params[miniKey], false);
    final isExtended = getBool(params[isExtendedKey], false);
    final key = getKey(params[widgetKey], UniqueKey());
    final heroTag = getKey(params[heroTagKey], UniqueKey());
    final tooltip = getString(params[tooltipKey]);
    final foregroundColor = getColor(params[foregroundColorKey]);
    final backgroundColor = getColor(params[backgroundColorKey]);
    final focusColor = getColor(params[focusColorKey]);
    final hoverColor = getColor(params[hoverColorKey]);
    final splashColor = getColor(params[splashColorKey]);
    final elevation = getDouble(params[elevationKey]);
    final focusElevation = getDouble(params[focusElevationKey]);
    final hoverElevation = getDouble(params[hoverElevationKey]);
    final highlightElevation = getDouble(params[highlightElevationKey]);
    final disabledElevation = getDouble(params[disabledElevationKey]);
    final shape = getShapeBorder(params[shapeKey]);
    final autofocus = getBool(params[autofocusKey], false);
    final materialTapTargetSize = getEnum<MaterialTapTargetSize>(
      params[materialTapTargetSizeKey],
      values: MaterialTapTargetSize.values,
    );
    final clipBehavior = getEnum<Clip>(
      params[clipBehaviorKey],
      values: Clip.values,
      fallback: Clip.none,
    );
    final focusNode = getFocusNode(params[focusNodeKey]);
    if (isExtended) {
      return FloatingActionButton.extended(
        key: key,
        shape: shape,
        heroTag: heroTag,
        focusNode: focusNode,
        clipBehavior: clipBehavior,
        tooltip: tooltip,
        autofocus: autofocus,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        materialTapTargetSize: materialTapTargetSize,
        focusColor: focusColor,
        hoverColor: hoverColor,
        splashColor: splashColor,
        elevation: elevation,
        focusElevation: focusElevation,
        hoverElevation: hoverElevation,
        highlightElevation: highlightElevation,
        disabledElevation: disabledElevation,
        onPressed: onPressed,
        label: WidgetAccept(
          child: label,
          scope: context,
          id: id,
          onAccept: (_, val) {
            data['params'][labelKey] = val;
            context.onUpdate(id, data);
          },
        ),
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
    return FloatingActionButton(
      key: key,
      shape: shape,
      clipBehavior: clipBehavior,
      heroTag: heroTag,
      autofocus: autofocus,
      focusNode: focusNode,
      tooltip: tooltip,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      materialTapTargetSize: materialTapTargetSize,
      focusColor: focusColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      elevation: elevation,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      highlightElevation: highlightElevation,
      disabledElevation: disabledElevation,
      onPressed: onPressed,
      mini: mini,
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

FloatingActionButtonLocation getFabLocation(dynamic val,
    [FloatingActionButtonLocation fallback]) {
  if (val == null) return fallback;
  final _value = val.toString().replaceAll('#', '');
  switch (_value) {
    case 'FloatingActionButtonLocation.endDocked':
      return FloatingActionButtonLocation.endDocked;
    case 'FloatingActionButtonLocation.endFloat':
      return FloatingActionButtonLocation.endFloat;
    case 'FloatingActionButtonLocation.miniCenterDocked':
      return FloatingActionButtonLocation.miniCenterDocked;
    case 'FloatingActionButtonLocation.miniCenterFloat':
      return FloatingActionButtonLocation.miniCenterFloat;
    case 'FloatingActionButtonLocation.miniCenterTop':
      return FloatingActionButtonLocation.miniCenterTop;
    case 'FloatingActionButtonLocation.miniEndDocked':
      return FloatingActionButtonLocation.miniEndDocked;
    case 'FloatingActionButtonLocation.miniEndFloat':
      return FloatingActionButtonLocation.miniEndFloat;
    case 'FloatingActionButtonLocation.miniEndTop':
      return FloatingActionButtonLocation.miniEndTop;
    case 'FloatingActionButtonLocation.miniStartDocked':
      return FloatingActionButtonLocation.miniStartDocked;
    case 'FloatingActionButtonLocation.miniStartFloat':
      return FloatingActionButtonLocation.miniStartFloat;
    case 'FloatingActionButtonLocation.miniStartTop':
      return FloatingActionButtonLocation.miniStartTop;
    case 'FloatingActionButtonLocation.startDocked':
      return FloatingActionButtonLocation.startDocked;
    case 'FloatingActionButtonLocation.startFloat':
      return FloatingActionButtonLocation.startFloat;
    case 'FloatingActionButtonLocation.startTop':
      return FloatingActionButtonLocation.startTop;
    default:
  }
  return null;
}
