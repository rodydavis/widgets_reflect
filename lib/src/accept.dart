import 'package:flutter/material.dart';
import 'package:widgets_reflect/widgets_reflect.dart';

import 'widgets/dynamic.dart';

class WidgetAccept extends StatefulWidget {
  final void Function(BuildContext context, dynamic data) onAccept;
  final Widget child;
  final Size size;
  final String id;
  final DynamicContext scope;

  const WidgetAccept({
    Key key,
    @required this.scope,
    @required this.id,
    @required this.onAccept,
    this.child,
    this.size,
  }) : super(key: key);

  @override
  _WidgetAcceptState createState() => _WidgetAcceptState();
}

class _WidgetAcceptState extends State<WidgetAccept> {
  bool _accepting = false;

  @override
  void didUpdateWidget(WidgetAccept oldWidget) {
    if (widget.id != oldWidget.id) {
      if (mounted) setState(() {});
    }
    if (widget.scope != oldWidget.scope) {
      if (mounted) setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child != null) {
      return widget.child;
    }
    if (!widget.scope.isDragging) {
      return SizedBox.fromSize(
        size: widget.size,
        child: Container(),
      );
    }
    return SizedBox.fromSize(
      size: widget.size,
      child: DragTarget<DynamicWidget>(
        onAccept: (val) {
          if (mounted) {
            setState(() {
              _accepting = false;
            });
          }
          if (val?.data != null) {
            widget.onAccept(context, val.data);
          }
        },
        onLeave: (val) {
          if (mounted) {
            setState(() {
              _accepting = false;
            });
          }
        },
        onWillAccept: (val) {
          if (mounted) {
            setState(() {
              _accepting = true;
            });
          }
          return _accepting;
        },
        builder: (context, accepted, rejected) {
          return Center(
            child: Container(
              width: widget?.size?.width,
              height: widget?.size?.height,
              child: Placeholder(
                color:
                    !_accepting ? Colors.grey : Theme.of(context).accentColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
