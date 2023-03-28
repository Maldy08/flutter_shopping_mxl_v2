part of 'register_cubit.dart';

//enum FormStatus { invalid, valid, validating, posting }
// final Map<int, String> intereses = {
//   1: 'Tiendas de Ropa',
//   2: 'Esteticas',
//   3: 'Barberias',
//   4: 'Supermercados',
//   5: 'Restaurantes'
// };

class RegisterState extends Equatable {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Username username;
  final Email email;
  final Password password;
  final Age age;
  final Sex sex;
  final PhoneNumber phoneNumber;

  const RegisterState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.age = const Age.pure(),
    this.sex = const Sex.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
  });

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}
