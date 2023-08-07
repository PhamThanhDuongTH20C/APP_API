// ignore_for_file: prefer_typing_uninitialized_variables, sort_constructors_first, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import '../model/Post.dart';
import 'Photoview.dart';

class Detail extends StatefulWidget {
  const Detail({
    this.post,
    this.onTap,
  });
  final Post post;
  final Function onTap;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> with AutomaticKeepAliveClientMixin {
  bool ischeck = false;
  @override
  void initState() {
    ischeck = widget.post.changeColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('DetailScreen')),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Photoview(
                            widget.post.urlHinh,
                          )),
                );
              },
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                imageUrl: widget.post.urlHinh,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 4, 10, 2),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatdate2(
                          widget.post.date.toString(),
                        ),
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: const [
                              Text(
                                'Like ',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 17),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                child: Icon(Icons.favorite,
                                    size: 30,
                                    color: ischeck ? Colors.red : Colors.blue),
                                onTap: () {
                                  ///Xu ly luu tt
                                  setState(() {
                                    ischeck = !ischeck;
                                  });
                                  widget.onTap(widget.post);
                                },
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Expanded(
                child: Column(
                  children: [
                    Text(
                      parse(widget.post.excerpt.toString())
                          .documentElement
                          .text,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      parse(widget.post.content.toString())
                          .documentElement
                          .text,
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ))
        ],
      )),
    );
  }

  static String formatdate2(dynamic datetime) {
    final format = DateFormat('dd-MM-yyyy hh:mm');
    return format.format(DateTime.parse(datetime));
  }

  @override
  bool get wantKeepAlive => true;
}
