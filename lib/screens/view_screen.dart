import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../styles/app_style.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key, required this.doc});
  final QueryDocumentSnapshot doc;
  @override
  Widget build(BuildContext context) {
    final int colorId = doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardColor[colorId],
      appBar: AppBar(
        iconTheme: const IconThemeData(),
        backgroundColor: AppStyle.cardColor[colorId],
        elevation: 0.0,
        title: Text(
          doc['note_title'],
          style: AppStyle.mainTitleStyle,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppStyle.cardColor[colorId],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Align(
              //   child: SizedBox(
              //     height: 200.0,
              //     child: Image.asset('assets/readKoy.png'),
              //   ),
              // ),
              AppStyle.appHeight_30,
              Text(
                'Date, Time: ${doc['creation_date']}',
                style: AppStyle.dateTitleStyle,
              ),
              AppStyle.appHeight_10,
              Text(
                doc['note_content'],
                style: AppStyle.contentStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
