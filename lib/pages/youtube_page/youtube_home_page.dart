import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:immigration_quebec/pages/youtube_page/youtube_playlist.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeVideos extends StatelessWidget {
  final List<City> _allCities = City.allCities();

  HomePage2() {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "List Videos Youtube",
            style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        body: new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: getHomePageBody(context)));
  }

  getHomePageBody(BuildContext context) {
    return ListView.builder(
      itemCount: _allCities.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(0.0),
    );
  }

  Widget _getItemUI(BuildContext context, int index) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading: new Image.asset(
              "assets/" + _allCities[index].image,
              fit: BoxFit.cover,
              width: 100.0,
            ),
            title: new Text(_allCities[index].name,
              style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            subtitle: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
            Linkify(
              onOpen: (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else {
                  throw 'Could not launch $link';
                }
              },
    text: _allCities[index].link,
    ),


                ]),


          ),
        ],
      ),
    );
  }
}
