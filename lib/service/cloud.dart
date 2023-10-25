
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreData{
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Future addData(Map<String,dynamic> a)async{
        return await firestore.collection('admin').doc().set(a);
    }
    Future Update(String docid,String clgName,String event)async {
        try {
            await firestore.collection('colleges').doc(docid).update({
                'clgName':clgName,
                'eventName':event
            });
        }
        catch (e) {

        }
    }
}