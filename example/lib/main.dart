import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GroovinWidgets demo',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
        //brightness: Brightness.dark
      ),
      home: GroovinWidgetsDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GroovinWidgetsDemo extends StatefulWidget {
  @override
  _GroovinWidgetsDemoState createState() => _GroovinWidgetsDemoState();
}

class _GroovinWidgetsDemoState extends State<GroovinWidgetsDemo> {
  var value;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SplitColorBackground(
      headerColor: Colors.indigo,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AvatarBackButton(
              avatar:
                  'https://avatars.githubusercontent.com/u/4250470?s=460&u=ba3546d38c6f3dcc65d7451e3f6d7893ca4dfde8&v=4',
              onPressed: () => print('tap'),
            ),
            SizedBox(width: 8),
            Text('GroovinWidgets'),
          ],
        ),
      ),
      header: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SplitColorBackground Header',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: OutlineDropdownButton(
                items: [
                  DropdownMenuItem(
                    child: Text("Test Item"),
                    value: "Test Item",
                  ),
                ],
                isExpanded: true,
                hint: Text("Test Hint"),
                value: value,
                onChanged: (value) => print(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: GroovinExpansionTile(
                defaultTrailingIconColor: Colors.indigoAccent,
                leading: CircleAvatar(
                  backgroundColor: Colors.indigoAccent,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "Test Person",
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text("123-456-7890"),
                onExpansionChanged: (value) {
                  setState(() => isExpanded = value);
                },
                inkwellRadius: !isExpanded
                    ? BorderRadius.all(Radius.circular(8.0))
                    : BorderRadius.only(
                        topRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                      ),
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.notifications),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.comment),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.phone),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 45,
                    color: Colors.indigo,
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'Luminance',
                        style: TextStyle(
                          color: textLuminance(Colors.indigo),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    color: Colors.grey.shade300,
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'Luminance',
                        style: TextStyle(
                          color: textLuminance(Colors.grey.shade300),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bodyFlex: 4,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.drag_handle),
        onPressed: () => showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          builder: (builder) {
            return Container(
              height: 250.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ModalDrawerHandle(
                      handleColor: Colors.indigoAccent,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
