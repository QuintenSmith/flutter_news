// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:news_repository/news_repository.dart' hide Source;
// import 'package:news_repository/news_repository.dart' as news_repository;
//
// part 'source.g.dart';
//
// @JsonSerializable()
// class Source extends Equatable {
//   const Source({
//     required this.id,
//     required this.name,
//   });
//
//   factory Source.fromJson(Map<String, dynamic> json) =>
//       _$SourceFromJson(json);
//
//   factory Source.fromRepository(news_repository.Source source) {
//     return Source(
//       id: source.id,
//       name: source.name,
//     );
//   }
//
//   final String? id;
//   final String? name;
//
//   @override
//   List<Object?> get props => [id, name,];
//
//   Map<String, dynamic> toJson() => _$SourceToJson(this);
//
//   Source copyWith({
//     String? id,
//     String? name,
//   }) {
//     return Source(
//       id: id ?? this.id,
//       name: name ?? this.name,
//     );
//   }
// }