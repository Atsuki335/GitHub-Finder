import 'package:flutter/material.dart';
import 'package:githubfinder/seach_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: SearchRepositories()));
}
