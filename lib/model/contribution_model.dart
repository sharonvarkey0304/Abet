import 'dart:convert';

class ContributionDataModel {
  List<ContributionDatum>? contributionData;

  ContributionDataModel({
    this.contributionData,
  });

  factory ContributionDataModel.fromRawJson(String str) =>
      ContributionDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContributionDataModel.fromJson(Map<String, dynamic> json) =>
      ContributionDataModel(
        contributionData: json["contribution_data"] == null
            ? []
            : List<ContributionDatum>.from(json["contribution_data"]!
                .map((x) => ContributionDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "contribution_data": contributionData == null
            ? []
            : List<dynamic>.from(contributionData!.map((x) => x.toJson())),
      };
}

class ContributionDatum {
  String? id;
  String? semesterName;
  List<Semester>? semester;

  ContributionDatum({
    this.id,
    this.semesterName,
    this.semester,
  });

  factory ContributionDatum.fromRawJson(String str) =>
      ContributionDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContributionDatum.fromJson(Map<String, dynamic> json) =>
      ContributionDatum(
        id: json["id"],
        semesterName: json["semester_name"],
        semester: json["semester"] == null
            ? []
            : List<Semester>.from(
                json["semester"]!.map((x) => Semester.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "semester_name": semesterName,
        "semester": semester == null
            ? []
            : List<dynamic>.from(semester!.map((x) => x.toJson())),
      };
}

class Semester {
  String? subjectName;
  List<Subject>? subject;

  Semester({
    this.subjectName,
    this.subject,
  });

  factory Semester.fromRawJson(String str) =>
      Semester.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Semester.fromJson(Map<String, dynamic> json) => Semester(
        subjectName: json["subject_name"],
        subject: json["subject"] == null
            ? []
            : List<Subject>.from(
                json["subject"]!.map((x) => Subject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subject_name": subjectName,
        "subject": subject == null
            ? []
            : List<dynamic>.from(subject!.map((x) => x.toJson())),
      };
}

class Subject {
  String? id;
  String? title;
  String? details;
  String? imageBase64;

  Subject({
    this.id,
    this.title,
    this.details,
    this.imageBase64,
  });

  factory Subject.fromRawJson(String str) => Subject.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        title: json["title"],
        details: json["details"],
        imageBase64: json["image_base_64"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "details": details,
        "image_base_64": imageBase64,
      };
}
