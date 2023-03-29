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
  // final Age age;
  // final Sex sex;
  // final PhoneNumber phoneNumber;

  const RegisterState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    // this.age = const Age.pure(),
    // this.sex = const Sex.pure(),
    // this.phoneNumber = const PhoneNumber.pure(),
  });

  RegisterState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Username? username,
    Email? email,
    Password? password,
    // Age? age,
    // Sex? sex,
    // PhoneNumber? phoneNumber,
  }) {
    return RegisterState(
      isPosting: isPosting ?? this.isPosting,
      isFormPosted: isFormPosted ?? this.isFormPosted,
      isValid: isValid ?? this.isValid,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      // age: age ?? this.age,
      // sex: sex ?? this.sex,
      // phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object> get props => [
        isPosting,
        isFormPosted,
        isValid,
        username,
        email,
        password,
      ];
}

class RegisterInitial extends RegisterState {}
