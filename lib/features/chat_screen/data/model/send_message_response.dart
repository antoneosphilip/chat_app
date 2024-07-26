import 'package:json_annotation/json_annotation.dart';
part 'send_message_model.g.dart';
@JsonSerializable()
class SendMessageModel {
 final String msg;
 final String id;
 final String createdAt;
 final int statusCode;

  SendMessageModel({this.msg, this.id, this.createdAt, this.statusCode});

  factory SendMessageModel.fromJson(Map<String,dynamic> json)=>_$SendMessageModelFromJson(json);
}