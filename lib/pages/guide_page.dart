import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qdd/routes/application.dart';
import 'package:qdd/routes/routes.dart';
import 'package:qdd/utils/constant_util.dart';
import 'package:qdd/utils/package_qdd_util.dart';
import 'package:qdd/utils/storage_qdd_util.dart';

final sliderArrayList = [
  Slider(
      sliderImageUrl: 'assets/images/slider_1.png',
      sliderHeading: 'Easy Exchange!',
      sliderSubHeading:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultricies, erat vitae porta consequat.'),
  Slider(
      sliderImageUrl: 'assets/images/slider_2.png',
      sliderHeading: 'Easy to Use!',
      sliderSubHeading:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultricies, erat vitae porta consequat.'),
  Slider(
      sliderImageUrl: 'assets/images/slider_3.png',
      sliderHeading: 'Connect with Others',
      sliderSubHeading:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultricies, erat vitae porta consequat.'),
];

/// 引导页
class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  int _currentPage;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              PageView.builder(
                itemCount: sliderArrayList.length,
                itemBuilder: (context, i) {
                  return SliderItem(i);
                },
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
              ),
              _bottomStack()
            ],
          ),
        ),
      ),
    );
  }

  _bottomStack() {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: <Widget>[
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(right: 15.0, bottom: 15.0),
            child: InkWell(
              child: Text(
                _currentPage == (sliderArrayList.length - 1) ? "完成" : "下一页",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
              ),
              onTap: _nextButton,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
            child: InkWell(
              child: Text(
                '跳过',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
              ),
              onTap: _jumpButton,
            ),
          ),
        ),
        Container(
          alignment: AlignmentDirectional.bottomCenter,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: sliderArrayList.map((value) {
              if (_currentPage == sliderArrayList.indexOf(value)) {
                return SliderDots(true);
              } else {
                return SliderDots(false);
              }
            }).toList(),
          ),
        )
      ],
    );
  }

  _nextButton() {
    if (_currentPage < (sliderArrayList.length - 1)) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    } else {
      //保存当前的version 到 storage , 并且跳转到home首页
      _saveStorageVersion();
      Application.router.navigateTo(context, Routes.home, replace: true);
    }
  }

  _saveStorageVersion() async {
     var currentVersion = await PackageQddUtil.version();
     StorageQddUtil.setString(STORAGE_VERSION, currentVersion);
  }

  _jumpButton() {
    if (_currentPage < (sliderArrayList.length - 1)) {
      _pageController.animateToPage(sliderArrayList.length - 1,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }
}

class SliderDots extends StatelessWidget {
  bool isActive;

  SliderDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 30),
      margin: const EdgeInsets.symmetric(horizontal: 3.3),
      height: isActive ? 10 : 6,
      width: isActive ? 10 : 6,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.grey,
          border: isActive
              ? Border.all(color: Color(0xff927DFF), width: 2.0)
              : Border.all(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class SliderItem extends StatelessWidget {
  final int index;

  SliderItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(sliderArrayList[index].sliderImageUrl))),
        ),
        SizedBox(
          height: 60.0,
        ),
        Text(
          sliderArrayList[index].sliderHeading,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.5),
        ),
        SizedBox(
          height: 15.0,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              sliderArrayList[index].sliderSubHeading,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  fontSize: 12.5),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slider(
      {@required this.sliderImageUrl,
      @required this.sliderHeading,
      @required this.sliderSubHeading});
}
