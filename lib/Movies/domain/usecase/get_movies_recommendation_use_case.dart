import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/Movies/domain/entities/movies_recommendation.dart';
import 'package:movies_app/Movies/domain/repository/base_repository_movies.dart';
import 'package:movies_app/core/base_usecase/base_usecase.dart';
import 'package:movies_app/core/exception_error/failuer.dart';

class GetMoviesRecommendationUseCase extends BaseUseCase<List<MoviesRecommendation>,MoviesRecommendationParameter>
{
  final baseRepositoryMoives repositoryMoives ;
  GetMoviesRecommendationUseCase(this.repositoryMoives);

  @override
  Future<Either<Failure, List<MoviesRecommendation>>> call(MoviesRecommendationParameter parameter)async {
    return await repositoryMoives.getMoviesRecommendation(parameter);
  }

}
class MoviesRecommendationParameter extends Equatable
{
  final int movieId;
  const MoviesRecommendationParameter({required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];

}