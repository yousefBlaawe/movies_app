import 'package:movies_app/core/network/error_model.dart';

class  ServerExceptionModel implements Exception
{
  final errorModel model;
  ServerExceptionModel({required this.model});
}
class  LocalDBException implements Exception
{
  final String errorMessage;
  LocalDBException({required this.errorMessage});
}