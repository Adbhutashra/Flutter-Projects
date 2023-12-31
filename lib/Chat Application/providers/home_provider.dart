import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testproject/Chat%20Application/constants/firestore_constants.dart';


class HomeProvider {
  final FirebaseFirestore firebaseFirestore;

  HomeProvider({required this.firebaseFirestore});

  Future<void> updateDataFirestore(String collectionPath, String path, Map<String, String> dataNeedUpdate) {
    return firebaseFirestore.collection(collectionPath).doc(path).update(dataNeedUpdate);
  }

  Stream<QuerySnapshot> getStreamFireStore(String pathCollection, int limit) {
   
      return firebaseFirestore
          .collection(pathCollection)
          .limit(limit)
          .where(FirestoreConstants.nickname, )
          .snapshots();
   
  }
}
