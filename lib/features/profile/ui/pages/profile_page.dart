import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/common.dart';
import '../../../auth/auth.dart';
import '../../../settings/settings.dart';
import '../widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthCubit>().state;
    return AuthenticatedPages(
      page: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PopupMenuButton(
                icon: const Icon(Icons.more_horiz, color: Colors.grey),
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
                  BlocProvider<LoginCubit>(
                    create: (context) => LoginCubit(
                      authRepo: context.read<AuthRepository>(),
                    ),
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, loginController) =>
                          loginController.status is FormSubmitting
                              ? const CircularProgressIndicatorWidget()
                              : IconButton(
                                  onPressed: () {
                                    context.read<LoginCubit>().logout();
                                  },
                                  icon: const Icon(Icons.logout),
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
                    const AnimatedStartStoryButton(),
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
