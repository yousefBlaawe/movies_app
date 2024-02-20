import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/domain/entities/movies.dart';
import 'package:movies_app/Movies/domain/repository/base_repository_movies.dart';
import 'package:movies_app/core/base_usecase/base_usecase.dart';

import '../../../core/exception_error/failuer.dart';

class  getTopRatedMoviesUseCase extends BaseUseCase<List<Movies>,NoParameters >
{
  final baseRepositoryMoives repositoryMoives;
  getTopRatedMoviesUseCase(this.repositoryMoives);

  @override
  Future<Either<Failure,List<Movies>>>call(NoParameters noParameters)async
  {
    return await repositoryMoives.getTopRated();
  }

}