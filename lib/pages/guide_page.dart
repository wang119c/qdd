import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qdd/routes/application.dart';
import 'package:qdd/routes/routes.dart';
import 'package:qdd/utils/constant_util.dart';
import 'package:qdd/utils/package_qdd_util.dart';
import 'package:qdd/utils/screen_qdd_util.dart';
import 'package:qdd/utils/storage_qdd_util.dart';

final sliderArrayList = [
  Slider(
      sliderImageUrl: 'assets/images/slider_1.png',
      sliderHeading: '便捷',
      sliderSubHeading: '随时随地签署文件,无需打印寄送',
      sliderBg: 'assets/images/slider_bg_1.png'),
  Slider(
      sliderImageUrl: 'assets/images/slider_2.png',
      sliderHeading: '安全',
      sliderSubHeading: 'ISO27001信息安全认证、工信部ICP许可、国家密码管理局许可、保险公司承担',
      sliderBg: 'assets/images/slider_bg_2.png'),
  Slider(
      sliderImageUrl: 'assets/images/slider_3.png',
      sliderHeading: '合规',
      sliderSubHeading: '依据《中华人民共和国电子签名法》、采用权威CA机构数字证书认证、防篡改电子签名',
      sliderBg: 'assets/images/slider_bg_3.png'),
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
    ScreenQddUtil.init(context);
    return Scaffold(
      backgroundColor: Color(0xff7e59cb),
      body: Container(
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
            _sliderDots()
          ],
        ),
      ),
    );
  }

  _sliderDots() {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.bottomCenter,
          margin: EdgeInsets.only(bottom: ScreenQddUtil.setHeight(100)),
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
//    return AnimatedContainer(
//      duration: Duration(milliseconds: 30),
//      margin: const EdgeInsets.symmetric(horizontal: 3.3),
//      height: isActive ? 10 : 6,
//      width: isActive ? 10 : 6,
//      decoration: BoxDecoration(
//          color: isActive ? Colors.white : Colors.grey,
//          border: isActive
//              ? Border.all(color: Color(0xff927DFF), width: 2.0)
//              : Border.all(color: Colors.transparent, width: 1),
//          borderRadius: BorderRadius.all(Radius.circular(12))),
//    );

    return AnimatedContainer(
      duration: Duration(milliseconds: 30),
      margin: EdgeInsets.symmetric(horizontal: 3.3),
      width: isActive ? ScreenQddUtil.setWidth(64) : ScreenQddUtil.setWidth(20),
      height: ScreenQddUtil.setWidth(20),
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Color.fromRGBO(255, 255, 255, 0.7),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}



/// 滑动块的单个状态
class SliderItem extends StatelessWidget {
  final int index;

  SliderItem(this.index);

  @override
  Widget build(BuildContext context) {
    return index == sliderArrayList.length - 1
        ? GestureDetector(
            child: _containerBody(index),
            onTap: () {
              //保存当前的version 到 storage , 并且跳转到登录
              _saveStorageVersion();
              Application.router
                  .navigateTo(context, Routes.home, replace: true);
            },
          )
        : _containerBody(index);
  }

  _saveStorageVersion() async {
    var currentVersion = await PackageQddUtil.version();
    StorageQddUtil.setString(STORAGE_VERSION, currentVersion);
  }

  _containerBody(index) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(sliderArrayList[index].sliderBg))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
//            width: MediaQuery.of(context).size.width * 0.6,
//            height: MediaQuery.of(context).size.height * 0.4,
            width: ScreenQddUtil.setWidth(128),
            height: ScreenQddUtil.setWidth(128),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(sliderArrayList[index].sliderImageUrl))),
          ),
          SizedBox(
            height: ScreenQddUtil.setHeight(40),
          ),
          Text(
            sliderArrayList[index].sliderHeading,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: ScreenQddUtil.setSp(48),
                color: Color(0xffffffff)),
          ),
          SizedBox(
            height: ScreenQddUtil.setHeight(15),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                sliderArrayList[index].sliderSubHeading,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: ScreenQddUtil.setSp(28),
                    color: Color.fromRGBO(255, 255, 255, 0.7)),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;
  final String sliderBg;

  Slider(
      {@required this.sliderImageUrl,
      @required this.sliderHeading,
      @required this.sliderSubHeading,
      @required this.sliderBg});
}
