import 'package:equatable/equatable.dart';

class Movies extends Equatable
{
  final int id;
  final String title;
  final String backdopPath;
  final String overveiw;
  final List<int>gnderIds;
  final double voitAvg;
  final String releaseDate;

  const Movies({
    required this.id,
    required this.title,
    required this.backdopPath,
    required this.gnderIds,
    required this.overveiw,
    required this.voitAvg,
    required this.releaseDate
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,overveiw,gnderIds,voitAvg,backdopPath,releaseDate];



// @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Movies &&
  //         runtimeType == other.runtimeType&&
  //         id==other.id&&
  // title==other.title&&
  // overveiw==other.overveiw&&
  // backdopPath==other.backdopPath&&
  // voitAvg==other.voitAvg&&
  // gnderIds==other.gnderIds
  //
  // ;
  //
  // @override
  // int get hashCode =>
  // id.hashCode ^
  // title.hashCode ^
  // overveiw.hashCode ^
  // backdopPath.hashCode ^
  // voitAvg .hashCode ^
  // gnderIds.hashCode
  // ;
}
// اذا خزنت نفس القيم ب refernce مختبقه حيعطيني hachcode لكل refernce /ختبف عن التاني وهاش مشكله عشان احلها يا اما بعمل eqwtable بايدي يا امها بستخدم backge جاهزه