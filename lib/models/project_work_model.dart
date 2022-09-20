import 'dart:io';

class Project {
  final String title;
  final List<String> indexedTitle;
  final List<String> indexedAuthor;
  final List<String> indexedSupervisor;
  final String author;
  final String supervisor;
  final DateTime date;
  final String filePath;

  Project(
      {required this.indexedAuthor,
      required this.indexedSupervisor,
      required this.indexedTitle,
      required this.title,
      required this.author,
      this.supervisor = "unKnown",
      required this.date,
      required this.filePath});

  Map<String, dynamic> toJson() => {
        "title": title,
        "author": author,
        "supervisor": supervisor,
        "date": date,
        "filePath": filePath,
        "indexedAuthor": indexedAuthor,
        "indexedTitle": indexedTitle,
        "indexedSupervisor": indexedSupervisor
      };

  static fromJson(Map<String, dynamic> data) {
    return Project(
        indexedAuthor: [],
        indexedSupervisor: [],
        indexedTitle: [],
        title: data["title"],
        author: data["author"],
        date: data['date'],
        supervisor: data['supervisor'],
        filePath: data["filePath"]);
  }
}

class Projects {
  static List<Project> projects = [];
}
