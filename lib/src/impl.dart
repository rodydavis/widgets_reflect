import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reflectable/reflectable.dart';
import 'package:shortid/shortid.dart';
import 'package:widgets_reflect/widgets_reflect.dart';

import 'widgets/dynamic.dart';

class WidgetIntrospect extends Reflectable {
  const WidgetIntrospect()
      : super(invokingCapability, declarationsCapability, typeCapability,
            reflectedTypeCapability);
}

List<ObjectMirror> createObjects(
    List<Object> objs, WidgetIntrospect reflector) {
  final _mirrors = <ObjectMirror>[];
  objs.forEach((element) {
    ObjectMirror mirror = reflector.reflect(element);
    _mirrors.add(mirror);
  });
  return _mirrors;
}

List<ParameterMirror> getConstructorOptions(
    Type type, WidgetIntrospect reflector) {
  ClassMirror mirror = reflector.reflectType(type);

  final constructors = List.from(mirror.declarations.values.where((declare) {
    return declare is MethodMirror && declare.isConstructor;
  }));
  final _options = <ParameterMirror>[];
  constructors.forEach((constructor) {
    if (constructor is MethodMirror) {
      final parameters = constructor.parameters;
      parameters.forEach((param) {
        _options.add(param);
      });
    }
  });
  return _options;
}

class CustomParam extends ParameterMirror {
  CustomParam({
    @required this.defaultValue,
    @required this.isOptional,
    @required this.reflectedType,
    @required this.simpleName,
    this.dynamicReflectedType,
    this.hasDefaultValue,
    this.hasDynamicReflectedType,
    this.hasReflectedType,
    this.isConst,
    this.isFinal,
    this.isNamed,
    this.isPrivate,
    this.isStatic,
    this.isTopLevel,
    this.location,
    this.metadata,
    this.owner,
    this.qualifiedName,
    this.type,
  });

  @override
  final Object defaultValue;

  @override
  final Type dynamicReflectedType;

  @override
  final bool hasDefaultValue;

  @override
  final bool hasDynamicReflectedType;

  @override
  final bool hasReflectedType;

  @override
  final bool isConst;

  @override
  final bool isFinal;

  @override
  final bool isNamed;

  @override
  final bool isOptional;

  @override
  final bool isPrivate;

  @override
  final bool isStatic;

  @override
  final bool isTopLevel;

  @override
  final SourceLocation location;

  @override
  final List<Object> metadata;

  @override
  final DeclarationMirror owner;

  @override
  final String qualifiedName;

  @override
  final Type reflectedType;

  @override
  final String simpleName;

  @override
  final TypeMirror type;
}

class DynamicContext {
  final BuildContext context;
  final bool isDragging;
  final void Function(String id, Map<String, dynamic> val) onUpdate;
  final void Function(String) onTap;
  final Set<String> tokens;
  Widget Function(BuildContext, Widget) wrapTapBuilder;

  DynamicContext({
    @required this.context,
    @required this.isDragging,
    @required this.onUpdate,
    @required this.onTap,
    @required this.wrapTapBuilder,
    this.tokens,
  });

  DynamicContext copyWith({
    BuildContext context,
    bool isDragging,
    void Function(Map<String, dynamic> val) onUpdate,
    void Function(String) onTap,
    Set<String> tokens,
  }) {
    return DynamicContext(
      context: context ?? this.context,
      isDragging: isDragging ?? this.isDragging,
      onUpdate: onUpdate ?? this.onUpdate,
      onTap: onTap ?? this.onTap,
      tokens: tokens ?? this.tokens,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DynamicContext &&
        o.context == context &&
        o.isDragging == isDragging &&
        o.onUpdate == onUpdate &&
        o.onTap == onTap &&
        setEquals(o.tokens, tokens);
  }

  @override
  int get hashCode {
    return context.hashCode ^
        isDragging.hashCode ^
        onUpdate.hashCode ^
        onTap.hashCode ^
        tokens.hashCode;
  }
}

abstract class CustomRenderWidget {
  static Widget getWidget(
    DynamicContext context,
    String key,
    Map<String, dynamic> params,
  ) {
    Widget child;
    if (params != null && params.containsKey(key)) {
      final _name = params[key]['name'];
      final _obj = DynamicWidget.getWidget(params[key], name: _name);
      if (_obj == null) return child;
      child = _obj.render(context);
      // child = DynamicWidget.tappable(context, _obj, child);
    }
    return child;
  }

