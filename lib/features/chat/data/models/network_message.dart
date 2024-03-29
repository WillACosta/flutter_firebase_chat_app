import 'package:cloud_firestore/cloud_firestore.dart';

class NetworkMessage {
  final String id;
  final String sentBy;
  final String messageText;
  final String? sentAt;

  NetworkMessage({
    required this.id,
    required this.sentBy,
    required this.messageText,
    required this.sentAt,
  });

  factory NetworkMessage.fromMap(Map<String, dynamic> map) {
    return NetworkMessage(
      id: map['id'] ?? '',
      sentBy: map['sentBy'] ?? '',
      messageText: map['messageText'] ?? '',
      sentAt: map['sentAt'],
    );
  }

  factory NetworkMessage.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();

    if (data == null) {
      throw const FormatException("There is no data for deserialize");
    }

    return NetworkMessage.fromMap(data);
  }

  static List<NetworkMessage> fromFirestoreList(
    QuerySnapshot<Map<String, dynamic>> data,
  ) {
    final documents = data.docs;
    return List.from(documents.map(NetworkMessage.fromFirestore));
  }
}
