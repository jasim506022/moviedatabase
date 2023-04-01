import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:movies/page/searchpage.dart';

import 'moviepage/moviehomepage.dart';
import 'tvshow/tvshowhomepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // int currentIndex = 0;
  // List<Widget> list = [
  //   const HomePage(),
  //   const TVShowPage(),
  //   const SearchPage(),
  //   const HomePage(),
  // ];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          backgroundColor: const Color.fromRGBO(39, 43, 48, 1),
          activeColor: Colors.red,
          inactiveColor: Colors.white60,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "Movie",
              icon: Icon(Icons.movie),
            ),
            BottomNavigationBarItem(
              label: "Shows",
              icon: Icon(Icons.tv),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Watchlist",
              icon: Icon(Icons.bookmark),
            ),
          ]),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(child: MovieHomePage());
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(child: TVShowHomePage());
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(child: SearchPage());
              },
            );
          case 3:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(child: MovieHomePage());
              },
            );
        }
        return Container();
      },
    );
  }

//   BottomNavigationBar bottomvaigator() {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       currentIndex: currentIndex,
//       backgroundColor: Color.fromRGBO(39, 43, 48, 1),
//       selectedItemColor: Colors.red,
//       unselectedItemColor: Colors.white60,
//       selectedLabelStyle: GoogleFonts.poppins(
//           fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
//       unselectedLabelStyle: GoogleFonts.poppins(
//           fontSize: 14, color: Colors.white60, fontWeight: FontWeight.normal),
//       onTap: (value) {
//         // Respond to item press.
//         setState(() => currentIndex = value);
//       },
//       items: const [
//         BottomNavigationBarItem(
//           label: "Movie",
//           icon: Icon(Icons.movie),
//         ),
//         BottomNavigationBarItem(
//           label: "Shows",
//           icon: Icon(Icons.tv),
//         ),
//         BottomNavigationBarItem(
//           label: "Search",
//           icon: Icon(Icons.search),
//         ),
//         BottomNavigationBarItem(
//           label: "Watchlist",
//           icon: Icon(Icons.bookmark),
//         ),
//       ],
//     );
//   }

  // Future<bool> _onBackButtonPress(BuildContext context) async  {
  //   bool? exitApp = await showDialog(context: context, 
  //   builder: (context) {
  //     return AlertDialog(
  //       title: Text("Really??"),
  //       content: Text("Do You want to close the app?"),
  //     actions: [
  //       TextButton(onPressed: () {
  //                 Navigator.of(context).pop(false);
  //       },  child: Text("No")),
  //       TextButton(onPressed: () {
  //                 Navigator.of(context).pop(true);
  //       },  child: Text("Yes")),
  //     ],
  //     );
  //   },);
  //   return exitApp??false;  
  // }
}
