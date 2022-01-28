import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'to-do(başlangıç)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Rabbi yessir ve la tuassir'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {







  @override
  Widget build(BuildContext context) {




    return DefaultTabController(length: 2,
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.deepPurple,
            //backgroundColor: Colors.red,
            shadowColor: Colors.deepPurple,
            title: Text(widget.title),
            bottom: TabBar(
              indicatorColor: Colors.deepPurple,
              unselectedLabelColor: Colors.deepPurple,
              tabs: [
                Tab(text: 'Home',),
                Tab(text: 'tasks'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              HomaPage(),
              tasks(),
            ],
          ),
        )
      ,);
  }
}









class tasks extends StatefulWidget {
  const tasks({Key? key}) : super(key: key);

  @override
  _tasksState createState() => _tasksState();
}




class _tasksState extends State<tasks> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titleList.length,
      itemBuilder: (context, i){

        return GestureDetector(
          onTap: (){
            showDialog(
                context: context,
                builder: (BuildContext context){
              return AlertDialog(
              title: Text(titleList[i]),
                content: Text(descrpList[i]),

              );
                },
            );
          },
          child: Card(
            child: Center(
              child: SizedBox(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(titleList[i]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}





class HomaPage extends StatefulWidget {
  const HomaPage({Key? key}) : super(key: key);

  @override
  _HomaPageState createState() => _HomaPageState();
}
var titleList = [];
var titleCont= TextEditingController();
var descrpCont= TextEditingController();
var descrpList = [];

class _HomaPageState extends State<HomaPage> {
  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context);
    var screenhgt= screenSize.size.height;
    var screenwdt= screenSize.size.width;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("baslik ve aciklama yaparak yeni task ekleyebilirsin",
            style: TextStyle(
              fontFamily: 'Robotomo',
              fontSize: screenhgt/50,
            ),),
        SizedBox(
          height: screenhgt/8,),
            Padding(
              padding:  EdgeInsets.all(screenwdt/40),
              child: TextField(

                style: TextStyle(color: Colors.deepPurple),
                textAlign: TextAlign.center,
                showCursor: true,
                cursorColor: Colors.deepOrange,
                controller: titleCont,
                decoration: InputDecoration(
                  fillColor: Colors.lightGreenAccent,
                  filled: false,
                  hintText: "basligi yaz",
                  hintStyle: TextStyle(color: Colors.deepPurple),

                ),
              ),
            ),
            SizedBox(
              height: screenhgt/8,
            ),
            Padding(
              padding:  EdgeInsets.all(screenwdt/40),
              child: TextField(
                style: TextStyle(color: Colors.deepPurple),
                controller: descrpCont,
                textAlign: TextAlign.center,
                showCursor: true,
                cursorColor: Colors.deepOrange,
                decoration: InputDecoration(fillColor: Colors.lightGreenAccent,
                  filled: false,
                  hintText: "aciklamayi yaz",
                  hintStyle: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ),
            SizedBox(
              height:screenhgt/80,
            ),
            ElevatedButton(onPressed: (){
            titleList.add(titleCont.text);
            descrpList.add(descrpCont.text);
            setState(() {

            });
            },
                child: Text('ekle',
                style:TextStyle(color: Colors.deepPurple) ,),
              style: ButtonStyle(),
            )
          ],
        ),
      ),
    );
  }
}



