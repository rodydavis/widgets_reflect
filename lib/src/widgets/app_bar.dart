@GlobalQuantifyCapability(r'\.AppBar$', _reflector)
import 'package:reflectable/reflectable.dart';

import 'package:flutter/material.dart';
import 'package:widgets_reflect/main.dart';

import '../accept.dart';
import '../impl.dart';
import '../utils.dart';
import 'dynamic.dart';

const _reflector = WidgetIntrospect();

extension AppBarOptions on AppBar {
  List<ParameterMirror> get constructor {
    return getConstructorOptions(
      AppBar,
      _reflector,
    );
  }
}

class AppBarWidget extends DynamicWidget {
  AppBarWidget(this.data);

  @override
  Map<String, dynamic> data;

  static const widgetKey = 'key';
  static const titleKey = 'title';
  static const leadingKey = 'leading';
  static const elevationKey = 'elevation';
  static const automaticallyImplyLeadingKey = 'automaticallyImplyLeading';
  static const actionsKey = 'actions';
  static const flexibleSpaceKey = 'flexibleSpace';
  static const bottomKey = 'bottom';
  static const toolbarOpacityKey = 'toolbarOpacity';
  static const bottomOpacityKey = 'bottomOpacity';
  static const centerTitleKey = 'centerTitle';
  static const primaryKey = 'primary';
  static const excludeHeaderSemanticsKey = 'excludeHeaderSemantics';
  static const backgroundColorKey = 'backgroundColor';
  static const titleSpacingKey = 'titleSpacing';
  static const brightnessKey = 'brightness';
  static const iconThemeKey = 'iconTheme';
  static const actionsIconThemeKey = 'actionsIconTheme';
  static const textThemeKey = 'textTheme';
  static const shapeKey = 'shape';

  @override
  Widget render(DynamicContext context) {
    final title = CustomRenderWidget.getWidget(
      context,
      titleKey,
      params,
    );
    final leading = CustomRenderWidget.getWidget(
      context,
      leadingKey,
      params,
    );
    final flexibleSpace = CustomRenderWidget.getPreferredSizeWidget(
      context,
      flexibleSpaceKey,
      params,
    );
    final actions = CustomRenderWidget.getChildren(
      context,
      actionsKey,
      params,
    );
    final elevation = getDouble(
      params[elevationKey],
    );
    final toolbarOpacity = getDouble(
      params[toolbarOpacityKey],
      1,
    );
    final bottomOpacity = getDouble(
      params[bottomOpacityKey],
      1,
    );
    final key = getKey(
      params[widgetKey],
      UniqueKey(),
    );
    final automaticallyImplyLeading = getBool(
      params[automaticallyImplyLeadingKey],
      true,
    );
    final centerTitle = getBool(
      params[centerTitleKey],
    );
    final bottom = CustomRenderWidget.getPreferredSizeWidget(
      context,
      bottomKey,
      params,
    );
    final primary = getBool(
      params[primaryKey],
      true,
    );
    final excludeHeaderSemantics = getBool(
      params[excludeHeaderSemanticsKey],
      false,
    );
    final backgroundColor = getColor(
      params[backgroundColorKey],
    );
    final titleSpacing = getDouble(
      params[titleSpacingKey],
      NavigationToolbar.kMiddleSpacing,
    );
    final brightness = getEnum<Brightness>(
      params[brightnessKey],
      values: Brightness.values,
    );
    final iconTheme = getIconThemeData(
      params[iconThemeKey],
    );
    final actionsIconTheme = getIconThemeData(
      params[actionsIconThemeKey],
    );
    final textTheme = getTextTheme(
      params[textThemeKey],
    );
    final shape = getShapeBorder(
      params[shapeKey],
    );
    return AppBar(
      key: key,
      shape: shape,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      primary: primary,
      centerTitle: centerTitle,
      flexibleSpace: flexibleSpace,
      titleSpacing: titleSpacing,
      bottom: bottom,
      actions: actions,
      textTheme: textTheme,
      brightness: brightness,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      excludeHeaderSemantics: excludeHeaderSemantics,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor,
      leading: WidgetAccept(
        size: const Size(35, 35),
        scope: context,
        id: id,
        onAccept: (_, val) {
          data['params'][leadingKey] = val;
          context.onUpdate(id, data);
        },
        child: leading,
      ),
      elevation: elevation,
      title: WidgetAccept(
        size: const Size(100, 35),
        scope: context,
        id: id,
        onAccept: (_, val) {
          data['params'][titleKey] = val;
          context.onUpdate(id, data);
        },
        child: title,
      ),
    );
  }
}
