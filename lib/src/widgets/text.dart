import 'dart:ui';

@GlobalQuantifyCapability(r'\.Text$', _reflector)
@GlobalQuantifyCapability(r'\.TextStyle$', _reflector2)
@GlobalQuantifyCapability(r'\.TextTheme$', _reflector3)
import 'package:reflectable/reflectable.dart';

import 'package:flutter/material.dart';
import '../impl.dart';
import '../utils.dart';
import 'color.dart';
import 'dynamic.dart';

const _reflector = WidgetIntrospect();
const _reflector2 = WidgetIntrospect();
const _reflector3 = WidgetIntrospect();

extension TextOptions on Text {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(Text, _reflector);
}

extension TextStyleOptions on TextStyle {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(TextStyle, _reflector2);
}

extension TextThemeOptions on TextTheme {
  List<ParameterMirror> get constructor =>
      getConstructorOptions(TextTheme, _reflector2);
}

Locale getLocale(Map<String, dynamic> data, [Locale fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  final _languageCode = getString(params['0']);
  final _countryCode = getString(params['1']);
  return Locale(_languageCode, _countryCode);
}

StrutStyle getStrutStyle(Map<String, dynamic> data, [StrutStyle fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  if (params.toString().contains('disabled')) {
    return StrutStyle.disabled;
  }
  final fontFamily = getString(params['fontFamily']);
  final fontFamilyFallback = getList(
    params['fontFamilyFallback'],
    parse: (val) => getString(val),
  );
  final fontSize = getDouble(params['fontSize']);
  final height = getDouble(params['height']);
  final leading = getDouble(params['leading']);
  final fontWeight = getEnum<FontWeight>(
    params['fontWeight'],
    values: FontWeight.values,
  );
  final fontStyle = getEnum<FontStyle>(
    params['fontStyle'],
    values: FontStyle.values,
  );
  final forceStrutHeight = getBool(params['forceStrutHeight']);
  final debugLabel = getString(params['debugLabel']);
  final package = getString(params['package']);
  return StrutStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: fontSize,
    height: height,
    leading: leading,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    forceStrutHeight: forceStrutHeight,
    debugLabel: debugLabel,
    package: package,
  );
}

FontFeature getFontFeature(Map<String, dynamic> data, [FontFeature fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  final _feature = getString(params['0']);
  final _value = getInt(params['1']);
  return FontFeature(_feature, _value);
}

TextTheme getTextTheme(Map<String, dynamic> data, [TextTheme fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  final headline1 = getTextStyle(params['headline1']);
  final headline2 = getTextStyle(params['headline2']);
  final headline3 = getTextStyle(params['headline3']);
  final headline4 = getTextStyle(params['headline4']);
  final headline5 = getTextStyle(params['headline5']);
  final headline6 = getTextStyle(params['headline6']);
  final subtitle1 = getTextStyle(params['subtitle1']);
  final subtitle2 = getTextStyle(params['subtitle2']);
  final bodyText1 = getTextStyle(params['bodyText1']);
  final bodyText2 = getTextStyle(params['bodyText2']);
  final caption = getTextStyle(params['caption']);
  final button = getTextStyle(params['button']);
  final overline = getTextStyle(params['overline']);
  return TextTheme(
    headline1: headline1,
    headline2: headline2,
    headline3: headline3,
    headline4: headline4,
    headline5: headline5,
    headline6: headline6,
    subtitle1: subtitle1,
    subtitle2: subtitle2,
    bodyText1: bodyText1,
    bodyText2: bodyText2,
    caption: caption,
    button: button,
    overline: overline,
  );
}

TextHeightBehavior getTextHeightBehavior(Map<String, dynamic> data,
    [TextHeightBehavior fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  final applyHeightToFirstAscent = getBool(params['applyHeightToFirstAscent']);
  final applyHeightToLastDescent = getBool(params['applyHeightToLastDescent']);
  return TextHeightBehavior(
    applyHeightToFirstAscent: applyHeightToFirstAscent,
    applyHeightToLastDescent: applyHeightToLastDescent,
  );
}

TextStyle getTextStyle(Map<String, dynamic> data, [TextStyle fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  final inherit = getBool(params['inherit'], true);
  final color = getColor(params['color']);
  final backgroundColor = getColor(params['backgroundColor']);
  final fontSize = getDouble(params['fontSize']);
  final fontWeight = getEnum<FontWeight>(
    params['fontWeight'],
    values: FontWeight.values,
  );
  final fontStyle = getEnum<FontStyle>(
    params['fontStyle'],
    values: FontStyle.values,
  );
  final letterSpacing = getDouble(params['letterSpacing']);
  final wordSpacing = getDouble(params['wordSpacing']);
  final textBaseline = getEnum<TextBaseline>(
    params['textBaseline'],
    values: TextBaseline.values,
  );
  final height = getDouble(params['height']);
  final locale = getLocale(params['locale']);
  final foreground = getPaint(params['foreground']);
  final background = getPaint(params['background']);
  final shadows = getList<BoxShadow>(
    params['shadows'],
    parse: (val) => getBoxShadow(val),
  );
  final fontFeatures = getList<FontFeature>(
    params['fontFeatures'],
    parse: (val) => getFontFeature(val),
  );
  final decoration = getEnum<TextDecoration>(
    params['decoration'],
    values: [
      TextDecoration.lineThrough,
      TextDecoration.none,
      TextDecoration.overline,
      TextDecoration.underline,
    ],
  );
  final decorationColor = getColor(params['decorationColor']);
  final decorationStyle = getEnum<TextDecorationStyle>(
    params['decorationStyle'],
    values: TextDecorationStyle.values,
  );
  final decorationThickness = getDouble(params['decorationThickness']);
  final debugLabel = getString(params['debugLabel']);
  final fontFamily = getString(params['fontFamily']);
  final package = getString(params['package']);
  final fontFamilyFallback = getList<String>(
    params['fontFamilyFallback'],
    parse: (val) => getString(val),
  );
  return TextStyle(
    inherit: inherit,
    color: color,
    backgroundColor: backgroundColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    height: height,
    locale: locale,
    foreground: foreground,
    background: background,
    shadows: shadows,
    fontFeatures: fontFeatures,
    decoration: decoration,
    decorationColor: decorationColor,
    decorationStyle: decorationStyle,
    decorationThickness: decorationThickness,
    debugLabel: debugLabel,
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    package: package,
  );
}

class TextWidget extends DynamicWidget {
  TextWidget(this.data);

  @override
  Map<String, dynamic> data;

  @override
  String get name => params['name'];

  static const dataKey = '0';
  static const widgetKey = 'key';
  static const styleKey = 'style';
  static const strutStyleKey = 'strutStyle';
  static const textAlignKey = 'textAlign';
  static const textDirectionKey = 'textDirection';
  static const localeKey = 'locale';
  static const softWrapKey = 'softWrap';
  static const overflowKey = 'overflow';
  static const textScaleFactorKey = 'textScaleFactor';
  static const maxLinesKey = 'maxLines';
  static const semanticsLabelKey = 'semanticsLabel';
  static const textWidthBasisKey = 'textWidthBasis';
  static const textHeightBehaviorKey = 'textHeightBehavior';

  @override
  Widget render(DynamicContext context) {
    final _data = getString(params[dataKey], '');
    final key = getKey(params[widgetKey], UniqueKey());
    final style = getTextStyle(params[styleKey]);
    final strutStyle = getStrutStyle(params[strutStyleKey]);
    final textAlign = getEnum<TextAlign>(
      params[textAlignKey],
      values: TextAlign.values,
    );
    final textDirection = getEnum<TextDirection>(
      params[textDirectionKey],
      values: TextDirection.values,
    );
    final locale = getLocale(params[localeKey]);
    final softWrap = getBool(params[softWrapKey]);
    final overflow = getEnum<TextOverflow>(
      params[overflowKey],
      values: TextOverflow.values,
    );
    final textScaleFactor = getDouble(params[textScaleFactorKey]);
    final maxLines = getInt(params[maxLinesKey]);
    final semanticsLabel = getString(params[semanticsLabelKey]);
    final textWidthBasis = getEnum<TextWidthBasis>(
      params[textWidthBasisKey],
      values: TextWidthBasis.values,
    );
    final textHeightBehavior =
        getTextHeightBehavior(params[textHeightBehaviorKey]);

    return Text(
      _data,
      key: key,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }
}
