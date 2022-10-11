import 'package:flutter_quill/flutter_quill.dart';
// import 'package:zefyr/zefyr.dart';

abstract class ArticlesRepository {
  Future<QuillController> loadDocument();
  Future<void> saveDocument(var document);
}
