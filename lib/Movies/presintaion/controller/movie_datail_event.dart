import 'package:equatable/equatable.dart';

abstract class MovieDetailEvent extends Equatable{
  MovieDetailEvent();
}
class GetMovieDetailEvent extends MovieDetailEvent
{
  final int id;
  GetMovieDetailEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}
class GetMovieRecommendationEvent extends MovieDetailEvent
{
  final int id;
  GetMovieRecommendationEvent(this.id);
  @override
  // TODO: implement props
  List<Object?> get props => [id];

}