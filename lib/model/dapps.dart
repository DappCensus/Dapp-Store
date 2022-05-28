// To parse this JSON data, do
//
//     final dapp = dappFromJson(jsonString);

import 'dart:convert';

Dapp dappFromJson(String str) => Dapp.fromJson(json.decode(str));

String dappToJson(Dapp data) => json.encode(data.toJson());

class Dapp {
  Dapp({
    required this.count,
    required this.status,
    required this.message,
    required this.dapp,
  });

  int count;
  String status;
  String message;
  List<DappElement> dapp;

  factory Dapp.fromJson(Map<String, dynamic> json) => Dapp(
        count: json["count"],
        status: json["status"],
        message: json["message"],
        dapp: List<DappElement>.from(
            json["dapp"].map((x) => DappElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "status": status,
        "message": message,
        "dapp": List<dynamic>.from(dapp.map((x) => x.toJson())),
      };
}

class DappElement {
  DappElement({
    required this.id,
    required this.name,
    required this.company,
    required this.ageRating,
    required this.starRating,
    required this.description,
    required this.version,
    required this.dappImageUrl,
    required this.dappImageCloudId,
    required this.createdAt,
    required this.request,
  });

  String id;
  String name;
  String company;
  String ageRating;
  String starRating;
  String description;
  String version;
  String dappImageUrl;
  String dappImageCloudId;
  DateTime createdAt;
  Request request;

  factory DappElement.fromJson(Map<String, dynamic> json) => DappElement(
        id: json["_id"],
        name: json["name"],
        company: json["company"],
        ageRating: json["ageRating"],
        starRating: json["starRating"],
        description: json["description"],
        version: json["version"],
        dappImageUrl: json["dappImageUrl"],
        dappImageCloudId: json["dappImageCloudId"],
        createdAt: DateTime.parse(json["createdAt"]),
        request: Request.fromJson(json["request"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "company": company,
        "ageRating": ageRating,
        "starRating": starRating,
        "description": description,
        "version": version,
        "dappImageUrl": dappImageUrl,
        "dappImageCloudId": dappImageCloudId,
        "createdAt": createdAt.toIso8601String(),
        "request": request.toJson(),
      };
}

class Request {
  Request({
    required this.type,
    required this.url,
  });

  String type;
  String url;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };
}
