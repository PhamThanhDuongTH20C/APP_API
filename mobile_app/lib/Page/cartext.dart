// ignore_for_file: must_be_immutable, sort_constructors_first, unnecessary_new

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import '../model/Post.dart';
import '../model/Post_service.dart';
import 'detail.dart';

class Cartext extends StatefulWidget {
  Cartext({this.wppost});
  Post wppost;

  @override
  State<Cartext> createState() => _CarscreenState();
}

class _CarscreenState extends State<Cartext>
    with AutomaticKeepAliveClientMixin {
  final scrollController = ScrollController();
  Post _detail = Post();

  @override
  void initState() {
    _detail = widget.wppost;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Detail(
                        post: _detail,
                        onTap: _incrementCounter,
                      )));
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  FutureBuilder(
                      future: getUrlImage(widget
                          .wppost.link.wpFeaturedmedia[0].href
                          .toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          _detail.setUrlHinh = snapshot.data.toString();
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(12, 15, 15, 15),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, progress) => Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                              imageUrl: snapshot.data.toString(),
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          _detail.setUrlHinh =
                              'https://media.istockphoto.com/id/1357365823/vector/default-image-icon-vector-missing-picture-page-for-website-design-or-mobile-app-no-photo.jpg?s=612x612&w=0&k=20&c=PM_optEhHBTZkuJQLlCjLz-v3zzxp-1mpNQZsdjrbns=';
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, progress) => Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                              imageUrl: _detail.urlHinh,
                            ),
                          );
                        }
                        return const SizedBox(
                          width: 150,
                          height: 150,
                        );
                      }),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: const [
                          Text(
                            'Like ',
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            child: Icon(Icons.favorite,
                                size: 28,
                                color: (_detail.changeColor)
                                    ? Colors.red
                                    : Colors.blue),
                            onTap: () {
                              print('Home---${_detail.changeColor}');
                            
                              _incrementCounter(_detail);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 1, 0, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          parse(_detail.excerpt.toString())
                              .documentElement
                              .text,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          formatdate(
                            _detail.date.toString(),
                          ),
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void _incrementCounter(Post post) {
    setState(() {
      if (post.changeColor == true) {
        _detail = post.copyWith(changeColor: !post.changeColor);
      } else {
        _detail = post.copyWith(changeColor: !post.changeColor);
      }
    });
  }

  static String formatdate(dynamic datetime) {
    final format = DateFormat('dd-MM-yyyy hh:mm');
    return format.format(DateTime.parse(datetime));
  }

  @override
  bool get wantKeepAlive => true;
}
