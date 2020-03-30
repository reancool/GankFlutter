import 'dart:convert' show json;

import 'package:flutter_gank/models/GankInfo.dart';
import 'package:flutter_gank/models/gank.dart';

class PageList extends Gank<List<GankInfo>> {

  factory PageList(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new PageList.fromJson(json.decode(jsonStr))
          : new GankInfo.fromJson(jsonStr);

  PageList.fromJson(jsonRes) {
    status = jsonRes['status'];
    total_counts = jsonRes['total_counts'];
    page_count = jsonRes['page_count'];
    page = jsonRes['page'];
    results = jsonRes['data'] == null ? null : [];

    for (var resultsItem in results == null ? [] : jsonRes['data']) {
      results
          .add(resultsItem == null ? null : new GankInfo.fromJson(resultsItem));
    }
  }

  @override
  String toString() {
    return '{"status": $status,"results": $results}';
  }
}
