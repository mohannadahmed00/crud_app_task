import 'package:appy_innovate_task/responses/AllPersonsDataResponse.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../responses/PersonDataResponse.dart';

class ApiManager {
  final baseUrl = "http://mohagado-001-site1.itempurl.com";
  var dio = Dio();

  ApiManager();

  Future<Either<String, AllPersonsDataResponse>> getAllUsers() async {
    try {
      var response = await dio.get("$baseUrl/Person/getAllPersons");
      return Right(AllPersonsDataResponse.fromJson(response.data));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, PersonDataResponse>> addPerson(
      PersonDataResponse personData) async {
    try {
      var response = await dio.post("$baseUrl/Person/addPerson",
          data: personData.toJson());
      return Right(PersonDataResponse.fromJson(response.data));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> editPerson(PersonDataResponse personData) async {
    try {
      var response = await dio.post("$baseUrl/Person/editPerson",
          data: personData.toJson());
      return Right(response.data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> deletePerson(num personID) async {
    try {
      var response = await dio.get("$baseUrl/Person/deletePerson",
          queryParameters: {"personID": personID});
      return Right(response.data as bool);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, PersonDataResponse>> getPersonById() async {
    try {
      var response = await dio.get("$baseUrl/Person/getPersonById");
      return Right(PersonDataResponse.fromJson(response.data));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
