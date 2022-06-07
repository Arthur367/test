import '../../../../core/common/data/models/models.dart';
import '../models/user_model.dart';

/// Contains different data models related to the user
///
/// this data is [UserModel], [TokenModel], [StoreModel], [LocationModel]
class AuthResponse {
  final UserModel userModel;
  final TokenModel tokenModel;
  final StoreModel storeModel;
  final LocationModel locationModel;

  AuthResponse({
    required this.userModel,
    required this.tokenModel,
    required this.storeModel,
    required this.locationModel,
  });
}
