import 'package:emergency_buddy/domain/entities/first_aid_home_page_model.dart';
import 'package:emergency_buddy/domain/entities/first_aid_listing_model.dart';
import 'package:emergency_buddy/domain/entities/first_aid_model.dart';
import 'package:emergency_buddy/domain/repositories/first_aid_repository.dart';

class GetHomeScreenFirstAidListingUseCase {
  final FirstAidRepository firstAidRepository;

  GetHomeScreenFirstAidListingUseCase({required this.firstAidRepository});

  Future<List<FirstAidHomePageData>> execute() async {
    return await (firstAidRepository.getHomePageListing());
  }
}
