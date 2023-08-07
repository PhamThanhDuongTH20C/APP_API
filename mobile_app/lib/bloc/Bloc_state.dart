part of 'Bloc.dart';

abstract class DetailNativeState extends Equatable {
  const DetailNativeState();

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}

class DetailNativeInitial extends DetailNativeState {
  @override
  List<Object> get props => [];
}

class DetailNativeOpenByWebview extends DetailNativeState {
  const DetailNativeOpenByWebview();

  @override
  List<Object> get props => [];
}

class DoiMauFavorityState extends DetailNativeState {
  const DoiMauFavorityState({this.post});
  final Post post;
}

class GetAllPostLoading extends DetailNativeState {
  const GetAllPostLoading();
}

class GetAllPostSuccess extends DetailNativeState {
  const GetAllPostSuccess({this.listPost});
  final List<Post> listPost;
}

class LoadMorePostSuccess extends DetailNativeState {
  LoadMorePostSuccess({this.listPost});
  final List<Post> listPost;
  final DateTime time = DateTime.now();

  @override
  List<Object> get props => [time];
}

class DetailNativeSuccess extends DetailNativeState {
  const DetailNativeSuccess();

  @override
  List<Object> get props => [];
}
