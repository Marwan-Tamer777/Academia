import '../../network/app_service/app_api.dart';

abstract class RemoteAPIDataSource {
}

class RemoteAPIDataSourceImpl implements RemoteAPIDataSource {
  final AppAPIServiceClient appServiceClient;

  RemoteAPIDataSourceImpl(this.appServiceClient);


}


