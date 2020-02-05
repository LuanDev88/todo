import 'package:app_front/Bloc/blocs/user_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'models/global.dart';
import 'UI/intray/intray_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  get mainAxisAlignment => null;

  @override
  Widget build(BuildContext context) {
    bloc.registerUser("aaa", "aaaa", "aa", "laaauan@luan.com", "1aa23");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.yellow,
      home: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: new Scaffold(
            body: Container(
              child: Stack(
                children: <Widget>[
                  TabBarView(
                    children: [
                      IntrayPage(),
                      new Container(
                        color: Colors.orange,
                      ),
                      new Container(
                        color: Colors.lightGreen,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 50),
                    height: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text("Intray", style: intrayTitleStyle, ), Container()],
                    ),
                  ),
                  Container(
                    height: 75,
                    width: 75,
                    margin: EdgeInsets.only(top: 123, left: MediaQuery.of(context).size.width*0.4),
                    child: FloatingActionButton(
                      child: Icon(Icons.add, size: 60,),
                      backgroundColor: custonRed,
                      onPressed: (){},
                    ),
                  )
                ],
              ),
            ),
            appBar: AppBar(
              elevation: 0,
              title: new TabBar(
                tabs: [
                  Tab(
                    icon: new Icon(Icons.home),
                  ),
                  Tab(
                    icon: new Icon(Icons.rss_feed),
                  ),
                  Tab(
                    icon: new Icon(Icons.perm_identity),
                  ),
                ],
                labelColor: darkGreyColor,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.all(5.0),
                indicatorColor: Colors.red,
              ),
              backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
