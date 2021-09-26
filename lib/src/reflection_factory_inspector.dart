import 'dart:io';

import 'package:path/path.dart' as pack_path;

class ReflectionInspector {
  final Directory rootDirectory;
  final bool includeTestFiles;

  final String rootDirectoryName;

  late final List<File> dartFiles;

  late final List<File> generatedDartFiles;

  ReflectionInspector(this.rootDirectory, {this.includeTestFiles = false})
      : rootDirectoryName = _getDirName(rootDirectory) {
    _listFiles();
  }

  static String _getDirName(Directory dir) {
    var dirParts = pack_path.split(dir.path);
    return dirParts.last;
  }

  void _listFiles() {
    var files = _listDartFiles();

    var generatedFiles =
        files.where((f) => f.path.endsWith('.reflection.g.dart')).toList();
    files.removeWhere((f) => generatedFiles.contains(f));

    dartFiles = List<File>.unmodifiable(_toFilesList(files));
    generatedDartFiles = List<File>.unmodifiable(_toFilesList(generatedFiles));
  }

  List<FileSystemEntity> _listDartFiles() {
    var list = rootDirectory.listSync(recursive: true, followLinks: false);

    var files = list.where((f) {
      var fPath = f.path;
      if (!fPath.endsWith('.dart')) return false;

      var fParts = pack_path.split(fPath);
      if (fParts.contains('.dart_tool')) return false;

      fParts.removeLast();
      if (fParts.where((d) => d.startsWith('.')).isNotEmpty) return false;

      if (!includeTestFiles) {
        var rootIdx = fParts.lastIndexOf(rootDirectoryName);
        var dir = rootIdx >= 0 && rootIdx + 1 < fParts.length
            ? fParts[rootIdx + 1]
            : '';
        if (dir == 'test') {
          return false;
        }
      }

      return true;
    }).toList();

    return files;
  }

  List<File> _toFilesList(List<FileSystemEntity> files) =>
      files.map((e) => File(e.path).absolute).toList();

  List<String>? _dartFilesPaths;

  List<String> get dartFilesPaths => _dartFilesPaths ??=
      List<String>.unmodifiable(dartFiles.map((f) => f.path).toList());

  List<String>? _generatedDartFilesPaths;

  List<String> get generatedDartFilesPaths => _generatedDartFilesPaths ??=
      List<String>.unmodifiable(generatedDartFiles.map((f) => f.path).toList());

  List<File>? _dartFilesUsingReflection;

  List<File> get dartFilesUsingReflection =>
      _dartFilesUsingReflection ??= List<File>.unmodifiable(
          dartFiles.where(_dartFileUsesReflection).toList());

  bool _dartFileUsesReflection(File e) {
    var data = e.readAsStringSync();
    var usesReflection = data.contains('@EnableReflection(') ||
        data.contains('@ReflectionBridge(');
    return usesReflection;
  }

  List<File>? _dartFilesWithGeneratedReflection;

  List<File> get dartFilesWithGeneratedReflection =>
      _dartFilesWithGeneratedReflection ??= List<File>.unmodifiable(dartFiles
          .where((f) =>
              generatedDartFilesPaths.contains(f.toReflectionDartFile()?.path))
          .toList());

  List<File>? _dartFilesMissingGeneratedReflection;

  List<File> get dartFilesMissingGeneratedReflection =>
      _dartFilesMissingGeneratedReflection ??= List<File>.unmodifiable(
          dartFilesUsingReflection
              .where((f) => !generatedDartFilesPaths
                  .contains(f.toReflectionDartFile()?.path))
              .toList());

  List<File>? _dartFilesWithExpiredReflection;

  List<File> get dartFilesWithExpiredReflection =>
      _dartFilesWithExpiredReflection ??= dartFilesUsingReflection.where((f) {
        var f2 = f.toReflectionDartFile()!;
        if (generatedDartFilesPaths.contains(f2.path)) {
          var fTime = f.lastModifiedSync();
          var fTime2 = f2.lastModifiedSync();
          return fTime.millisecondsSinceEpoch > fTime2.millisecondsSinceEpoch;
        }
        return false;
      }).toList();

  @override
  String toString() {
    return 'ReflectionInspector{\n'
        '  rootDirectory: $rootDirectory,\n'
        '  dartFiles:\n    - ${dartFiles.join('\n    - ')}\n'
        '  generatedDartFiles:\n    - ${generatedDartFiles.join('\n    - ')}\n'
        '  dartFilesUsingReflection:\n    - ${dartFilesUsingReflection.join('\n    - ')}\n'
        '  dartFilesWithGeneratedReflection:\n    - ${dartFilesWithGeneratedReflection.join('\n    - ')}\n'
        '  dartFilesMissingGeneratedReflection:\n    - ${dartFilesMissingGeneratedReflection.join('\n    - ')}\n'
        '}';
  }
}

extension _FileExtension on File {
  bool get isDartFile => path.endsWith('.dart');

  bool get isReflectionDartFile => path.endsWith('.reflection.g.dart');

  static final RegExp _regExpDartExtension = RegExp(r'\.dart$');

  File? toReflectionDartFile() {
    if (!isDartFile) return null;
    if (isReflectionDartFile) return this;

    var parts = pack_path.split(path);
    var fileName = parts.removeLast();

    var fileName2 =
        fileName.replaceFirst(_regExpDartExtension, '.reflection.g.dart');
    parts.add(fileName2);

    return File(pack_path.joinAll(parts));
  }
}
