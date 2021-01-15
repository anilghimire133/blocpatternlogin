import 'package:blocpatternlogin/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  changeThePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PageTwo()));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bloc Pattern"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
              stream: bloc.emailStream,
              builder: (context, snapshot) => TextField(
                onChanged: bloc.emailChanged,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    errorText: snapshot.error,
                    hintText: "Enter Email id"),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            StreamBuilder<String>(
              stream: bloc.passwordStream,
              builder: (context, snapshot) => TextField(
                onChanged: bloc.passwordChanged,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    errorText: snapshot.error,

                    hintText: "Enter Password"),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            StreamBuilder<bool>(
              stream: bloc.submitCheck,
              builder: (context, snapshot) => RaisedButton(
                child: Text("Submit"),
                color: Colors.tealAccent,
                onPressed:snapshot.hasData ? ()=> changeThePage(context) : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
