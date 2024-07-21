// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_friend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchFriendModel _$SearchFriendModelFromJson(Map<String, dynamic> json) =>
    SearchFriendModel(
      id: json['id'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      isOnline: json['isOnline'] as String?,
      friendShipId: json['friendShipId'] as String?,
      requestId: json['requestId'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$SearchFriendModelToJson(SearchFriendModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'image': instance.image,
      'isOnline': instance.isOnline,
      'friendShipId': instance.friendShipId,
      'requestId': instance.requestId,
      'createdAt': instance.createdAt,
    };
