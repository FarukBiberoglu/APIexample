import 'package:flutter/material.dart';
import 'package:untitled2/post_Screen.dart';
import 'package:untitled2/utils/services/api_services.dart';

void main(){
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    APIServices apiServices = APIServices();
    apiServices.getComments();
    return MaterialApp(
      home: Scaffold(
          body: Center(
            child: FutureBuilder(
              future: apiServices.getComments(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return Stack(
                    children:[
                      ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context,index){
                          return Text(snapshot.data![index].id.toString());
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PostScreen()));
                        },
                            child: Text('Save Data')),
                      )
                    ]
                  );
                }else if(snapshot.hasError){
                  return Text('${snapshot.error}');
                }
                return CircularProgressIndicator();
              },

            ),
          )
      ),
    );
  }
}