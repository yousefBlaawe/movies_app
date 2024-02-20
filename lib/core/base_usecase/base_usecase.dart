import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/exception_error/failuer.dart';

abstract class BaseUseCase<T,Parameter >
{
  Future<Either<Failure,T>>call(Parameter parameter);
}
class NoParameters extends Equatable
{
  NoParameters();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
