import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../home/repositories/articles_repository_impl.dart';

part 'publish_state.dart';

class PublishCubit extends Cubit<PublishState> {
  PublishCubit(this._articlesRepositoryImpl) : super(PublishInitial());
  final ArticlesRepositoryImpl _articlesRepositoryImpl;

  void publish() {
    // debugPrint(controller?.document.toPlainText() ?? 'no text.');
    debugPrint(controller?.plainTextEditingValue.text ?? 'no text.');
  }

  /// Allows to control the editor and the document.
  // late ZefyrController controller;
  QuillController? controller;

  /// Zefyr editor like any other input field requires a focus node.
  late FocusNode focusNode;
  void loadDocument() async {
    controller = await _articlesRepositoryImpl.loadDocument();
    emit(AssetsLoaded());
    // controller = ZefyrController(document);
    // controller = QuillController.basic();
    focusNode = FocusNode();
  }
}
