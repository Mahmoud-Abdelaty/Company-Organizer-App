// ignore_for_file: use_key_in_widget_constructors, implementation_imports, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sized_box_for_whit, avoid_print, sort_child_properties_last, avoid_unnecessary_containers, deprecated_member_use, sized_box_for_whitespace, unnecessary_null_comparison, no_leading_underscores_for_local_identifiers, import_of_legacy_library_into_null_safe, unnecessary_new

import 'package:company_tasks_organizer/shared/components/components.dart';

import 'package:company_tasks_organizer/shared/cubit/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../../shared/cubit/cubit.dart';

class AnnounceScreen extends StatefulWidget {
  @override
  State<AnnounceScreen> createState() => _AnnounceScreenState();
}

class _AnnounceScreenState extends State<AnnounceScreen> {
  @override
  Widget build(BuildContext context) {
    var context1 = context;
    var cubit = AppCubit.get(context);
    var formKey = GlobalKey<FormState>();
    var dateController = cubit.dateController1 = TextEditingController();
    var employeeName = TextEditingController();
    var clientName = TextEditingController();
    var clientPhone = TextEditingController();
    var clientAddress = TextEditingController();
    var detailsController = TextEditingController();
    bool isLoading = false;

    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(translator.translate('announceAMission')),
            ),
            body: Center(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 250.0,
                            child: DropdownButton(
                              items: cubit.dropMenuItems,
                              borderRadius: BorderRadius.circular(15.0),
                              hint: Text(
                                translator.translate('missionType'),
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              value: cubit.newValue,
                              isExpanded: true,
                              onChanged: (String? value) {
                                cubit.dropValue(value);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultTextFormField(
                            controller: dateController,
                            labelText: translator.translate('taskDate'),
                            prefixIcon: Icons.calendar_today,
                            type: TextInputType.datetime,
                            color: cubit.isDark ? Colors.white : Colors.grey,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            onFiledSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                print('Date = ${dateController.text}');
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return translator.translate('pleaseEnterDate');
                              } else {
                                return null;
                              }
                            },
                            onTap: () {
                              cubit.pickedDate(context1);
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultTextFormField(
                            controller: employeeName,
                            labelText: translator.translate('employeeName'),
                            prefixIcon: Icons.text_fields,
                            type: TextInputType.text,
                            color: cubit.isDark ? Colors.white : Colors.grey,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            onFiledSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                print('Employee Name = ${employeeName.text}');
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return translator
                                    .translate('pleaseEnterYourName');
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultTextFormField(
                            controller: clientName,
                            labelText: translator.translate('clientName'),
                            prefixIcon: Icons.text_fields,
                            suffixIcon: Icons.contacts,
                            suffixOnPressed: () async {
                              AppCubit.get(context)
                                  .addContact(clientName, clientPhone);
                            },
                            type: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 2,
                            color: cubit.isDark ? Colors.white : Colors.grey,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            onFiledSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                print('Client Name = ${clientName.text}');
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return translator
                                    .translate('pleaseEnterClientName');
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultTextFormField(
                            controller: clientPhone,
                            labelText: translator.translate('clientPhone'),
                            prefixIcon: Icons.phone,
                            minLines: 1,
                            maxLines: 3,
                            type: TextInputType.multiline,
                            color: cubit.isDark ? Colors.white : Colors.grey,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            onFiledSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                print('Client Phone = ${clientPhone.text}');
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return translator
                                    .translate('pleaseEnterClientPhone');
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultTextFormField(
                            minLines: 1,
                            maxLines: 5,
                            controller: clientAddress,
                            labelText: translator.translate('clientAddress'),
                            prefixIcon: Icons.location_on,
                            type: TextInputType.multiline,
                            color: cubit.isDark ? Colors.white : Colors.grey,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            onFiledSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                print('Client Address = ${clientAddress.text}');
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return translator
                                    .translate('pleaseEnterClientAddress');
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultTextFormField(
                            minLines: 1,
                            maxLines: 15,
                            controller: detailsController,
                            labelText: translator.translate('details'),
                            prefixIcon: Icons.details,
                            type: TextInputType.multiline,
                            color: cubit.isDark ? Colors.white : Colors.grey,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            onFiledSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                print('Details = ${detailsController.text}');
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return translator
                                    .translate('pleaseEnterDetails');
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  isLoading = true;
                  cubit.addTask(dateController, employeeName, clientName,
                      clientPhone, clientAddress, detailsController, context);

                  isLoading = false;

                  Navigator.pop(context);
                }
              },
              child: Text(translator.translate('submit')),
            ),
          );
        });
  }
}
