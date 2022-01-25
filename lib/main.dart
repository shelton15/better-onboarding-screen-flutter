import 'package:flutter/material.dart';
import 'package:onboarding_screen/data/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Onboarding Screen",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderModel> slides = <SliderModel>[];
  int currentIndex = 0;

  @override
  void initState() {
    // ignore: todo
    //TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.green : Colors.lightGreen,
          borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: slides.length,
          onPageChanged: (val) {
            currentIndex = val;
          },
          itemBuilder: (context, index) {
            return SliderTitle(
              imageAssetPath: slides[index].getImageAssetPath(),
              title: slides[index].getTitle(),
              desc: slides[index].getDesc(),
            );
          }),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              child: Row(children: <Widget>[
                InkWell(onTap: () {}, child: Text("SKIP")),
                Row(
                  children: <Widget>[
                    for (int i = 0; i < slides.length; i++)
                      currentIndex == i
                          ? pageIndexIndicator(true)
                          : pageIndexIndicator(false)
                  ],
                )
              ]),
            )
          : Container(),
    );
  }
}

// ignore: must_be_immutable
class SliderTitle extends StatefulWidget {
  String imageAssetPath, title, desc;
  SliderTitle({this.imageAssetPath, this.title, this.desc});

  @override
  _SliderTitleState createState() => _SliderTitleState();
}

class _SliderTitleState extends State<SliderTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(widget.imageAssetPath),
          SizedBox(
            height: 20,
          ),
          Text(widget.title),
          SizedBox(
            height: 12,
          ),
          Text(widget.desc)
        ],
      ),
    );
  }
}
