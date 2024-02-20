import 'package:movies_app/Movies/domain/entities/movies_recommendation.dart';

class RecommendationModel extends MoviesRecommendation
{
 const  RecommendationModel({
   required super.backdropPath,
   required super.id});

 factory RecommendationModel.fromJason(Map<String,dynamic>jason)
 {
   return RecommendationModel(
       backdropPath: jason['backdrop_path']??'/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
       id: jason['id']);
 }


}