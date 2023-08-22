import 'package:githubfinder/API.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'item.dart';

final repositoryProvider =
    FutureProvider.autoDispose.family<List<Items>, String>((ref, query) async {
  return fetchRepositories(query);
});
