import 'package:flutter/material.dart';
import 'package:hebr/ui/pages/settings_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            PopupMenuButton(
              icon: Icon(Icons.more_horiz),
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
                const PopupMenuItem(
                  child: ListTile(
                    title: Text('Edit your profile'),
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ));
                    },
                    title: Text('Settings'),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 100,
                ),
                Text(
                  'Addow',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 14),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('1 Following'),
                ),
                Text('0 Followers')
              ],
            ),
            //dark
            //border: Border.all(color: Colors.grey.shade700)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .color!
                          .withOpacity(0.1))),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Write your firts story',
                      style: Theme.of(context).textTheme.headline6),
                  Text('We\'d love to hear what you\'re thinking',
                      style: Theme.of(context).textTheme.bodyText1),
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
                                  borderRadius: BorderRadius.circular(20))))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
