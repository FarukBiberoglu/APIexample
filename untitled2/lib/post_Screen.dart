import 'package:flutter/material.dart';
import 'package:untitled2/utils/models/comments_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController postIdController = TextEditingController();
  TextEditingController Id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text('Post Id')),
                Expanded(
                    child: TextField(
                  controller: postIdController,
                ))
              ],
            ),
            Row(
              children: [
                Expanded(child: Text(' Id')),
                Expanded(
                    child: TextField(
                  controller: Id,
                ))
              ],
            ),
            Row(
              children: [
                Expanded(child: Text('name')),
                Expanded(
                    child: TextField(
                  controller: name,
                ))
              ],
            ),
            Row(
              children: [
                Expanded(child: Text('Email')),
                Expanded(
                    child: TextField(
                  controller: mail,
                ))
              ],
            ),
            Row(
              children: [
                Expanded(child: Text(' Body')),
                Expanded(
                    child: TextField(
                  controller: body,
                ))
              ],
            ),
            ElevatedButton(onPressed: () {
              sendData();
            }, child: Text('Send'))
          ],
        ));
  }

  void sendData(){
      CommentsModel model = CommentsModel(
          postId: int.parse(postIdController.text),
          id: int.parse(Id.text),
        name: name.text,
        email: mail.text,
        body: body.text,



    );
      print(model.name);

  }
}
