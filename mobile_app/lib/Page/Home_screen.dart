// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/Bloc.dart';
import '../model/Post.dart';
import '../model/Post_service.dart';
import 'Cartext.dart';

class Home1 extends StatefulWidget {
  const Home1({Key key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

@override
bool get wantKeepAlive => true;

class _Home1State extends State<Home1> with AutomaticKeepAliveClientMixin {
  final scrollController = ScrollController();
  List<Post> postData = [];
  int page = 1;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    Postservice.fetchPosts(1).then((datafromSever) {
      setState(() {
        postData = datafromSever;
      });
    });
    scrollController.addListener(_scrolllistener);
    Postservice.fetchPosts(1);
  }

  void load() {
    print('load');
    setState(() {
      postData.addAll(postData);
      print('data count = ${postData.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(title: const Text('pham.duong / WPNTrainingKit')),
        body: BlocBuilder<DetailNativeBloc, DetailNativeState>(
            builder: (context, state) {
          if (state is GetAllPostLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetAllPostSuccess) {
            postData.addAll(state.listPost);
          }
          if (state is LoadMorePostSuccess) {
            postData.addAll(state.listPost);
          }
          return ListView.builder(
              padding: const EdgeInsets.all(10),
              controller: scrollController,
              itemCount: isLoadingMore ? postData.length + 1 : postData.length,
              itemBuilder: (context, index) {
                // Gan bien hien thi
                final Post wppost = postData[index];
                print('dddd ---> ${wppost.changeColor}');
                if (index == postData.length - 1) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Card(
                  child: Row(
                    children: [
                      Expanded(
                        child: Cartext(
                          wppost: wppost,
                        ),
                      )
                    ],
                  ),
                );
              });
        }));
  }

  Future<void> _scrolllistener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page = page + 1;
      final mangb = await Postservice.fetchPosts(1);
      setState(() {
        postData.addAll(mangb);
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}
