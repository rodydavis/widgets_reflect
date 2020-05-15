import 'package:widgets_reflect/main.dart';

import '../impl.dart';
import 'app_bar.dart';
import 'text.dart';

abstract class DynamicWidget extends CustomRenderWidget {
  static DynamicWidget getWidget(Map<String, dynamic> data, {String name}) {
    if (data == null) return null;
    final _name = name ?? data['name'].toString();
    if (_name == null) return null;
    if (_name == 'AppBar' || _name == 'Appbar') {
      return AppBarWidget(data);
    }
    if (_name == 'Text') {
      return TextWidget(data);
    }
    if (_name == 'Center') {
      return CenterWidget(data);
    }
    if (_name == 'Icon') {
      return IconWidget(data);
    }
    if (_name == 'IconButton') {
      return IconButtonWidget(data);
    }
    if (_name == 'FloatingActionButton') {
      return FloatingActionButtonWidget(data);
    }
    if (_name == 'Material') {
      return MaterialWidget(data);
    }
    if (_name == 'Container') {
      return ContainerWidget(data);
    }
    if (_name == 'Scaffold') {
      return ScaffoldWidget(data);
    }
    // if (_name == 'Dynamic') {
    //   return DynamicWidget.getWidget(data);
    // }
    return null;
  }
}
