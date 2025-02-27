import 'package:flutter_basf_test/core/services/network_service/network_service.dart';
import 'package:flutter_basf_test/core/services/trivials_network_service/trivials_network_service_contracts.dart';
import 'package:flutter_basf_test/core/services/trivials_network_service/trivials_network_service_response.dart';

TrivialsNetworkSevice getTrivialsNetworkSevice({
  NetworkService? networkService,
}) {
  return TrivialsNetworkSevice(
    networkService: networkService ?? NetworkService(),
  );
}

class TrivialsNetworkSevice {
  const TrivialsNetworkSevice({
    required this.networkService,
  });

  final NetworkService networkService;

  Future<List<TrivialsNetworkServiceResponseResults>?> getTrivials() async {
    final response = await networkService.get(
      Uri.parse(TrivialsNetworkServiceContracts.trivialsURL),
    );

    if (!response.success) {
      return null;
    }

    final json = TrivialsNetworkServiceResponse.fromJson(response.body);
    if (json.responseCode != TrivialsNetworkServiceContracts.successCode) {
      return null;
    }

    return json.results;
  }
}
