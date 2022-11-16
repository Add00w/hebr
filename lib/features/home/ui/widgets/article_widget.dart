import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 2,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          foregroundImage:
                              AssetImage('assets/images/new_azure_a.png'),
                          radius: 14,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Wrap(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Abdullahi Addow',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  children: [
                                    const TextSpan(text: ' . '),
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
                    const SizedBox(height: 10),
                    Text(
                      '7 Money Making Side Projects You Can Do As A Developer You Can Do As A Developer You Can Do As A Developer.',
                      maxLines: 3,
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
                margin: const EdgeInsets.only(left: 15),
                color: Theme.of(context).colorScheme.onBackground,
                width: 100,
                height: 100,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Read more .',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.green),
              ),
              const SizedBox(width: 10),
              Chip(
                label: Text(
                  'Programming',
                  style: Theme.of(context).textTheme.caption,
                ),
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.only(
                  right: 8,
                  left: 8,
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
                icon: const Icon(Icons.bookmark_add_outlined),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.comment),
                      const SizedBox(width: 5),
                      Text(
                        '5',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      const Icon(Icons.thumb_up),
                      const SizedBox(width: 5),
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
