import 'package:firebase_auth_app/features/authentication/authentication.dart';

class NetworkChannel {
  final String id;
  final String type;
  final List<NetWorkUser> members;
  final String? name;
  final String? description;
  final String? image;
  final String? createdAt;
  final String? createdBy;

  NetworkChannel({
    required this.id,
    required this.type,
    required this.members,
    this.name,
    this.description,
    this.image,
    this.createdAt,
    this.createdBy,
  });

  factory NetworkChannel.fromMap(Map<String, dynamic> map) {
    return NetworkChannel(
      id: map['id'],
      type: map['type'],
      members: List.from(map['members'].map(NetWorkUser.fromMap)),
      name: map['name'],
      description: map['description'],
      image: map['image'],
      createdAt: map['createdAt'],
      createdBy: map['createdBy'],
    );
  }

  static List<NetworkChannel> fromMapList(List<Map<String, dynamic>> source) {
    return List.from(source.map(NetworkChannel.fromMap));
  }
}
