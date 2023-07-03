import 'package:flutter/material.dart';
import 'package:flutter_application_2/New/news_user.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../home_page.dart';
import 'new_list.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.mode_edit_outline_outlined,
          color: Colors.white,
        ),
      ),
      body: Stack(children: [
        Container(
          width: _w,
          height: _h * 1 / 7.5,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 121, 23, 1),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '    KIDS\nONLINEs',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'QueulatUni',
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Trường mầm non Họa Mi',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SFPRODISPLAYBOLD',
                        fontSize: 15,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        mySheet(context);
                      },
                      icon: SvgPicture.asset('assets/images/PhoneCall.svg'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  BackButton(
                    color: Colors.deepOrangeAccent,
                  ),
                  Container(
                    child: Text(
                      'Tin tức',
                      style: TextStyle(
                          fontFamily: 'SFPRODISPLAYBOLD', fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listNew.length,
                  itemBuilder: (context, index) => NewsDay(
                    news: listNew[index],
                    press: () => Get.to(
                        NewsUser(
                          news: listNew[index],
                        ),
                        transition: Transition.rightToLeft),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class NewsDay extends StatelessWidget {
  const NewsDay({
    super.key,
    required this.news,
    required this.press,
  });
  final News news;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    bool isLiked = false;
    int likeCount = 12;
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.2),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
            ),
            child: ListTile(
              leading: news.vip == 1
                  ? Icon(Icons.school_rounded)
                  : Icon(Icons.person),
              title: Opacity(
                  opacity: 0.5,
                  child: Text(
                    news.name,
                    style: TextStyle(fontSize: 15),
                  )),
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15),
            ),
          ),
          news.vip == 0
              ? NewsParents(news: news, isLiked: isLiked, likeCount: likeCount)
              : NewsSchool(news: news, isLiked: isLiked, likeCount: likeCount),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}

class NewsSchool extends StatelessWidget {
  const NewsSchool({
    super.key,
    required this.news,
    required this.isLiked,
    required this.likeCount,
  });

  final News news;
  final bool isLiked;
  final int likeCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 0.2),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(news.iteamImages),
        ),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(children: [
                        Icon(
                          Icons.star_rounded,
                          size: 20,
                          color: Colors.amber,
                        ),
                        Text('Quan trọng',
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: 'SFPRODISPLAYBOLD',
                                color: Colors.white)),
                      ])),
                  SizedBox(
                    width: 5,
                  ),
                  Opacity(
                      opacity: 0.5,
                      child: Text(
                        news.time,
                        style: TextStyle(
                            fontFamily: 'SFPRODISPLAYBOLD', fontSize: 13),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Text(news.captions,
                      style: TextStyle(
                          fontFamily: 'SFPRODISPLAYBOLD', fontSize: 15))),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  LikeButton(
                    size: 20,
                    isLiked: isLiked,
                    likeCount: likeCount,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  LikeButton(
                    size: 20,
                    isLiked: isLiked,
                    likeCount: likeCount,
                    likeBuilder: (isLiked) {
                      if (isLiked)
                        return Icon(
                          Icons.message_outlined,
                          size: 20,
                          color: Colors.red,
                        );
                      if (!isLiked)
                        return Icon(
                          Icons.message_rounded,
                          size: 20,
                          color: Colors.grey,
                        );
                    },
                  )
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class NewsParents extends StatelessWidget {
  const NewsParents({
    super.key,
    required this.news,
    required this.isLiked,
    required this.likeCount,
  });

  final News news;
  final bool isLiked;
  final int likeCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 0.2),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(news.iteamImages),
              ),
              SizedBox(
                width: 2,
              ),
              ClipRRect(
                child: Image.asset(news.iteamImages),
              ),
              SizedBox(
                width: 2,
              ),
              ClipRRect(
                child: Image.asset(news.iteamImages),
              ),
              SizedBox(
                width: 2,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(news.iteamImages),
              ),
              SizedBox(
                width: 2,
              ),
            ]),
          ),
          SizedBox(
            height: 5,
          ),
          Opacity(
            opacity: 0.5,
            child: Text(
              news.time,
              style: TextStyle(fontFamily: 'SFPRODISPLAYBOLD', fontSize: 13),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            news.captions,
            style: TextStyle(fontFamily: 'SFPRODISPLAYBOLD', fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Row(children: [
            LikeButton(
              size: 20,
              isLiked: isLiked,
              likeCount: likeCount,
            ),
            SizedBox(
              width: 10,
            ),
            LikeButton(
              size: 20,
              isLiked: isLiked,
              likeCount: likeCount,
              likeBuilder: (isLiked) {
                if (isLiked)
                  return Icon(
                    Icons.message_outlined,
                    size: 20,
                    color: Colors.red,
                  );
                if (!isLiked)
                  return Icon(
                    Icons.message_rounded,
                    size: 20,
                    color: Colors.grey,
                  );
              },
            )
          ])
        ],
      ),
    );
  }
}
