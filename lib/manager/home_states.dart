import 'package:appy_innovate_task/responses/AllPersonsDataResponse.dart';
import 'package:appy_innovate_task/responses/PersonDataResponse.dart';

abstract class HomeStates {}

class InitHomeState extends HomeStates {}

class FailHomeState extends HomeStates {
  String error;

  FailHomeState(this.error);
}

class GetAllPersonsSuccessHomeState extends HomeStates {
  AllPersonsDataResponse allPersonsDataResponse;

  GetAllPersonsSuccessHomeState(this.allPersonsDataResponse);
}

class GetAllPersonsLoadingHomeState extends HomeStates {}

class GetAllPersonsFailHomeState extends FailHomeState {
  GetAllPersonsFailHomeState(super.error);
}

class DeletePersonSuccessHomeState extends HomeStates {
  bool flag;

  DeletePersonSuccessHomeState(this.flag);
}

class DeletePersonLoadingHomeState extends HomeStates {}

class DeletePersonFailHomeState extends FailHomeState {
  DeletePersonFailHomeState(super.error);
}

class AddPersonSuccessHomeState extends HomeStates {
  PersonDataResponse personDataResponse;

  AddPersonSuccessHomeState(this.personDataResponse);
}

class AddPersonLoadingHomeState extends HomeStates {}

class AddPersonFailHomeState extends FailHomeState {
  AddPersonFailHomeState(super.error);
}

class OpenDialogHomeState extends HomeStates {
  bool flag;

  OpenDialogHomeState(this.flag);
}

class EditPersonSuccessHomeState extends HomeStates {
  bool flag;

  EditPersonSuccessHomeState(this.flag);
}

class EditPersonLoadingHomeState extends HomeStates {}

class EditPersonFailHomeState extends HomeStates {
  String error;

  EditPersonFailHomeState(this.error);
}
