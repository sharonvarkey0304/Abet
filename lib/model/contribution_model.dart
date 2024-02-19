import 'dart:convert';

class ContributionDataModel {
    List<ContributionDatum>? contributionData;

    ContributionDataModel({
        this.contributionData,
    });

    factory ContributionDataModel.fromRawJson(String str) => ContributionDataModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ContributionDataModel.fromJson(Map<String, dynamic> json) => ContributionDataModel(
        contributionData: json["contribution_data"] == null ? [] : List<ContributionDatum>.from(json["contribution_data"]!.map((x) => ContributionDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "contribution_data": contributionData == null ? [] : List<dynamic>.from(contributionData!.map((x) => x.toJson())),
    };
}

class ContributionDatum {
    String? id;
    String? title;
    String? semester;
    String? subject;
    String? details;
    String? imageBase64;

    ContributionDatum({
        this.id,
        this.title,
        this.semester,
        this.subject,
        this.details,
        this.imageBase64,
    });

    factory ContributionDatum.fromRawJson(String str) => ContributionDatum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ContributionDatum.fromJson(Map<String, dynamic> json) => ContributionDatum(
        id: json["id"],
        title: json["title"],
        semester: json["semester"],
        subject: json["subject"],
        details: json["details"],
        imageBase64: json["image_base_64"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "semester": semester,
        "subject": subject,
        "details": details,
        "image_base_64": imageBase64,
    };
}
