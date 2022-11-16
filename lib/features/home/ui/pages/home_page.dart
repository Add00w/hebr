import 'package:badges/badges.dart';
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 5, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Following',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Badge(
                    badgeColor: Colors.green,
                    position: BadgePosition.topEnd(top: 0, end: 0),
                    showBadge: false,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer),
                          shape: BoxShape.circle),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.notifications_none,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _followingTopics.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 5),
                    child: Chip(
                      padding: EdgeInsets.zero,
                      labelPadding: const EdgeInsets.only(
                        right: 8,
                        left: 8,
                      ),
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
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              flex: 11,
              child: ListView.separated(
                itemBuilder: (context, index) => const ArticleWidget(),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Divider myDivider() => const Divider(thickness: 1);
}
