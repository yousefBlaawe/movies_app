import 'package:movies_app/Movies/domain/entities/geners_movies.dart';

class GenresModel extends Genres
{
  GenresModel({
    required super.id,
    required super.name});
  factory GenresModel.fromJason(Map<String,dynamic>jason)
  {
    return GenresModel(
        id: jason['id'],
        name: jason['name']);
  }


}
