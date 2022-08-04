import 'dart:io';

class Project {
  final String title;
  final String author;
  final String supervisor;
  final DateTime date;
  final File file;

  Project(
      {required this.title,
      required this.author,
      this.supervisor = "unKnown",
      required this.date,
      required this.file});
}

class Projects {
  static List<Project> projects = [];
}
