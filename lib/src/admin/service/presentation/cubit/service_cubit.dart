import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../shared/auth/data/models/profile_dto.dart';
import '../../data/models/add_service_pramt.dart';
import '../../data/repositories/service_repo.dart';

@Injectable()
class ServiceCubit extends BaseCubit {
  final ServiceRepository _repository;

  ServiceCubit(this._repository);

  addService(AddServicePramt addServicePramt) async {
    ProfileDto?  data =await HelperMethods.getProfile();
    addServicePramt.serviceProviderId=data?.id.toString();

    executeEmitterListener(() => _repository.addService(addServicePramt: addServicePramt));
  }
  editService(AddServicePramt addServicePramt) async {
    ProfileDto?  data =await HelperMethods.getProfile();
    addServicePramt.serviceProviderId=data?.id.toString();
    executeEmitterListener(() => _repository.editService(addServicePramt: addServicePramt));
  }

  deleteService(int id) {
    executeEmitterListener(() => _repository.deleteService(id: id));
  }

  getService( ) async {
    ProfileDto?  data =await HelperMethods.getProfile();
    executeSuccess(
      () => _repository.getService(
        id: data?.id??0,
      ),
    );
  }
  loadingData() async {
    ProfileDto?  data =await HelperMethods.getProfile();
    executeDoubleSuccess(() => _repository.getService(
      id: data?.id??0,
    ),() => _repository.fetchAdvertisement());
  }

  getAllSubService() {
    executeSuccess(
      () => _repository.getAllSubService(),
    );
  }


}
