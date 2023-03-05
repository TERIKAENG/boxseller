import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return       // Figma Flutter Generator Ui1loginWidget - FRAME
      Container(
      width: 1440,
      height: 981,
      decoration: const BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
  ),
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child:  //Mask holder Template
    Container(
      width: 1440,
      height: 397,
      child: null
    )
      ),Positioned(
        top: -15,
        left: 57,
        child: Container(
      width: 174,
      height: 137,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 174,
        height: 137,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
      boxShadow : [BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0,4),
          blurRadius: 8
      )],
      color : Color.fromRGBO(255, 255, 255, 1),
  )
      )
      ),Positioned(
        top: 31,
        left: 56,
        child: Container(
        width: 62,
        height: 92,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/Screenshot25651213at21211.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 919,
        left: 0,
        child: Container(
      decoration: BoxDecoration(
          color : Color.fromRGBO(149, 97, 55, 1),
  ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          
        ],
      ),
    )
      ),Positioned(
        top: 145,
        left: 170,
        child: Container(
      width: 1100,
      height: 664,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 1100,
        height: 664,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
      boxShadow : [BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
          offset: Offset(0,5),
          blurRadius: 14
      )],
      color : Color.fromRGBO(255, 255, 255, 1),
  )
      )
      ),Positioned(
        top: 0,
        left: 0,
        child:  //Mask holder Template
    Container(
      width: 1100,
      height: 61.073795318603516,
      child: null
    )
      ),
        ]
      )
    )
      ),Positioned(
        top: 447,
        left: 822,
        child: Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Text('Link Button Label', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 122, 255, 1),
        fontFamily: 'SF Pro Display',
        fontSize: 11,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 1.0909090909090908
      ),), SizedBox(width : 0),
Text('Link Button Label', textAlign: TextAlign.right, style: TextStyle(
        color: Color.fromRGBO(0, 122, 255, 1),
        fontFamily: 'SF Pro Display',
        fontSize: 11,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 1.0909090909090908
      ),),

        ],
      ),
    )
      ),Positioned(
        top: 467,
        left: 822,
        child: Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Text('Login (email or phone number)', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(51, 51, 51, 1),
        fontFamily: 'SF Pro Display',
        fontSize: 11,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 1.0909090909090908
      ),),

        ],
      ),
    )
      ),Positioned(
        top: 487,
        left: 822,
        child: Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Text('Error', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(255, 59, 48, 1),
        fontFamily: 'SF Pro Display',
        fontSize: 11,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 1.0909090909090908
      ),),

        ],
      ),
    )
      ),Positioned(
        top: 507,
        left: 822,
        child: Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Text('Warning', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(255, 140, 0, 1),
        fontFamily: 'SF Pro Display',
        fontSize: 11,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 1.0909090909090908
      ),),

        ],
      ),
    )
      ),Positioned(
        top: 527,
        left: 822,
        child: Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Text('Success', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(37, 162, 17, 1),
        fontFamily: 'SF Pro Display',
        fontSize: 11,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 1.0909090909090908
      ),),

        ],
      ),
    )
      ),Positioned(
        top: 603,
        left: 822,
        child: Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Text('Link Button Label', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 122, 255, 1),
        fontFamily: 'SF Pro Display',
        fontSize: 11,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 1.0909090909090908
      ),), SizedBox(width : 0),
