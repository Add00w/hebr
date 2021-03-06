import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:hebr/repositories/articles_repository.dart';
// import 'package:notus/src/document.dart';
// import 'package:quill_delta/quill_delta.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  @override
  Future<QuillController> loadDocument() async {
    try {
      final result = await rootBundle.loadString('assets/sample_data.json');
      final doc = Document.fromJson(jsonDecode(result));
      return QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    } catch (error) {
      final doc = Document()..insert(0, '');
      return QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    }
  }

  @override
  Future<void> saveDocument(var document) async {
    // Notus documents can be easily serialized to JSON by passing to
    // `jsonEncode` directly:
    final contents = jsonEncode(document);
    // For this example we save our document to a temporary file.
    final file = File(Directory.systemTemp.path + '/quick_start.json');
    // And show a snack bar on success.
    await file.writeAsString(contents);
    // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Saved.')));
  }
}
