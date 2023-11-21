import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kids/utils/admob.dart';
import 'package:kids/utils/model.dart';
import 'package:url_launcher/url_launcher.dart';


class FruitVideo extends StatefulWidget{
  @override
  State<FruitVideo> createState() => _FruitVideoState();
}
List<Numbermodel> fruitvideolist = fruitvideo1();
List<String> fruitvideoURLlist = fruitvideoURL();

class _FruitVideoState extends State<FruitVideo> {
  Future<void> _launchYoutubeVideo(String url) async {
    await launch(url);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Color(0xFFFEF7F0),
          elevation: 0,
          title: Center(child: Text('Fruit Video Songs',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd"),)),
        ),
        body: Container(
          child: GridView.builder(
            itemCount: fruitvideolist.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index,) {
              return   InkWell(
                splashColor: Colors.redAccent,
                onTap: () {
                  _launchYoutubeVideo(fruitvideoURLlist[index]);
                  print(fruitvideoURLlist[index]);
                },
                child: Card(
                  color: Color(0xFFEBE8FD),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadowColor: Colors.redAccent,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(fruitvideolist[index].image,fit: BoxFit.fill,alignment: Alignment.topCenter,height: 122),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text(fruitvideolist[index].Text,style: TextStyle(color: Colors.redAccent,fontFamily: "arlrdbd",fontSize: 15),)),
                        )
                      ]
                  ),
                ),
              );
            },
          ),
        ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width *0.13,
        width: 25,
        child: AdWidget(
          ad:AdmobHelper.getBannerAd()..load(),
        ),
      ),
    );
  }
}

