import 'package:flutter/material.dart';

import '../widgets/article_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  static const _followingTopics = [
    'Programming',
    'Science',
    'Data science',
    'Machine learning'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Following',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Badge(
                        // badgeColor: Colors.green,
                        // position: BadgePosition.topEnd(top: 0, end: 0),
                        // showBadge: false,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.notifications_none,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    itemCount: _followingTopics.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Chip(
                          padding: EdgeInsets.zero,
                          label: Text(
                            _followingTopics[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 4),
                myDivider(),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'TOP STORIES',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Flexible(
                  child: ListView.separated(
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) => const ArticleWidget(),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Divider myDivider() => const Divider(thickness: 1);
}
