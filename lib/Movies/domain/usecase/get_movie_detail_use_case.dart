import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/Movies/domain/entities/movies_detail.dart';
import 'package:movies_app/Movies/domain/repository/base_repository_movies.dart';
import 'package:movies_app/core/base_usecase/base_usecase.dart';
import 'package:movies_app/core/exception_error/failuer.dart';

class GetMoviesDetailUseCase extends BaseUseCase<MoviesDetail,MovieDetailParameter>
{
  final baseRepositoryMoives repositoryMoives ;
  GetMoviesDetailUseCase(this.repositoryMoives);
  @override
  Future<Either<Failure, MoviesDetail>> call( MovieDetailParameter movieDetailParameter )async {

    return await repositoryMoives.getMovieDetail(movieDetailParameter);
  }

}
class MovieDetailParameter extends Equatable
{
  final int movieId;
  const MovieDetailParameter({required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}