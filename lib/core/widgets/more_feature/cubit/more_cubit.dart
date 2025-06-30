import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../src/admin/profile/data/models/EditProfilePrams.dart';
import '../../../../src/admin/profile/data/repositories/profile_repo.dart';

part 'more_state.dart';

@Injectable()
class MoreCubit extends Cubit<MoreState> {
  MoreCubit(this._repository) : super(MoreInitial());
  final ProfileRepository _repository;

  static MoreCubit of(BuildContext context) =>
      BlocProvider.of<MoreCubit>(context);

  editProfile(EditProfilePrams editProfileParams) async {
    try {
      emit(Loading());
      await _repository
          .editProfile(editProfileParams: editProfileParams)
          .then((value) async {
       await logOut(2);
        emit(Succuss());
      });
    } catch (e) {
      print('executeListener $e');
      emit(Error());
      rethrow;
    }
  }

  logOut(int type) async {
    try {
      emit(LoadingLogOut());
      await _repository
          .logOut(type: type)
          .then((value) => emit(SuccussLogOut()));
    } catch (e) {
      print('executeListener $e');
      emit(ErrorLogOut());
      rethrow;
    }
  }
}
