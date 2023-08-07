part of 'Bloc.dart';

abstract class DetailNativeEvent extends Equatable {
  const DetailNativeEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounter extends DetailNativeEvent {}

class LoadMorePostEvent extends DetailNativeEvent {
  const LoadMorePostEvent({this.page, this.post});
  final int page;
  final Post post;
}

class GetAllPostsEvent extends DetailNativeEvent {}

class IncreaseLoveFavorityEvent extends DetailNativeEvent {
  const IncreaseLoveFavorityEvent({this.post});
  final Post post;
}

class GetDetailNativeEvent extends DetailNativeEvent {
  const GetDetailNativeEvent();
}
