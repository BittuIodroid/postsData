import 'package:flutter/material.dart';
import 'package:weather/model/weather_forecast_model.dart';
import 'package:weather/network/network.dart';


class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<PostModel> forecastObject;
  var postLength;
  List<Posts> posts;
  List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = Network().getWeatherForecast();
    forecastObject.then((weather){
      print("Inside INIT : ${weather.posts[0].comment[0]}");
      posts = weather.posts;
      for(var i = 0; i < weather.posts.length; i++) {
        print(weather.posts[i].comment.length);
        List<Reply> replies = weather.posts[i].comment[0].reply;
        print(replies[i].name);
        //print(weather.posts[i].comment);
        //print("name--> ${posts[i].name}");
      }
      //weather.posts.forEach
      postLength = weather.posts.length;
      data = weather.posts;
      print(postLength);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather Forecast"),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        backgroundColor: Colors.blueGrey.shade400,
        body: ListView.builder(
          itemCount: postLength,
            itemBuilder: (BuildContext context, int postIndex){
            return Padding(
              padding: EdgeInsets.all(50.0),
              child: Column(
                children: <Widget>[
                  Text("${posts[postIndex].name}"),

                  ListView.builder(
                      itemCount: posts[postIndex].comment.length,
                      itemBuilder: (BuildContext context,int commentIndex){
                        return Padding(
                          padding: EdgeInsets.all(50.0),
                          child: Column(
                            children: <Widget>[
                              Text("${posts[postIndex].comment[commentIndex].name}"),

                              ListView.builder(
                                itemCount: posts[postIndex].comment[commentIndex].reply.length,
                                  itemBuilder: (BuildContext context, int replyIndex){
                                    return Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text("${posts[postIndex].comment[commentIndex].reply[replyIndex].name}")
                                        ],
                                      ),
                                    );
                                  },
                                shrinkWrap: true,
                              )


                            ],
                          )

                        );

                  },
                    shrinkWrap: true,
                  )
                ],
              ),

            );
            })

    );
  }
}

