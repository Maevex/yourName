import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: test()
    );
  }
}

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  
  final List<Map<String, dynamic>> data = [];
  String inputNama = '';
  int? inputUmur;

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(

        appBar: 
        AppBar(
          backgroundColor: Color.fromARGB(255, 117, 39, 176),
          title: Text('Your Name',
          style: TextStyle(
            color: Colors.white
          ),),

        ),

        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
                    
                    TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan nama'
                  ),
                  onChanged: (value){
                    
                    setState(() {
                      inputNama = value;
                    });
                  },
                ),
                
                    
          
                    SizedBox(
                      height: 10,
                    ),
                
          
                  TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Umur'
                  ),
                  onChanged: (value){
                    
                    setState(() {
                      inputUmur = int.tryParse(value);
                    });
                    
                  },
                  keyboardType: TextInputType.number,
          
                  
                ),
                SizedBox(height: 20,),
                
                    
                SizedBox(
                  width: deviceWidth,
                  
                  child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: const Color.fromARGB(255, 117, 39, 176)),
                    ),
                  onPressed: () {
                    if (inputNama.isNotEmpty && inputUmur != null) {
                      setState(() {
                        data.add({'name': inputNama, 'age': inputUmur});
                        inputNama = '';
                        inputUmur = null;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Nama dan Umur harus diisi/umur harus menggunakan angka')),
                      );
                    }
                  },
                  child: const Text("Submit"),
                ),
                ),
                
                
          
              SizedBox(
                height: 10,
              ),
              Expanded(child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: const Color.fromARGB(255, 117, 39, 176)),
                        borderRadius: BorderRadius.circular(20)),
                      
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          
                          children: [

                            Expanded(child: 
                             Column( 
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text('Nama : ${data[index]['name']}'),
                            Text('Umur: ${data[index]['age']}'),
                              ],
                            ),
                            ),
                           
                           

          
                            
                             
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                side: BorderSide(color: Colors.red)
          
                              ),
                              
                              onPressed: (){
                              setState(() {
                                data.removeAt(index);
                              });
                            },
                             child: Text('delete',
                            style: TextStyle(
                              color: Colors.red
                            ),))
                          ],
                        ),
                      ),
                    ),
                  );
                }))
              
              
          
          
              
            ],
          
            
          ),
        )
    );
  }
}