import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Departments {
  String name;
  int index;

  Departments({this.name, this.index});
}

class Subjects {
  int id;
  String subjectName;

  Subjects({this.id, this.subjectName});
}

class _MyHomePageState extends State<MyHomePage> {
  List<Departments> fList = [
    Departments(
      index: 1,
      name: "Science",
    ),
    Departments(
      index: 2,
      name: "Commerce",
    ),
    Departments(
      index: 3,
      name: "Arts",
    ),
  ];

  List<Subjects> _science = [
    Subjects(id: 1, subjectName: "Physics"),
    Subjects(id: 2, subjectName: "Chemistry"),
  ];
  List<Subjects> _commerce = [
    Subjects(id: 1, subjectName: "Banking"),
    Subjects(id: 2, subjectName: "Accounting"),
  ];

  List<Subjects> rootSubjects = [
    Subjects(id: 0, subjectName: "No Subject"),
  ];

  List<String> subjectNames = [];

  Future<Null> makePageList() async {
    subjectNames.clear();
    for (int i = 0; i < rootSubjects.length; i++) {
      subjectNames.add(rootSubjects[i].subjectName.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rootSubjects=[
      Subjects(id: 1, subjectName: "Physics"),
      Subjects(id: 2, subjectName: "Chemistry"),
    ];
    makePageList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Login Here",
              style: TextStyle(color: Colors.cyan, fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        hintText: "Enter name",
                        labelText: "Name",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, bottom: 4, right: 12, left: 12),
                    child: Text("Phone"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        hintText: "Enter phone",
                      ),
                    ),
                  ),
                  //Radio hobe subject choose korar jonno, like Phyisc, chemistry
                  ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: fList
                        .map((data) =>
                        RadioListTile(
                          title: Text("${data.name}"),
                          groupValue: id,
                          value: data.index,
                          onChanged: (val) {
                            setState(() {
                              id = val;
                              radioItem = data.name;
                              print(id);
                              if (id == 1) {
                                //Print Science
                                rootSubjects.clear();
                                setState(() {
                                  rootSubjects = [
                                    Subjects(id: 1, subjectName: "Physics"),
                                    Subjects(id: 2, subjectName: "Chemistry"),
                                  ];
                                });
                                makePageList();
                              } else if (id == 2) {
                                //Print Commerce
                                rootSubjects.clear();
                                setState(() {
                                  rootSubjects = [
                                    Subjects(id: 1, subjectName: "Banking"),
                                    Subjects(id: 2, subjectName: "Accounting"),
                                  ];
                                  makePageList();
                                });
                              } else {
                                //Print Arts
                                rootSubjects.clear();
                                setState(() {
                                  rootSubjects = [
                                    Subjects(
                                        subjectName: "No Subject", id: 0)
                                  ];
                                  makePageList();
                                });
                              }
                              print(rootSubjects.toList());
                            });
                          },
                        ))
                        .toList(),
                  ),
                  DropdownButton<String>(
                    focusColor: Colors.white,
                    value: rootSubjects[0].subjectName,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items:
                    subjectNames.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      rootSubjects[0].subjectName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        print(value);
                      });
                    },
                  ),
                ],
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

String radioItem = 'Mango';

// Group Value for Radio Button.
int id = 1;
