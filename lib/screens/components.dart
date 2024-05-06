import 'package:appy_innovate_task/responses/PersonDataResponse.dart';
import 'package:flutter/material.dart';

Widget customUserForm(
  PersonDataResponse? personDataResponse, {
  required Function(num) onDelete,
  required Function(PersonDataResponse?) onEdit,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
          color: Colors.grey,
          child: Text(
            "personID: ${personDataResponse?.personID}",
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          )),
      Text("name: ${personDataResponse?.name}"),
      Text("birthDate: ${personDataResponse?.birthDate}"),
      Text("age: ${personDataResponse?.age}"),
      Text("nationalityID: ${personDataResponse?.nationalityID}"),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            color: Colors.red,
            onPressed: () {
              onDelete(personDataResponse?.personID ?? -1);
            },
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            color: Colors.lightBlue,
            onPressed: () {
              onEdit(personDataResponse);
            },
            child: const Text("Edit", style: TextStyle(color: Colors.white)),
          )
        ],
      )
    ],
  );
}

Widget customEditUserForm({
  PersonDataResponse? personDataResponse,
  required TextEditingController nameController,
  required TextEditingController birthdateController,
  required TextEditingController ageController,
  required TextEditingController nationalityIDController,
  required Function onConfirm,
}) {
  return Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(crossAxisAlignment:CrossAxisAlignment.center,children: [const Expanded(child: Text("name:")), Expanded(flex:3,child: TextField(controller: nameController,)),],),
            Row(crossAxisAlignment:CrossAxisAlignment.center,children: [const Expanded(child: Text("age:")), Expanded(flex:3,child: TextField(controller: ageController,)),],),
            Row(crossAxisAlignment:CrossAxisAlignment.center,children: [const Expanded(child: Text("birthdate:")), Expanded(flex:3,child: TextField(controller: birthdateController,)),],),
            Row(crossAxisAlignment:CrossAxisAlignment.center,children: [const Expanded(child: Text("nationalityID:")), Expanded(flex:3,child: TextField(controller: nationalityIDController,)),],),
            MaterialButton(color:Colors.green,onPressed: (){onConfirm();},child: const Text("Confirm",style: TextStyle(color: Colors.white),),)
          ],
        ),
      ),
    ),
  );
}


Widget customDialog(
    TextEditingController nameController,
    TextEditingController ageController,
    TextEditingController birthdateController,
    TextEditingController nationalityIDController,
    Function onConfirm
    ){
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(child: Text("name:")),
              Expanded(
                  flex: 2,
                  child: TextField(
                    controller: nameController,
                  )),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(child: Text("age:")),
              Expanded(
                  flex: 2,
                  child: TextField(
                    controller: ageController,
                  )),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(child: Text("birthdate:")),
              Expanded(
                  flex: 2,
                  child: TextField(
                    controller: birthdateController,
                  )),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(child: Text("nationalityID:")),
              Expanded(
                  flex: 2,
                  child: TextField(
                    controller: nationalityIDController,
                  )),
            ],
          ),
          MaterialButton(
            color: Colors.green,
            onPressed: () {
              onConfirm();
            },
            child: const Text(
              "Confirm",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    ),
  );
}