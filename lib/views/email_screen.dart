import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plasma_donor_app2/views/custom_drawer.dart';

import '../app_styles.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  List<String> attachments = [];
  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'example@gmail.com',
  );

  final _subjectController = TextEditingController(text: 'The subject');

  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'Email sent';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: Colors.green,
      content: Text(platformResponse),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Plasma Request',
            style: kBodyText.copyWith(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('BloodCompatibilityScreen');
                  },
                  icon: Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    send();
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _recipientController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Recipient',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _subjectController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Subject',
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _bodyController,
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                            labelText: 'Body', border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                  // CheckboxListTile(
                  //   contentPadding:
                  //       EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                  //   title: Text('HTML'),
                  //   onChanged: (value) {
                  //     setState(() {
                  //       isHTML = value!;
                  //     });
                  //   },
                  //   value: isHTML,
                  // ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Wrap(
                      children: <Widget>[
                        for (var i = 0; i < attachments.length; i++)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    width: 100,
                                    height: 100,
                                    child: Image.file(File(attachments[i]),
                                        fit: BoxFit.contain),
                                  )),
                              IconButton(
                                icon: Icon(Icons.remove_circle),
                                onPressed: () => {_removeAttachment(i)},
                              )
                            ],
                          ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(Icons.attach_file),
                            onPressed: _openImagePicker,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _openImagePicker() async {
    final pick = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pick != null) {
      setState(() {
        attachments.add(pick.path);
      });
    }
  }

  void _removeAttachment(int index) {
    setState(() {
      attachments.removeAt(index);
    });
  }
}
