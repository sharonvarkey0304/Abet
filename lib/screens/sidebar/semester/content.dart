import 'package:flutter/material.dart';
import 'package:loginpage/screens/sidebar/semester/mcq.dart/mcqScreen.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: AppBar(
              title: Text('subject shows here'),
              centerTitle: true,
            ),
          ),
          body: Column(children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.book_outlined,
                    color: Colors.black,
                  ),
                  text: 'NOTES',
                ),
                Tab(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  text: 'M C Q',
                ),
              ],
              indicatorColor: const Color.fromARGB(255, 255, 196, 59),
            ),
            Expanded(
              child: TabBarView(children: [
                Container(
                  child: Center(
                    child: Text('1'),
                  ),
                ),
                McqScreen(),
              ]),
            )
          ]),
        ));
  }
}
