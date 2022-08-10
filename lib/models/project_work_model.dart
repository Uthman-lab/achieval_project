import 'dart:io';

class Project {
  final String title;
  final String author;
  final String supervisor;
  final DateTime date;
  final String filePath;

  Project(
      {required this.title,
      required this.author,
      this.supervisor = "unKnown",
      required this.date,
      required this.filePath});

  static fromJson(Map<String, dynamic> data) {
    return Project(
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
