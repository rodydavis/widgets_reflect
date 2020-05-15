import 'package:flutter/gestures.dart';
@GlobalQuantifyCapability(r'\.Scaffold$', _reflector)
import 'package:reflectable/reflectable.dart';

import 'package:flutter/material.dart';
import 'package:widgets_reflect/main.dart';

import '../accept.dart';
import '../impl.dart';
import '../utils.dart';
import 'dynamic.dart';

const _reflector = WidgetIntrospect();

extension ScaffoldOptions on Scaffold {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(Scaffold, _reflector);
}

class ScaffoldWidget extends DynamicWidget {
  ScaffoldWidget(this.data);

  @override
  Map<String, dynamic> data;

  static const widgetKey = 'key';
  static const bodyKey = 'body';
  static const appBarKey = 'appBar';
  static const floatingActionButtonKey = 'floatingActionButton';
  static const floatingActionButtonLocationKey = 'floatingActionButtonLocation';
  static const floatingActionButtonAnimatorKey = 'floatingActionButtonAnimator';
  static const persistentFooterButtonsKey = 'persistentFooterButtons';
  static const drawerKey = 'drawer';
  static const endDrawerKey = 'endDrawer';
  static const bottomNavigationBarKey = 'bottomNavigationBar';
  static const bottomSheetKey = 'bottomSheet';
  static const backgroundColorKey = 'backgroundColor';
  static const resizeToAvoidBottomPaddingKey = 'resizeToAvoidBottomPadding';
  static const resizeToAvoidBottomInsetKey = 'resizeToAvoidBottomInset';
  static const primaryKey = 'primary';
  static const drawerDragStartBehaviorKey = 'drawerDragStartBehavior';
  static const extendBodyKey = 'extendBody';
  static const extendBodyBehindAppBarKey = 'extendBodyBehindAppBar';
  static const drawerScrimColorKey = 'drawerScrimColor';
  static const drawerEdgeDragWidthKey = 'drawerEdgeDragWidth';
  static const drawerEnableOpenDragGestureKey = 'drawerEnableOpenDragGesture';
  static const endDrawerEnableOpenDragGestureKey =
      'endDrawerEnableOpenDragGesture';

  @override
  Widget render(DynamicContext context) {
    final key = getKey(params[widgetKey], UniqueKey());
    final body = CustomRenderWidget.getWidget(
      context,
      bodyKey,
      params,
    );
    final appBar = CustomRenderWidget.getPreferredSizeWidget(
      context,
      appBarKey,
      params,
    );
    final floatingActionButton =
        CustomRenderWidget.getWidgetType<FloatingActionButton>(
      context,
      floatingActionButtonKey,
      params,
    );
    final floatingActionButtonLocation = getFabLocation(
      params[floatingActionButtonLocationKey],
    );
    final persistentFooterButtons = CustomRenderWidget.getChildren(
      context,
      persistentFooterButtonsKey,
      params,
    );
    final drawer = CustomRenderWidget.getWidget(
      context,
      drawerKey,
      params,
    );
    final endDrawer = CustomRenderWidget.getWidget(
      context,
      endDrawerKey,
      params,
    );
    final bottomNavigationBar = CustomRenderWidget.getPreferredSizeWidget(
      context,
      bottomNavigationBarKey,
      params,
    );
    final bottomSheet = CustomRenderWidget.getWidget(
      context,
      bottomSheetKey,
      params,
    );
    final backgroundColor = getColor(params[backgroundColorKey]);
    final resizeToAvoidBottomPadding =
        getBool(params[resizeToAvoidBottomPaddingKey]);
    final resizeToAvoidBottomInset =
        getBool(params[resizeToAvoidBottomInsetKey]);
    final primary = getBool(params[primaryKey], true);
    final drawerDragStartBehavior = getEnum<DragStartBehavior>(
      params[drawerDragStartBehaviorKey],
      values: DragStartBehavior.values,
      fallback: DragStartBehavior.start,
    );
    final extendBody = getBool(params[extendBodyKey], false);
    final extendBodyBehindAppBar =
        getBool(params[extendBodyBehindAppBarKey], false);
    final drawerScrimColor = getColor(params[drawerScrimColorKey]);
    final drawerEdgeDragWidth = getDouble(params[drawerEdgeDragWidthKey]);
    final drawerEnableOpenDragGesture =
        getBool(params[drawerEnableOpenDragGestureKey], true);
    final endDrawerEnableOpenDragGesture =
        getBool(params[endDrawerEnableOpenDragGestureKey], true);
    final _appBarSize = appBar is PreferredSizeWidget
        ? appBar.preferredSize
        : Size.fromHeight(kToolbarHeight);
    final _bottomNavigationBar = bottomNavigationBar is PreferredSizeWidget
        ? bottomNavigationBar.preferredSize
        : Size.fromHeight(kToolbarHeight);
    return Scaffold(
      key: key,
      persistentFooterButtons:
          persistentFooterButtons.isEmpty ? null : persistentFooterButtons,
      drawer: drawer,
      endDrawer: endDrawer,
      bottomNavigationBar: bottomNavigationBar == null && !context.isDragging
          ? null
          : PreferredSize(
              preferredSize: _bottomNavigationBar,
              child: WidgetAccept(
                scope: context,
                id: id,
                size: _bottomNavigationBar,
                onAccept: (_, val) {
                  data['params'][appBarKey] = val;
                  context.onUpdate(id, data);
                },
                child: bottomNavigationBar,
              ),
            ),
      bottomSheet: bottomSheet,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: primary,
      drawerDragStartBehavior: drawerDragStartBehavior,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
      appBar: PreferredSize(
        preferredSize:
            appBar == null && !context.isDragging ? Size.zero : _appBarSize,
        child: WidgetAccept(
          scope: context,
          id: id,
          size: _appBarSize,
          onAccept: (_, val) {
            data['params'][appBarKey] = val;
            context.onUpdate(id, data);
          },
          child: appBar,
        ),
      ),
      floatingActionButton: WidgetAccept(
        child: floatingActionButton,
        size: const Size(50, 50),
        scope: context,
        id: id,
        onAccept: (_, val) {
          data['params'][floatingActionButtonKey] = val;
          context.onUpdate(id, data);
        },
      ),
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: WidgetAccept(
        scope: context,
        id: id,
        onAccept: (_, val) {
          data['params'][bodyKey] = val;
          context.onUpdate(id, data);
        },
        child: body,
      ),
    );
  }
}
