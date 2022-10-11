import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 2),
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
                margin: const EdgeInsets.only(left: 15),
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
                  children: const [
                    TextSpan(text: '   .'),
                  ],
                ),
              ),
              const SizedBox(width: 10),
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
