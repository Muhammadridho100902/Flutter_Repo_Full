part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoadinState extends UserState{

  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState{
  final List<UserModel> users;
  const UserLoadedState(this.users);

  @override
  List<Object> get props => [users];
}

class UserLoadedError extends UserState{
  final String error;
  const UserLoadedError(this.error);

  @override
  List<Object> get props => [error];
}