abstract class BaseAPIService {
  Future<dynamic> getAPI(String url);

  Future<dynamic> postAPI(Map data, String url);
}
