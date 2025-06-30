
import 'package:injectable/injectable.dart';

import '../data_sources/support_datasource.dart';
import '../models/add_support_params.dart';

@Injectable()
class SupportRepo {
  final SupportDatasource  apiProvider;
  SupportRepo(this.apiProvider);

  Future<String> contactSupport(AddSupportParams params) async{
    final data = await apiProvider.contactSupport(params);
    return data.message();
  }

}