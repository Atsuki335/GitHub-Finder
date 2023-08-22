class Items {
  final String name;
  final String description;
  final String language;
  final String star;
  final String watcher;
  final String fork;
  final String issue;
  final String avatarUrl;

  Items({
    required this.name,
    required this.description,
    required this.language,
    required this.star,
    required this.watcher,
    required this.fork,
    required this.issue,
    required this.avatarUrl,
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      name: json['name'],
      description: json['description'] ?? 'No description',
      language: json['language'] ?? 'Unknown',
      star: json['stargazers_count'].toString(),
      watcher: json['watchers_count'].toString(),
      fork: json['forks_count'].toString(),
      issue: json['open_issues_count'].toString(),
      avatarUrl: json['owner']['avatar_url'].toString(),
    );
  }
}
