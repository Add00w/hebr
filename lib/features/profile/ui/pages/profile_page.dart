import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/bloc/form_submission_status.dart';
import '../../../../common/ui/pages/authenticated_pages.dart';
import '../../../auth/bloc/auth_cubit.dart';
import '../../../auth/bloc/login_cubit.dart';
import '../../../auth/repositories/auth_repository.dart';
import '../../../auth/ui/widgets/circular_loading_widget.dart';
import '../../../settings/ui/pages/settings_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthCubit>().state;
    return AuthenticatedPages(
      page: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PopupMenuButton(
                icon: const Icon(Icons.more_horiz),
                padding: EdgeInsets.zero,
                color: Theme.of(context).colorScheme.surface,
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text('Stories'),
                    ),
                  ),
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text('Stats'),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {},
                    child: const ListTile(
                      title: Text('Edit your profile'),
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      onTap: () async {
                        await Navigator.maybePop(context);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ));
                      },
                      title: const Text('Settings'),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 100,
                  ),
                  Text(
                    user?.displayName ?? user?.email ?? 'Addow',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 14),
                  ),
                  const Spacer(),
                  RepositoryProvider(
                    create: (context) => AuthRepository(),
                    child: BlocProvider<LoginCubit>(
                      create: (context) => LoginCubit(
                        authRepo: context.read<AuthRepository>(),
                      ),
                      child: BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, loginController) =>
                            loginController.status is FormSubmitting
                                ? const CircularLoadingWidget()
                                : IconButton(
                                    onPressed: () {
                                      context.read<LoginCubit>().logout();
                                    },
                                    icon: const Icon(Icons.logout),
                                  ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('1 Following'),
                  ),
                  Text('0 Followers')
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .color!
                        .withOpacity(0.1),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Write your firts story',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      'We\'d love to hear what you\'re thinking',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Start your first story',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green.shade900),
                        side: MaterialStateProperty.all(BorderSide.none),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
