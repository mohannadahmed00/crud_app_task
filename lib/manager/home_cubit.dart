import 'package:appy_innovate_task/screens/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/api_manager.dart';
import '../responses/AllPersonsDataResponse.dart';
import '../responses/PersonDataResponse.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  ApiManager apiManager = ApiManager();

  HomeCubit() : super(InitHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController nationalityIDController = TextEditingController();

  AllPersonsDataResponse? allPersonsDataResponse;

  void getAllPersons() async {
    emit(GetAllPersonsLoadingHomeState());
    var result = await apiManager.getAllUsers();
    result.fold((l) {
      emit(GetAllPersonsFailHomeState(l));
    }, (r) {
      emit(GetAllPersonsSuccessHomeState(r));
      allPersonsDataResponse = r;
    });
  }

  void deletePerson(num personID) async {
    emit(DeletePersonLoadingHomeState());
    var result = await apiManager.deletePerson(personID);
    result.fold((l) {
      emit(DeletePersonFailHomeState(l));
    }, (r) {
      emit(DeletePersonSuccessHomeState(r));
      getAllPersons();
    });
  }

  void addPerson() async {
    PersonDataResponse personData = PersonDataResponse(
      name: nameController.value.text,
      age: num.parse(ageController.value.text),
      birthDate: "2024-05-06T05:26:47.345Z",
      //birthdateController.value.text,
      nationalityID: num.parse(nationalityIDController.value.text),
      personID: 0,
    );
    emit(AddPersonLoadingHomeState());
    var result = await apiManager.addPerson(personData);
    result.fold((l) {
      emit(AddPersonFailHomeState(l));
    }, (r) {
      emit(AddPersonSuccessHomeState(r));
      clearControllers();
      getAllPersons();
    });
  }

  void openDialog(BuildContext context, Function onConfirm) {
    showDialog(
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () async {
          clearControllers();
          return true;
        },
        child: customDialog(nameController, ageController, birthdateController,
            nationalityIDController, () {
          onConfirm();
        }),
      ),
    );
  }

  void clearControllers() {
    nameController.text = "";
    ageController.text = "";
    birthdateController.text = "";
    nationalityIDController.text = "";
  }

  void fillControllers(PersonDataResponse? personData) {
    nameController.text = personData?.name ?? "";
    ageController.text = personData?.age?.toString() ?? "-1";
    birthdateController.text = "2024-05-06T05:26:47.345Z";
    nationalityIDController.text =
        personData?.nationalityID?.toString() ?? "-1";
  }

  void editPerson(num personID) async {
    PersonDataResponse personData = PersonDataResponse(
      name: nameController.value.text,
      age: num.parse(ageController.value.text),
      birthDate: birthdateController.value.text,
      nationalityID: num.parse(nationalityIDController.value.text),
      personID: personID,
    );
    emit(EditPersonLoadingHomeState());
    var result = await apiManager.editPerson(personData);
    result.fold((l) {
      emit(EditPersonFailHomeState(l));
    }, (r) {
      emit(EditPersonSuccessHomeState(r));
      clearControllers();
      getAllPersons();
    });
  }
}
