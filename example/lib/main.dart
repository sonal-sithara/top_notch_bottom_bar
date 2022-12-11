import 'package:flutter/material.dart';
import 'package:top_notch_bottom_bar/top_notch_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const TextStyle txtstyle = TextStyle(fontSize: 30);

  List<Widget> screens = [
    const Center(child: Text('Home', style: txtstyle)),
    const Center(child: Text('Favourite', style: txtstyle)),
    const Center(child: Text('Messages', style: txtstyle)),
    const Center(child: Text('Settings', style: txtstyle)),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Notch Bottom Bar'),
        backgroundColor: Colors.cyan,
      ),
      body: screens[index],
      bottomNavigationBar: TopNotchBottomBar(
          backgroundColor: Colors.cyan,
          inActiveColor: Colors.black38,
          activeColor: Colors.white,
          height: 56, // changes the bottom bar height -> default = 50
          onTap: ((value) => setState(() {
                index = value;
              })),
          items: [
            TopNotchItem(icon: const Icon(Icons.home), name: 'Home'),
            TopNotchItem(icon: const Icon(Icons.favorite), name: 'Favourite'),
            TopNotchItem(icon: const Icon(Icons.message), name: 'Messages'),
            TopNotchItem(icon: const Icon(Icons.settings), name: 'Settings'),
          ]),
    );
  }
}
