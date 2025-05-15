import 'package:app/api/api.dart';
import 'package:app/models/post_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
        actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<PostModel>>(
          future: ,
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.done)
            {
              List<PostModel> list = snapshot.data ?? [];
              return ListView.builder(
                itemCount: List.le,
                itemBuilder: itemBuilder
                )
            }
          }
          ),
      ),
    );
  }
}