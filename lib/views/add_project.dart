import 'package:achieval_project/widgets/spaces.dart';
import 'package:achieval_project/widgets/textfields.dart';
import 'package:flutter/material.dart';

class AddView extends StatelessWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextFormField(
              label: "project title",
            ),
            MySpace(10),
            MyTextFormField(
              label: "Author",
            ),
            MyTextFormField(
              label: "Project Supervisor",
            ),
            DatePicker(),
            Pdf()
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
  void pickDate() async {
    final pick = await showDatePicker(
        context: context,
        initialDate: DateTime(2020),
        firstDate: DateTime(2020),
        lastDate: DateTime(2024));
    if (pick != null) {
      setState(() {
        selectedDate = pick;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          pickDate();
        },
        child: Text("${selectedDate ?? "select date"}"),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text('add pdf'),
        onPressed: () {},
      ),
    );
  }
}
