import 'package:flutter/material.dart';

void main() {
  runApp(new Navigation());
}

class Navigation extends StatefulWidget {
  int index = 0;

  @override
  State<StatefulWidget> createState() => new NavigationState();
}

class NavigationState extends State<Navigation> {
  int currentPage = 0;

  Route<Null> getRoute(RouteSettings routeSettings) {
    final initialSettings = new RouteSettings(
      name: routeSettings.name,
      isInitialRoute: true,
    );

    return new MaterialPageRoute(
        settings: initialSettings,
        builder: (context) => new Scaffold(
          appBar: new AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: new Text('PGS Agenda', style: new TextStyle(color: Colors.white),),
          ),
          bottomNavigationBar: new BottomNavigationBar(
              currentIndex: currentPage,
              onTap: (value) {
                final routes = [
                  '/agenda',
                  '/about',
                  '/offtopic'
                ];

                currentPage = value;
                Navigator.of(context).pushNamedAndRemoveUntil(routes[value], (route) => false);
              },
              items: <BottomNavigationBarItem>[
                new BottomNavigationBarItem(icon: new Icon(Icons.calendar_today), title: new Text('Agenda')),
                new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text('About')),
                new BottomNavigationBarItem(icon: new Icon(Icons.chat), title: new Text('Offtopic')),
              ]
          ),
        )
    )
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/agenda',
      onGenerateRoute: getRoute,
      theme: new ThemeData(
        primaryColor: new Color.fromRGBO(255, 119, 38, 1.0),
        backgroundColor: Colors.white,
      ),
      routes: <String, WidgetBuilder>{
        '/agenda': (BuildContext context) =>
      },
    );
  }
}