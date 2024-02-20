import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/data/datasource/remote_movies_data_source.dart';
import 'package:movies_app/Movies/data/model/modle_movies.dart';
import 'package:movies_app/Movies/domain/entities/movies.dart';
import 'package:movies_app/Movies/domain/entities/movies_detail.dart';
import 'package:movies_app/Movies/domain/entities/movies_recommendation.dart';
import 'package:movies_app/Movies/domain/repository/base_repository_movies.dart';
import 'package:movies_app/Movies/domain/usecase/get_movie_detail_use_case.dart';
import 'package:movies_app/Movies/domain/usecase/get_movies_recommendation_use_case.dart';
import 'package:movies_app/core/exception_error/failuer.dart';
import 'package:movies_app/core/exception_error/exseptions.dart';

class MoviesRepository extends baseRepositoryMoives
{
  final baseRemoteMoviesDataSource repositoryMoives ;
  MoviesRepository( this.repositoryMoives);

  @override
  Future<Either<Failure,List<Movies>>> getNowPlaying() async{
    final results= await repositoryMoives.getNowPlayingMovies();
   try
       {
         return Right(results );
       }on ServerExceptionModel catch(failure)
    {
      return left(ServerFailure(failure.model.statusMessage));
    }

  }

  @override
  Future<Either<Failure,List<Movies>>> getPopular() async{
    final results = await repositoryMoives.getPopularMovies();
    try
        {
          return Right(results );
        } on ServerExceptionModel catch(failure)
    {
      return Left(ServerFailure(failure.model.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movies>>> getTopRated() async{
    final results=await  repositoryMoives.getTopRatedMovies();
    try
        {
          return Right(results);
        }on ServerExceptionModel catch(failure)
    {
      return Left(ServerFailure(failure.model.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesDetail>> getMovieDetail(MovieDetailParameter movieDetailParameter)async {

    final results=await  repositoryMoives.getMovieDetail(movieDetailParameter);
    try
    {
      return Right(results);
    }on ServerExceptionModel catch(failure)
    {
      return Left(ServerFailure(failure.model.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesRecommendation>>> getMoviesRecommendation(MoviesRecommendationParameter moviesRecommendationParameter)async {
    final results=await  repositoryMoives.getRecommendationMovies(moviesRecommendationParameter);
    try
    {
      return Right(results);
    }on ServerExceptionModel catch(failure)
    {
      return Left(ServerFailure(failure.model.statusMessage));
    }
  }

}