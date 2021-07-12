import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:httptest/http_code.dart';
import 'package:httptest/http_response.dart';



void main() {
  runApp(MaterialApp(
    home: MainApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}


class _MainAppState extends State<MainApp> {
  final TextEditingController _controller = TextEditingController();
  Future<MyResponse>? _futurepost;
  // MyResponse _myResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text("Wikipedia Search app",
          style: TextStyle(
            color: Colors.white
          ),

        ),
        backgroundColor: Colors.grey[900],
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: 10,),
            Expanded(
               flex: 2,
              child: Image.asset("Assets/Wiki2.png",
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              flex: 2,
              child: TextField(
                controller: _controller,
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  hintText: "What are you looking for?",
                  hintStyle: TextStyle(color: Colors.grey),
                  // focusColor: Colors.blueGrey,
                  // fillColor: Colors.green,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white38,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 150, height: 50),
              child: ElevatedButton.icon(
                onPressed: (){
                  // final String title = _controller.text;
                  setState(() {
                    _futurepost= createPost(_controller.text);
                    // showDialog(context: context,
                    //     builder: (context){
                    //   return AlertDialog(
                    //     content: Text(_controller.text),
                    //   );
                    //     }
                    // );
                  });
                },
                 label: Text("SEARCH",
                   style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                icon: Icon(Icons.search,
                  color: Colors.black,
                ),
                style:ElevatedButton.styleFrom(
                  primary: Colors.white,
                )

              ),
            ),
            FutureBuilder<MyResponse>(
              future: _futurepost,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.description,
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}',
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  );
                }

                return CircularProgressIndicator();
              },
            )
            // Text(''),
          ],
        ),
      )
    );
  }
}

