import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){

  runApp(Calculater());
}

class Calculater extends StatelessWidget {
  const Calculater({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp (
      debugShowCheckedModeBanner: false,
      title: 'Calculater',
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomeScreen(),
    );
  }
}

     class HomeScreen extends StatefulWidget {
       @override
         _HomeScreenState createState() => _HomeScreenState();
       }
         class _HomeScreenState extends State<HomeScreen> {
           String sum="0",res="0",exp1="";
           double fontsize1=35,fontsize2=45;
           @override
           Widget build(BuildContext context) {
             double h=MediaQuery.of(context).size.height,
                w=MediaQuery.of(context).size.width;
               return Scaffold(
                 appBar: AppBar(title: Text('Aditya Calculater')),
                 backgroundColor: Colors.white,
                 body: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(sum,style: TextStyle(color: Colors.black,fontSize: fontsize1),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(res,style: TextStyle(color: Colors.black,fontSize: fontsize2),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton("AC", Colors.green, Color.fromRGBO(250, 244, 244, 0.6),w*0.2 ),
              botton("%", Colors.orange, Color.fromRGBO(250, 244, 244, 0.6),w*0.2 ),
              botton("÷", Colors.red, Color.fromRGBO(250, 244, 244, 0.6),w*0.2 ),
              botton("C", Colors.red, Color.fromRGBO(250, 168, 34, 1),w*0.2 ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton("7", Colors.blue, Color.fromRGBO(250, 244, 244, 0.6),w*0.2 ),
              botton("8", Colors.blue, Color.fromRGBO(250, 244, 244, 0.6),w*0.2 ),
              botton("9", Colors.blue, Color.fromRGBO(250, 244, 244, 0.6),w*0.2 ),
              botton("×", Colors.red,Color.fromRGBO(250, 168, 34, 1),w*0.2 ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton("4", Colors.blue, Color.fromRGBO(250, 244, 244, 0.6),w*0.2 ),
              botton("5", Colors.blue, Color.fromRGBO(250, 244, 244, 0.6),w*0.2 ),
              botton("6", Colors.blue, Color.fromRGBO(250, 244, 244, 0.6),w*0.2 ),
              botton("-", Colors.red, Color.fromRGBO(250, 168, 34, 1),w*0.2 ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton("1", Colors.blue, Color.fromRGBO(250, 244, 244, 0.6),w*0.2 ),
              botton("2", Colors.blue, Color.fromRGBO(250, 244, 244, 0.6),w*0.2 ),
              botton("3", Colors.blue, Color.fromRGBO(250, 244, 244, 0.6),w*0.2 ),
              botton("+", Colors.red,Color.fromRGBO(250, 168, 34, 1),w*0.2 ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton("0", Colors.blue, Color.fromRGBO(250, 244, 244, 0.6),w*0.45 ),
              botton(".", Colors.red, Color.fromRGBO(250, 244, 244, 0.6),w*0.2 ),
              botton("=", Colors.red, Color.fromRGBO(250, 168, 34, 1),w*0.2 ),
            ],
          ),
        ],
      ),
    );
  }
  Widget botton(String text,Color fontcolor,Color _color,double w1){
    double h=MediaQuery.of(context).size.height,
        w=MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        if(text=="="){
          try{
            exp1=sum;
            exp1=exp1.replaceAll("×", "*");
            exp1=exp1.replaceAll("÷", "/");
            Parser P=Parser();
            Expression exp2=P.parse(exp1);
            ContextModel con=ContextModel();
            res="${exp2.evaluate(EvaluationType.REAL, con)}";
            fontsize2=45;
            fontsize1=35;
            setState(() {});
          }catch(e){
            fontsize2=45;
            fontsize1=35;
            res="ERROR";
            setState(() {});
          }
        }else if(text=="AC"){
          fontsize2=45;
          fontsize1=35;
          sum="0";
          res="0";
          setState(() {});
        }else if(text=="C"){
          fontsize2=35;
          fontsize1=45;
          if(sum.length==1){
            sum="0";
            setState(() {});
          }else{
            sum=sum.substring(0,sum.length-1);
            setState(() {});
          }
        }else{
          fontsize2=35;
          fontsize1=45;
          if(sum=="0"){
            sum=text;
            setState(() {});
          }else{
            sum+=text;
            setState(() {});
          }
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        height: h*0.09,
        width: w1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          color: _color,
        ),
        child: Text(text,style: TextStyle(color: fontcolor,fontSize: 30),),
      ),
    );
  }
}
