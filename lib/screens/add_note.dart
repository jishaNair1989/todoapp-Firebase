import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../styles/app_style.dart';
import '../widgets/pop_up.dart';


class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  final _titleCotroller = TextEditingController();
  final _contentCotroller = TextEditingController();
  final String _date =
      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  @override
  Widget build(BuildContext context) {
    final int colorId = Random().nextInt(AppStyle.cardColor.length);
    return Scaffold(
      backgroundColor: AppStyle.cardColor[colorId],
      appBar: AppBar(
        iconTheme: const IconThemeData(),
        backgroundColor: AppStyle.cardColor[colorId],
        elevation: 0.0,
        title: const Text('Add new note'),
        titleTextStyle: AppStyle.mainTitleStyle,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(
              //   height: 200.0,
              //   child: Image.asset('assets/addKoyKunj.png'),
              // ),
              AppStyle.appHeight_30,
              TextField(
                controller: _titleCotroller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  counterText: '',
                ),
                style: AppStyle.mainTitleStyle,
                maxLength: 15,
              ),
              AppStyle.appHeight_10,
              TextField(
                controller: _contentCotroller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Content',
                  counterText: '',
                ),
                style: AppStyle.contentStyle,
                maxLength: 500,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: FloatingActionButton.extended(
          onPressed: () async {
            if (_titleCotroller.text.isEmpty ||
                _contentCotroller.text.isEmpty) {
              SnackBarPopUp.popUp(
                'Please fill both fields',
                context,
              );
              return;
            }
            FirebaseFirestore.instance.collection('notes').add(
              {
                'note_title': _titleCotroller.text.trim(),
                'creation_date':
                '$_date  ${DateTime.now().hour}:${DateTime.now().minute}',
                'note_content': _contentCotroller.text.trim(),
                'color_id': colorId,
              },
            ).then(
                  (_) {
                Navigator.pop(context);
                SnackBarPopUp.popUp(
                  'Note added successfully',
                  context,
                  bgColor: AppStyle.greenColor,
                );
              },
            ).catchError(
                  (_) {
                SnackBarPopUp.popUp(
                  'Something went wrong, Please try again later',
                  context,
                );
              },
            ).onError(
                  (_, __) {
                SnackBarPopUp.popUp(
                  'Something went wrong, Please try again later',
                  context,
                );
              },
            ).timeout(
              const Duration(milliseconds: 3000),
            );
          },
          label: const Text('Submit'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

