import 'dart:io';

class Project {
  final String title;
  final String author;
  final String supervisor;
  final DateTime date;
  final String file;

  Project(
      {required this.title,
      required this.author,
      this.supervisor = "unKnown",
      required this.date,
      required this.file});

  static fromJson(Map<String, dynamic> data) {
    return Project(
        title: data["title"],
        author: data["author"],
        date: data['date'],
        file: "");
  }
}

class Projects {
  static List<Project> projects = [];
}
