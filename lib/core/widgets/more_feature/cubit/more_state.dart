part of 'more_cubit.dart';

@immutable
abstract class MoreState {}

class MoreInitial extends MoreState {}
class Loading extends MoreState {}
class Succuss extends MoreState {}
class Error extends MoreState {}
class LoadingLogOut extends MoreState {}
class SuccussLogOut extends MoreState {}
class ErrorLogOut extends MoreState {}
