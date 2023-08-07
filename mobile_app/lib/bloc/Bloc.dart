import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/Post.dart';
import '../model/Post_service.dart';
part 'Bloc_event.dart';
part 'Bloc_state.dart';

class DetailNativeBloc extends Bloc<DetailNativeEvent, DetailNativeState> {
  DetailNativeBloc() : super(DetailNativeInitial());
  List<Post> _list = [];
  @override
  Stream<DetailNativeState> mapEventToState(DetailNativeEvent event) async* {
    if (event is GetDetailNativeEvent) {
      yield const DetailNativeSuccess();
    }
    if (event is GetAllPostsEvent) {
      yield const GetAllPostLoading();
      final dynamic result = await Postservice.fetchPosts(1);
      if (result is List<Post>) {
        _list = result;
        yield GetAllPostSuccess(listPost: _list);
      }
    }
    if (event is LoadMorePostEvent) {
      final dynamic result = await Postservice.fetchPosts(event.page);
      if (result is List<Post>) {
        yield LoadMorePostSuccess(listPost: result);
      }
    }
    if (event is IncreaseLoveFavorityEvent) {
      final Post post = event.post.copyWith(
        changeColor: !event.post.changeColor,
      );
      yield DoiMauFavorityState(post: post);
    }
  }
}
