import 'package:flutter/material.dart';
import 'package:app/add.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lets Get Started!',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return test();
                }));
              }, 
              child: 
              Text('Start'))
            ],
          )
        ],
      )
    );
  }
}