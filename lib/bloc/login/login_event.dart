import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginUser extends LoginEvent {
  final String email;
  final String password;

  LoginUser({
    required this.email,
    required this.password,
  });

}
