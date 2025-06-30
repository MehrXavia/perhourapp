import 'package:injectable/injectable.dart';
import 'package:onservice24/src/shared/auth/data/models/profile_dto.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/utils/helper_methods.dart';
 import '../../data/models/add_support_params.dart';
import '../../data/repositories/support_repo.dart';

@Injectable()
class SupportCubit extends BaseCubit {
  final SupportRepo usecase;

  SupportCubit(this.usecase);

    contactSupport(AddSupportParams params) async {
    ProfileDto?  data =await HelperMethods.getProfile();
    params.userId = data?.id??0 ;
    executeEmitterListener(() => usecase.contactSupport(params));
  }
}
