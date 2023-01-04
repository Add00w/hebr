import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

import '../../../../common/common.dart';
import '../../../home/home.dart';
import '../../bloc/publish_cubit.dart';

class PublishPage extends StatelessWidget {
  const PublishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthenticatedPages(
      page: RepositoryProvider(
        create: (context) => ArticlesRepository(),
        child: BlocProvider<PublishCubit>(
          create: (context) =>
              PublishCubit(context.read<ArticlesRepository>())..loadDocument(),
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BlocBuilder<PublishCubit, PublishState>(
                  builder: (context, state) {
                    return state is AssetsLoaded
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.centerLeft,
                                      onPressed: () {
                                        log('close');
                                        context
                                            .read<BottomNavCubit>()
                                            .changeBottomNavIndex(0);
                                      },
                                      icon: const Icon(Icons.close)),
                                  GestureDetector(
                                    onTap: () {
                                      log('publish');
                                      context.read<PublishCubit>().publish();
                                    },
                                    child: Text(
                                      'Publish',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(color: Colors.green),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Expanded(
                                child: QuillEditor.basic(
                                  controller:
                                      context.read<PublishCubit>().controller!,
                                  readOnly: false, // true for view only mode
                                ),
                              ),
                              QuillToolbar.basic(
                                controller:
                                    context.read<PublishCubit>().controller!,
                              ),
                            ],
                          )
                        : const Text('loading...');
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  //  Widget _buildWelcomeEditor(BuildContext context) {
  //   var quillEditor = QuillEditor(
  //       controller: context.read<PublishCubit>().controller!,
  //       scrollController: ScrollController(),
  //       scrollable: true,
  //       focusNode: context.read<PublishCubit>().focusNode,
  //       autoFocus: false,
  //       readOnly: false,
  //       placeholder: 'Add content',
  //       expands: false,
  //       padding: EdgeInsets.zero,
  //       customStyles: DefaultStyles(
  //         h1: DefaultTextBlockStyle(
  //             const TextStyle(
  //               fontSize: 32,
  //               color: Colors.black,
  //               height: 1.15,
  //               fontWeight: FontWeight.w300,
  //             ),
  //             const Tuple2(16, 0),
  //             const Tuple2(0, 0),
  //             null),
  //         sizeSmall: const TextStyle(fontSize: 9),
  //       ));

  //   var toolbar = QuillToolbar.basic(
  //       controller: _controller!,
  //       onImagePickCallback: (file) async{

  //       },
  //       onVideoPickCallback: (file) async{

  //       },);

  //   return SafeArea(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: <Widget>[
  //         Expanded(
  //           flex: 15,
  //           child: Container(
  //             color: Colors.white,
  //             padding: const EdgeInsets.only(left: 16, right: 16),
  //             child: quillEditor,
  //           ),
  //         ),
  //        Container(child: toolbar)
  //       ],
  //     ),
  //   );
  // }
}