Text('Link Button Label', textAlign: TextAlign.right, style: TextStyle(
        color: Color.fromRGBO(0, 122, 255, 1),
        fontFamily: 'SF Pro Display',
        fontSize: 11,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 1.0909090909090908
      ),),

        ],
      ),
    )
      ),Positioned(
        top: 623,
        left: 822,
        child: Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Text('Password', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(51, 51, 51, 1),
        fontFamily: 'SF Pro Display',
        fontSize: 11,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 1.0909090909090908
      ),),

        ],
      ),
    )
      ),Positioned(
        top: 643,
        left: 822,
        child: Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Text('Error', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(255, 59, 48, 1),
        fontFamily: 'SF Pro Display',
        fontSize: 11,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 1.0909090909090908
      ),),

        ],
      ),
    )
      ),Positioned(
        top: 663,
        left: 822,
        child: Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Text('Warning', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(255, 140, 0, 1),
        fontFamily: 'SF Pro Display',
        fontSize: 11,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 1.0909090909090908
      ),),

        ],
      ),
    )
      ),Positioned(
        top: 683,
        left: 822,
        child: Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Text('Success', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(37, 162, 17, 1),
        fontFamily: 'SF Pro Display',
        fontSize: 11,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 1.0909090909090908
      ),),

        ],
      ),
    )
      ),Positioned(
        top: 145,
        left: 170,
        child:  //Mask holder Template
    Container(
      width: 535,
      height: 664,
      child: null
    )
      ),Positioned(
        top: 285,
        left: 822,
        child: Container(
      width: 360,
      height: 350,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Container(
      decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
      color : Color.fromRGBO(229, 229, 229, 1),
      border : Border.all(
          color: Color.fromRGBO(204, 204, 204, 1),
          width: 0.5,
        ),
  ),
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Container(
      decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(6),
          ),
      boxShadow : [BoxShadow(
          color: Color.fromRGBO(51, 51, 51, 0.15000000596046448),
          offset: Offset(0,1),
          blurRadius: 4
      )],
      color : Color.fromRGBO(255, 255, 255, 1),
      border : Border.all(
          color: Color.fromRGBO(229, 229, 229, 1),
          width: 0.5,
        ),
  ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Text('Sign in', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Roboto',
        fontSize: 12,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 1.6666666666666667
      ),),

        ],
      ),
    ),
],
      ),
    ), SizedBox(width : 0),
Container(
      decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
  ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Text('Sign up', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(102, 102, 102, 1),
        fontFamily: 'Roboto',
        fontSize: 12,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 1.6666666666666667
      ),),

        ],
      ),
    ),
],
      ),
    ),

        ],
      ),
    ),

        ],
      ),
    )
      ),Positioned(
        top: 13,
        left: 0,
        child: Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Text('บัญชีผู้ใช้งาน', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(51, 51, 51, 1),
        fontFamily: 'ThaiSans Neue',
        fontSize: 18,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 0.6666666666666666
      ),),

        ],
      ),
    )
      ),Positioned(
        top: 33,
        left: 0,
        child: Container(
      width: 360,
      height: 53,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 360,
        height: 53,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
      boxShadow : [BoxShadow(
          color: Color.fromRGBO(203, 221, 243, 0.800000011920929),
          offset: Offset(0,4),
          blurRadius: 10
      )],
      color : Color.fromRGBO(255, 255, 255, 1),
      border : Border.all(
          color: Color.fromRGBO(202, 158, 109, 1),
          width: 2,
        ),
  )
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 102,
        left: 0,
        child: Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Text('รหัสผ่าน', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(51, 51, 51, 1),
        fontFamily: 'ThaiSans Neue',
        fontSize: 18,
        letterSpacing: 0.30000001192092896,
        fontWeight: FontWeight.normal,
        height: 0.6666666666666666
      ),),

        ],
      ),
    )
      ),Positioned(
        top: 122,
        left: 0,
        child: Container(
      width: 360,
      height: 53,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 360,
        height: 53,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
      boxShadow : [BoxShadow(
          color: Color.fromRGBO(203, 221, 243, 0.800000011920929),
          offset: Offset(0,4),
          blurRadius: 10
      )],
      color : Color.fromRGBO(255, 255, 255, 1),
      border : Border.all(
          color: Color.fromRGBO(202, 158, 109, 1),
          width: 2,
        ),
  )
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 139,
        left: 16,
        child: Text('********', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(128, 128, 128, 1),
        fontFamily: 'Roboto',
        fontSize: 20,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 50,
        left: 16,
        child: Text('mail@gmail.com', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(128, 128, 128, 1),
        fontFamily: 'Roboto',
        fontSize: 20,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 146,
        left: 325,
        child: Container()
      ),Positioned(
        top: 297,
        left: 2,
        child: Container(
      width: 358,
      height: 53,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
      width: 358,
      height: 53,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 358,
        height: 53,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
      boxShadow : [BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.019999999552965164),
          offset: Offset(0,3.499999761581421),
          blurRadius: 5.5
      )],
      color : Color.fromRGBO(202, 158, 109, 1),
  )
      )
      ),Positioned(
        top: 9,
        left: 131,
        child: Text('เข้าสู่ระบบ', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'ThaiSans Neue',
        fontSize: 30,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),
        ]
      )
    )
      ),
        ]
      )
    )
      ),
        ]
      )
    )
      ),Positioned(
        top: 9,
        left: 79,
        child: Container(
        width: 131,
        height: 78,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/Dtnlogo1.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),
        ]
      )
    );
  }
}