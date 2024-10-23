import 'package:flutter/material.dart';

class MateriasPage extends StatefulWidget {
  const MateriasPage({ super.key });

  @override
  MateriasPageState createState() => MateriasPageState();
}

class MateriasPageState extends State<MateriasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        actions: [  
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
        ),

        drawer: Drawer(child: Column(children: [
          Container(
            color: Colors.grey,
            width: double.infinity, height: 150, padding: const EdgeInsets.only(top: 20), child: Image.asset("./assets/Logo.png"), ),
        
        ],),
          
        
        ),
    );
  }
}
