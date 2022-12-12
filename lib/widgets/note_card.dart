import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe1/widgets/pop_up.dart';

import '../styles/app_style.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.onTap,
    required this.doc,
  }) : super(key: key);
  final VoidCallback onTap;
  final QueryDocumentSnapshot doc;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppStyle.cardColor[doc['color_id']],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.8,
                  child: Text(
                    doc['note_title'],
                    style: AppStyle.mainTitleStyle,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => _deleteVerification(context, doc),
                  child: const Icon(
                    Icons.delete,
                    size: 22.0,
                    color: AppStyle.redColor,
                  ),
                ),
              ],
            ),
            AppStyle.appHeight_5,
            Text(
              doc['note_content'],
              style: AppStyle.contentStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _deleteVerification(
    BuildContext context, QueryDocumentSnapshot doc) async {
  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: const Text(
          'Delete !!',
          style: TextStyle(color: Colors.red),
        ),
        content: const Text('This note will be deleted permanently'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text(
              'Cancel',
              style: AppStyle.contentStyle,
            ),
          ),
          TextButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("notes")
                  .doc(doc.id)
                  .delete();
              Navigator.of(ctx).pop();
              SnackBarPopUp.popUp(
                'Successfully removed',
                context,
                bgColor: AppStyle.greenColor,
              );
            },
            child: Text(
              'Delete',
              style: AppStyle.contentStyle,
            ),
          ),
        ],
      );
    },
  );
}
