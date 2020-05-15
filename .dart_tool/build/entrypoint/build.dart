// ignore_for_file: directives_ordering

import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:built_value_generator/builder.dart' as _i2;
import 'package:reflectable/reflectable_builder.dart' as _i3;
import 'package:build_config/build_config.dart' as _i4;
import 'package:source_gen/builder.dart' as _i5;
import 'dart:isolate' as _i6;
import 'package:build_runner/build_runner.dart' as _i7;
import 'dart:io' as _i8;

final _builders = <_i1.BuilderApplication>[
  _i1.apply('built_value_generator:built_value', [_i2.builtValue],
      _i1.toDependentsOf('built_value_generator'),
      hideOutput: true, appliesBuilders: ['source_gen:combining_builder']),
  _i1.apply('reflectable:reflectable', [_i3.reflectableBuilder], _i1.toRoot(),
      hideOutput: false,
      defaultGenerateFor: const _i4.InputSet(include: [
        'benchmark/**.dart',
        'bin/**.dart',
        'example/**.dart',
        'lib/main.dart',
        'test/**.dart',
        'tool/**.dart',
        'web/**.dart'
      ], exclude: [
        'lib/**.dart'
      ])),
  _i1.apply('source_gen:combining_builder', [_i5.combiningBuilder],
      _i1.toNoneByDefault(),
      hideOutput: false, appliesBuilders: ['source_gen:part_cleanup']),
  _i1.applyPostProcess('source_gen:part_cleanup', _i5.partCleanup,
      defaultGenerateFor: const _i4.InputSet())
];
void main(List<String> args, [_i6.SendPort sendPort]) async {
  var result = await _i7.run(args, _builders);
  sendPort?.send(result);
  _i8.exitCode = result;
}
