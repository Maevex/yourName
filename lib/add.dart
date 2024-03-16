import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  final List<Map<String, dynamic>> data = [];
  String inputNama = '';
  int? inputUmur;
  String? gender;

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 117, 39, 176),
        title: Text(
          'Your Name',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Aligns everything to the start (left)
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Masukkan nama'),
                onChanged: (value) {
                  setState(() {
                    inputNama = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Masukkan Umur'),
                onChanged: (value) {
                  setState(() {
                    inputUmur = int.tryParse(value);
                  });
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0), // Adds left padding to move "Choose gender" to the left
                child: Text(
                  "Choose gender",
                  style: TextStyle(
                    fontSize: 20
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  
                  Radio<String>(
                    value: 'Male',
                    groupValue: gender,
                    onChanged: (String? value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                  
                  Text('Male'),

                  SizedBox(width: 40,),
                  
                  
                  Radio<String>(
                    value: 'Female',
                    groupValue: gender,
                    onChanged: (String? value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                  
                  Text('Female'),
                  
                ],
              ),
              SizedBox(
                width: deviceWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: const Color.fromARGB(255, 117, 39, 176)),
                    primary: Color.fromARGB(255, 117, 39, 176),
                  ),
                  onPressed: () {
                    if (inputNama.isNotEmpty && inputUmur != null && gender != null) {
                      setState(() {
                        data.add({'name': inputNama, 'age': inputUmur, 'gender': gender});
                        inputNama = '';
                        inputUmur = null;
                        gender = null;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data Berhasil Dimasukkan '),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Nama, Umur, dan Gender harus diisi/umur harus menggunakan angka'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  child: const Text("Submit", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: const Color.fromARGB(255, 117, 39, 176)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama : ${data[index]['name']}'),
                                    Text('Umur : ${data[index]['age']}'),
                                    Text('Gender : ${data[index]['gender']}'),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: Colors.white, side: BorderSide(color: Colors.red)),
                                onPressed: () {
                                  setState(() {
                                    data.removeAt(index);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Data Berhasil Dihapus'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  });
                                },
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
