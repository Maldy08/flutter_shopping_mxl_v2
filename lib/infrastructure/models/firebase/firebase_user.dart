import 'package:equatable/equatable.dart';

class FirebaseUser extends Equatable {
  // final String id;
  // final String? email;
  // final String? name;
  // final String? photoUrl;

  const FirebaseUser({required this.id, this.email, this.name, this.photoUrl});

  final String? email;
  final String id;
  final String? name;
  final String? photoUrl;

  static const empty = FirebaseUser(id: '');
  bool get isEmpty => this == FirebaseUser.empty;
  bool get isNotEmpty => this != FirebaseUser.empty;

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, name, photoUrl];
}
