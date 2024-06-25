import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController numberController=TextEditingController();
  int number=0;
  int colorno=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  button(text: "Red",color: Colors.red,colorno: 1),
                  button(text: "Yellow",color: Colors.yellow,colorno: 2),
                  button(text: "Green",color: Colors.green,colorno: 3),
                ],
              ),
              SizedBox(height:10),
              TextField(
                controller: numberController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Enter the number",
                    labelText: "Number"
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      number=int.parse(numberController.text.toString());
                    });
                  },
                  child: Text("Apply"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
              Wrap(
                direction: Axis.horizontal,
                children: wrapWidgets(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget button({required String text, required Color color,required int colorno}){
    return ElevatedButton(
        onPressed: (){
          setState(() {
            this.colorno=colorno;
          });
        },
        child: Text(text,style: TextStyle(color: Colors.black)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
        ),
    );
  }

  List<Widget> wrapWidgets(){
    var containers=<Widget>[];
    for(int i=0;i<number;i++){
      containers.add(
        Container(
          width:50,
          height:50,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color:colorno==1 ? (Colors.red):(colorno==2 ? Colors.yellow : Colors.green),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        )
      );
    }
    return containers;
  }
}
