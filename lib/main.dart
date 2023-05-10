import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rest_api/listmodel.dart';

void main() => runApp(const MaterialApp(
      home: ListOfStudents(),
    ));

class ListOfStudents extends StatefulWidget {
  const ListOfStudents({super.key});

  @override
  State<ListOfStudents> createState() => _ListOfStudentsState();
}

class _ListOfStudentsState extends State<ListOfStudents> {
  // dynamic stringofstudents;
  List<Students> students = [];
  Future<List<Students>> getAPI() async {
    final response = await http.get(Uri.parse(
        "https://1qy9d2uuyg.execute-api.ap-northeast-1.amazonaws.com/default/Students-API"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        students.add(Students.fromJson(i));
      }
      return students;
    } else {
      return students;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'List of all the students',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder(
              future: getAPI(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('loading');
                } else {
                  return ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Column(children: [
                              //Text(index.toString()),
                              //Text(students.toString()),
                              Text(students[index].name.toString()),
                              Text(students[index].college.toString())
                            ]),
                          ),
                        );
                      });
                }
              },
            ))
          ],
        ));
  }
}
// What a MI RCB match. MI played so well