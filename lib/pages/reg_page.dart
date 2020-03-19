import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qdd/utils/screen_qdd_util.dart';
import 'package:qdd/widgets/en_text_field.dart';
import 'package:qdd/widgets/login_or_reg.dart';

/// 注册页面
class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  int _currentIndex = 0;

  PageView _pageView;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageView = PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[PersonalReg(), CompanyReg()],
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenQddUtil.init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xff7e59cb),
        body: Stack(
          children: <Widget>[_bg(), _form()],
        ));
  }

  Widget _bg() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: ScreenQddUtil.setWidth(40)),
          child: Image.asset(
            "assets/images/login_image_02.png",
            width: ScreenQddUtil.setWidth(588),
            height: ScreenQddUtil.setHeight(472),
          ),
        ),
        Expanded(
          child: Container(),
        )
      ],
    );
  }

  Widget _form() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: ScreenQddUtil.setHeight(50),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "个人注册",
                    style: TextStyle(
                        fontSize: ScreenQddUtil.setSp(40),
                        color: _currentIndex == 0
                            ? Colors.white
                            : Color.fromRGBO(255, 255, 255, 0.7)),
                  ),
                  onPressed: () {
                    _pageController.jumpToPage(0);
                  },
                ),
                Container(
                    height: ScreenQddUtil.setHeight(40),
                    child: VerticalDivider(
                        thickness: 2, width: 0, color: Colors.white)),
                FlatButton(
                  child: Text(
                    "企业注册",
                    style: TextStyle(
                        fontSize: ScreenQddUtil.setSp(40),
                        color: _currentIndex == 1
                            ? Colors.white
                            : Color.fromRGBO(255, 255, 255, 0.7)),
                  ),
                  onPressed: () {
                    _pageController.jumpToPage(1);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenQddUtil.setHeight(180),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              padding: EdgeInsets.only(
                  left: ScreenQddUtil.setWidth(32),
                  right: ScreenQddUtil.setWidth(32),
                  top: ScreenQddUtil.setHeight(80)),
              child: _pageView,
            ),
          )
        ],
      ),
    );
  }
}

/// 个人注册
class PersonalReg extends StatefulWidget {
  @override
  _PersonalRegState createState() => _PersonalRegState();
}

class _PersonalRegState extends State<PersonalReg> {
  bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: ScreenQddUtil.setHeight(20),
          ),
          EnTextField(
            labelText: '账号',
            hintText: '手机号/邮箱',
          ),
          SizedBox(
            height: ScreenQddUtil.setHeight(20),
          ),
          EnTextField(labelText: '密码', hintText: '8-16位字母、数字组合', isPwd: true),
          SizedBox(
            height: ScreenQddUtil.setHeight(300),
          ),
          LoginOrReg(
            content: "注册",
            callback: () {
              print(_isSelected);
              print("注册成功");
            },
          ),
          SizedBox(
            height: ScreenQddUtil.setHeight(20),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 12.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isSelected = !_isSelected;
                  });
                },
                child: RadioButton(isSelected: _isSelected),
              ),
              SizedBox(
                width: 8.0,
              ),
              RegProtocol()
            ],
          )
        ],
      ),
    );
  }
}

/// 公司注册
class CompanyReg extends StatefulWidget {
  @override
  _CompanyRegState createState() => _CompanyRegState();
}

class _CompanyRegState extends State<CompanyReg> {
  bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: ScreenQddUtil.setHeight(20),
          ),
          EnTextField(
            labelText: '企业',
            hintText: '企业名称',
          ),
          SizedBox(
            height: ScreenQddUtil.setHeight(20),
          ),
          EnTextField(
            labelText: '邮箱',
            hintText: '请输入邮箱',
          ),
          SizedBox(
            height: ScreenQddUtil.setHeight(20),
          ),
          EnTextField(labelText: '密码', hintText: '8-16位字母、数字组合', isPwd: true),
          SizedBox(
            height: ScreenQddUtil.setHeight(20),
          ),
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: <Widget>[
              EnTextField(
                labelText: '验证码',
                hintText: '6位数字验证码',
                keyboardType: TextInputType.number,
              ),
              FlatButton(
                child: Text(
                  "获取验证码",
                  style: TextStyle(color: Color(0xff7e59cb)),
                ),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: ScreenQddUtil.setHeight(100),
          ),
          LoginOrReg(
            content: "注册",
            callback: () {
              print(_isSelected);
              print("注册成功");
            },
          ),
          SizedBox(
            height: ScreenQddUtil.setHeight(20),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 12.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isSelected = !_isSelected;
                  });
                },
                child: RadioButton(isSelected: _isSelected),
              ),
              SizedBox(
                width: 8.0,
              ),
              RegProtocol()
            ],
          )
        ],
      ),
    );
  }
}

/// 单选按钮
class RadioButton extends StatelessWidget {
  final bool isSelected;

  const RadioButton({Key key, this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenQddUtil.setWidth(32),
      height: ScreenQddUtil.setWidth(32),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1.0, color: Color(0xff9aa7b8)),
      ),
      child: isSelected
          ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff9aa7b8)),
            )
          : Container(),
    );
  }
}

/// 注册协议
class RegProtocol extends StatefulWidget {
  @override
  _RegProtocolState createState() => _RegProtocolState();
}

class _RegProtocolState extends State<RegProtocol> {
  TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()..onTap = _handlePress;
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    super.dispose();
  }

  void _handlePress() {
    // todo 这里跳转协议
    print(1111);
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: "注册即表示您已同意",
          style: TextStyle(
              fontSize: ScreenQddUtil.setSp(24), color: Color(0xff9aa7b8)),
          children: [
            TextSpan(
              text: "《注册使用协议》",
              style: TextStyle(
                  fontSize: ScreenQddUtil.setSp(24), color: Color(0xff7e59cb)),
              recognizer: _tapRecognizer,
            ),
            TextSpan(
              text: '及',
              style: TextStyle(
                  fontSize: ScreenQddUtil.setSp(24), color: Color(0xff9aa7b8)),
            ),
            TextSpan(
              text: "《隐私规范》",
              style: TextStyle(
                  fontSize: ScreenQddUtil.setSp(24), color: Color(0xff7e59cb)),
              recognizer: _tapRecognizer,
            )
          ]),
    );
  }
}
