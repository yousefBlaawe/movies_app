import 'package:equatable/equatable.dart';
import 'package:movies_app/Movies/domain/entities/movies_detail.dart';
import 'package:movies_app/Movies/domain/entities/movies_recommendation.dart';
import 'package:movies_app/core/utils/enums.dart';

import '../../domain/entities/geners_movies.dart';

class MovieDetailState extends Equatable
{
  final MoviesDetail moviesDetail;
  final RequestState movieDetailRequestState;
  final String movieDetailMessage;
  final List<MoviesRecommendation> moviesRecommendation;
  final String recommendationMessage;
  final RequestState recommendationRequestState;


  const MovieDetailState( {
    this.moviesRecommendation=const[],
    this.recommendationMessage='',
    this.recommendationRequestState=RequestState.Loading,
    this .moviesDetail= const MoviesDetail(
      backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
      geners: [
        Genres(name: 'Family', id: 10751),
      ],
      id: 438148,
      overview:
      "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
      releasDate: "2022-06-29",
      runTime: 87,
      title: "Minions: The Rise of Gru",
      voteAVG: 7.8,
    ),
    this.movieDetailMessage='',
    this.movieDetailRequestState = RequestState.Loading,
});

  MovieDetailState copyWith({
     List<MoviesRecommendation>? moviesRecommendation,
     String? recommendationMessage,
     RequestState? recommendationRequestState,
     MoviesDetail? moviesDetail,
     RequestState? movieDetailRequestState,
     String? movieDetailMessage,
})
{
  return  MovieDetailState(
    movieDetailMessage: movieDetailMessage??this.movieDetailMessage,
    movieDetailRequestState: movieDetailRequestState ?? this.movieDetailRequestState,
    moviesDetail: moviesDetail ?? this.moviesDetail,
    moviesRecommendation: moviesRecommendation ?? this.moviesRecommendation,
    recommendationMessage: recommendationMessage??this.recommendationMessage,
    recommendationRequestState: recommendationRequestState??this.recommendationRequestState,
  );
}

  @override
  // TODO: implement props
  List<Object?> get props => [movieDetailRequestState, moviesDetail ,movieDetailMessage,moviesRecommendation,recommendationRequestState,recommendationMessage ];

}