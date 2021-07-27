import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: SafeArea(
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
                                    .primaryVariant),
                            shape: BoxShape.circle),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.notifications_none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  itemCount: _followingTopics.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15, right: 5),
                      child: Chip(
                        label: Text(
                          _followingTopics[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              myDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text('TOP STORIES',
                    style: Theme.of(context).textTheme.headline6),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ArticleWidget(),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Divider myDivider() => Divider(thickness: 1);
}

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 15,
                          width: 15,
                          child: Image.asset('assets/images/new_azure_a.png'),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Wrap(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Abdullahi Addow',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  children: [
                                    TextSpan(text: ' . '),
                                    TextSpan(
                                      text: 'Jul 19',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      '7 Money Making Side Projects You Can Do As A Developer',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(height: 1.3),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                color: Theme.of(context).colorScheme.onBackground,
                width: 100,
                height: 100,
              ),
            ],
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  text: 'Read more',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.green),
                  children: [
                    TextSpan(text: '   .'),
                  ],
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                height: 30,
                child: Chip(
                  label: Text(
                    'Programming',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.bookmark_add_outlined),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.comment),
                      SizedBox(width: 5),
                      Text(
                        '5',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      Icon(Icons.thumb_up),
                      SizedBox(width: 5),
                      Text(
                        '255',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