  static T getWidgetType<T>(
    DynamicContext context,
    String key,
    Map<String, dynamic> params, {
    Size size,
  }) {
    T child;
    if (params != null && params.containsKey(key)) {
      final _name = params[key]['name'];
      final _obj = DynamicWidget.getWidget(params[key], name: _name);
      if (_obj == null) return child;
      child = _obj.render(context) as T;
    }
    return child;
  }

  static PreferredSizeWidget getPreferredSizeWidget(
    DynamicContext context,
    String key,
    Map<String, dynamic> params, {
    double height = 0,
    double width = 0,
  }) {
    PreferredSizeWidget child;
    if (params != null && params.containsKey(key)) {
      final _name = params[key]['name'];
      final _obj = DynamicWidget.getWidget(params[key], name: _name);
      if (_obj == null) return child;
      child = _obj.render(context);
      // child = DynamicWidget.tappable(context, _obj, child);
      var size = Size(width, height);
      if (child is PreferredSizeWidget) {
        size = child.preferredSize;
      }
      child = PreferredSize(
        preferredSize: size,
        child: child,
      );
    }
    return child;
  }

  static List<Widget> getChildren(
    DynamicContext context,
    String key,
    Map<String, dynamic> params, {
    Size size,
    bool tappable = true,
  }) {
    final children = <Widget>[];
    // if (params != null && params.containsKey(key)) {
    //   final _items = List.from(params[key]);
    //   for (final item in _items) {
    //     final _widget = getWidget(
    //       context,
    //       item['name'],
    //       item,
    //       size: size,
    //       tappable: tappable,
    //     );
    //     if (_widget != null) {
    //       children.add(_widget);
    //     }
    //   }
    // }
    return children;
  }

  static String get newId => WidgetsReflect.newId;
  Map<String, dynamic> get data;
  set data(Map<String, dynamic> val) {
    if (val['id'] == null) {
      val['id'] = newId;
    }
    if (val['params'] == null) {
      val['params'] = {};
    }
  }

  static void clone(Map<String, dynamic> data, Map<String, dynamic> val,
      DynamicContext context) {
    final _id = data['id'];
    data['params'] = val['params'];
    data['name'] = val['name'];
    context.onUpdate(_id, json.decode(json.encode(data)));
  }

  String get name =>
      data != null && data.containsKey('name') ? data['name'] : null;
  String get id => data != null && data.containsKey('id') ? data['id'] : null;
  Map<String, dynamic> get params => data['params'];
  Widget render(DynamicContext context);

  // void updateParam(DynamicContext context, String key, dynamic val) {
  //   if (id == null) {
  //     data['id'] = CustomRenderWidget.newId;
  //     context.onUpdate(id, data);
  //   }
  //   if (params == null) {
  //     data['params'] = {};
  //     context.onUpdate(id, data);
  //   }
  //   data['params'][key] = val;
  //   context.onUpdate(id, data);
  // }

  void debugPrintTree() {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(data);
    print(prettyprint);
  }
}

// class TappableWidget extends StatelessWidget {
//   const TappableWidget({
//     Key key,
//     @required this.scope,
//     @required this.id,
//     @required this.child,
//   }) : super(key: key);

//   final DynamicContext scope;
//   final String id;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (id == null) return;
//         scope.onTap(id);
//       },
//       child: child,
//     );
//   }
// }
