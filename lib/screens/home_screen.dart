import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/home_cubit.dart';
import '../manager/home_states.dart';
import 'components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (BuildContext context, HomeStates state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              HomeCubit.get(context).openDialog(context, () {
                HomeCubit.get(context).addPerson();
              });
            },
            child: const Icon(Icons.add),
          ),
          body: HomeCubit.get(context).allPersonsDataResponse != null
              ? ListView.builder(
                  itemCount: HomeCubit.get(context)
                          .allPersonsDataResponse
                          ?.users
                          ?.length ??
                      0,
                  itemBuilder: (context, index) => customUserForm(
                      HomeCubit.get(context)
                          .allPersonsDataResponse
                          ?.users?[index], onDelete: (personID) {
                    HomeCubit.get(context).deletePerson(personID);
                  }, onEdit: (person) {
                    HomeCubit.get(context).fillControllers(person);
                    HomeCubit.get(context).openDialog(context, () {
                      HomeCubit.get(context).editPerson(person?.personID ?? -1);
                    });
                  }),
                )
              : const Center(child: Text("loading")),
        );
      },
      listener: (BuildContext context, HomeStates state) {
        if (state is AddPersonSuccessHomeState ||
            state is EditPersonSuccessHomeState) {
          Navigator.of(context).pop();
        }
      },
    );
  }
}
