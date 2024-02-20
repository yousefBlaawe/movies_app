import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable
{
  const MoviesEvent();
  @override
  List<Object> get props =>[];
}

class GetNowPlayingMovies extends MoviesEvent{}
class GetPopularMovies extends MoviesEvent{}
class GetTopRatedMovies extends MoviesEvent{}