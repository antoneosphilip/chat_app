import 'package:json_annotation/json_annotation.dart';

part 'search_friend_model.g.dart';

@JsonSerializable()
class SearchFriendModel {
  final String? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? image;
  final String? isOnline;
  final String? friendShipId;
  final String? requestId;
  final String? createdAt;

  SearchFriendModel(
      {this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.image,
      this.isOnline,
      this.friendShipId,
      this.requestId,
      this.createdAt});

  factory SearchFriendModel.fromJson(Map<String, dynamic> json) =>
      _$SearchFriendModelFromJson(json);
}
