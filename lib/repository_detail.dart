import 'package:flutter/material.dart';
import 'item.dart';

class RepositoryDetailScreen extends StatelessWidget {
  final Items repo;

  RepositoryDetailScreen({required this.repo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(repo.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${repo.name}"),
            SizedBox(height: 8),
            Text("Description: ${repo.description}"),
          ],
        ),
      ),
    );
  }
}
