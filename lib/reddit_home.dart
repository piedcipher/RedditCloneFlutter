import 'package:flutter/material.dart';

class RedditHome extends StatelessWidget {

  final List<Widget> _posts = <Widget>[];

  Widget renderAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.black38,
      bottom: TabBar(
        tabs: [
          Tab(text: "Home",),
          Tab(text: "Popular"),
        ],
      ),
      title: Text(
        "Reddit",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget renderPostSorter() {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(8.0),
      height: 44.0,
    );
  }

  Widget renderPost() {
    return Container(
      color: Colors.black38,
      child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 0.0),
              child: Text("r/loremispum  ●  2h  ●  i.redd.it", style: TextStyle(color: Colors.grey[600], fontSize: 13.0),),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text("Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet", style: TextStyle(color: Colors.grey[400], fontSize: 16.0),),
                    ),
                    flex: 3,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                      child: Image.asset("assets/lorem_ispum.jpg", width: 64.0, height: 64.0,),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text("Upvotes", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      child: Text("Comments", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      child: Text("Share", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),),
                    ),
                    flex: 1,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child: Divider(color: Colors.black, height: 6.0,),
            ),
          ]
      )
    );
  }

  Widget renderPosts() {
    for(int i = 0; i < 20; i++) {
      if(i == 0) _posts.add(renderPostSorter());
      _posts.add(renderPost());
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => _posts[index],
      itemCount: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: renderAppBar(),
          body: TabBarView(
            children: <Widget>[
              Container(
                child: renderPosts()
              ),
              Icon(Icons.whatshot, color: Colors.white,)
            ],
          )
        )
      )
    );
  }
}