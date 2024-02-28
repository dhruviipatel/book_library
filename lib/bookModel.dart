// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  Work work;
  dynamic loggedEdition;
  String loggedDate;

  BookModel({
    required this.work,
    required this.loggedEdition,
    required this.loggedDate,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        work: Work.fromJson(json["work"]),
        loggedEdition: json["logged_edition"] ?? '',
        loggedDate: json["logged_date"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "work": work.toJson(),
        "logged_edition": loggedEdition,
        "logged_date": loggedDate,
      };
}

class Work {
  String title;
  String key;
  List<String> authorKeys;
  List<String> authorNames;
  int firstPublishYear;
  dynamic lendingEditionS;
  List<String> editionKey;
  int coverId;
  String coverEditionKey;

  Work({
    required this.title,
    required this.key,
    required this.authorKeys,
    required this.authorNames,
    required this.firstPublishYear,
    required this.lendingEditionS,
    required this.editionKey,
    required this.coverId,
    required this.coverEditionKey,
  });

  factory Work.fromJson(Map<String, dynamic> json) => Work(
        title: json["title"],
        key: json["key"],
        authorKeys: List<String>.from(json["author_keys"].map((x) => x)),
        authorNames: List<String>.from(json["author_names"].map((x) => x)),
        firstPublishYear: json["first_publish_year"] ?? 0,
        lendingEditionS: json["lending_edition_s"] ?? '',
        editionKey: List<String>.from(json["edition_key"].map((x) => x)),
        coverId: json["cover_id"],
        coverEditionKey: json["cover_edition_key"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "key": key,
        "author_keys": List<dynamic>.from(authorKeys.map((x) => x)),
        "author_names": List<dynamic>.from(authorNames.map((x) => x)),
        "first_publish_year": firstPublishYear,
        "lending_edition_s": lendingEditionS,
        "edition_key": List<dynamic>.from(editionKey.map((x) => x)),
        "cover_id": coverId,
        "cover_edition_key": coverEditionKey,
      };
}
