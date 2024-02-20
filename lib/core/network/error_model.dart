import 'package:equatable/equatable.dart';

class errorModel extends Equatable
{
  final int statusCode;
  final String statusMessage;
  final bool success;
 const errorModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,

});
  factory errorModel.fromJason(Map<String,dynamic>jason)
  {
    return errorModel(
        statusCode: jason['status_code'],
        statusMessage:jason['status_message'],
        success: jason ['success']);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>[statusCode,statusMessage,success];

}