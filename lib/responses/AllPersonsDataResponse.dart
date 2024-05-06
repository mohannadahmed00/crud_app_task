import 'PersonDataResponse.dart';
class AllPersonsDataResponse {

  List<PersonDataResponse?>? users;

  AllPersonsDataResponse({
    this.users
  });

  AllPersonsDataResponse.fromJson(List<dynamic> json) {
    users = <PersonDataResponse>[];
    for (var element in json) {
      users?.add(PersonDataResponse.fromJson(element));
    }
  }
}
