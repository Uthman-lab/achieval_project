import 'dart:io';

import 'package:achieval_project/controllers/file_picker.dart';
import 'package:achieval_project/controllers/project_controller.dart';
import 'package:achieval_project/widgets/buttons.dart';
import 'package:achieval_project/widgets/spaces.dart';
import 'package:achieval_project/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/project_work_model.dart';

class AddView extends StatelessWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var projectObj = Provider.of<ProjectController>(context);
    TextEditingController titleController = TextEditingController();
    TextEditingController supervisorController = TextEditingController();
    TextEditingController authorController = TextEditingController();
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(controller: titleController, label: "Enter title"),
            MySpace(10),
            MyTextField(
              label: "Author",
              controller: authorController,
            ),
            MyTextField(
              controller: supervisorController,
              label: "Project Supervisor",
            ),
            DatePicker(),
            Pdf(),
            MyTextButton(
              label: "save",
              onpressed: () {
                var obj = Project(
                    title: titleController.text,
                    author: authorController.text,
                    supervisor: supervisorController.text,
                    date: projectObj.date,
                    file: projectObj.file);
                projectObj.addToFirebase(obj);
                Projects.projects.add(obj);
                Projects.projects.forEach((element) {
                  print("${element.author}, ${element.date}");
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;
  void pickDate(context) async {
    var date = Provider.of<ProjectController>(context, listen: false);
    final pick = await showDatePicker(
        context: context,
        initialDate: DateTime(2020),
        firstDate: DateTime(2020),
        lastDate: DateTime(2024));
    if (pick != null) {
      setState(() {
        date.date = pick;
        print(date.date);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var date = Provider.of<ProjectController>(context);
    return Container(
      child: ElevatedButton(
        onPressed: () {
          pickDate(context);
        },
        child: Text("${date.date.toString().split(' ')[0]}"),
      ),
    );
  }
}

class Pdf extends StatefulWidget {
  const Pdf({Key? key}) : super(key: key);

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  String? fileName;
  @override
  Widget build(BuildContext context) {
    var projectObj = Provider.of<ProjectController>(context, listen: false);
    return Container(
      child: ElevatedButton(
        child: Text(fileName ?? 'add pdf'),
        onPressed: () async {
          var obj = FilePickerClass();
          File? a = await obj.filePicker();
          if (a != null) {
            projectObj.file = a;
            print(a.toString());
            print(a.path);
            setState(() {
              fileName = a.path.split('/').last;
            });
          }
        },
      ),
    );
  }
}
