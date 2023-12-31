// ignore_for_file: use_key_in_widget_constructors, implementation_imports, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_import, deprecated_member_use, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:company_tasks_organizer/shared/colors/colors.dart';
import 'package:company_tasks_organizer/shared/components/components.dart';
import 'package:company_tasks_organizer/shared/constants/constants.dart';
import 'package:company_tasks_organizer/shared/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class TodayTasksScreen extends StatefulWidget {
  @override
  State<TodayTasksScreen> createState() => _TodayTasksScreenState();
}

class _TodayTasksScreenState extends State<TodayTasksScreen> {
  final Stream<QuerySnapshot> todayTasksStream = FirebaseFirestore.instance
      .collection(KTodayTasksFire)
      .orderBy('published_time', descending: false)
      .snapshots();
  final Stream<QuerySnapshot> tasksStream = FirebaseFirestore.instance
      .collection(KTasksFire)
      .orderBy('published_time', descending: false)
      .snapshots();

  CollectionReference todayTasks =
      FirebaseFirestore.instance.collection(KTodayTasksFire);
  CollectionReference tasks = FirebaseFirestore.instance.collection(KTasksFire);

  var reportController = TextEditingController();
  var failedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: todayTasksStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                translator.translate('todayTasks'),
              ),
            ),
            body: ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemBuilder: (context, index) {
                  dynamic todaySnapshotID = snapshot.data!.docs[index].id;

                  String employeeName =
                      snapshot.data?.docs[index][KEmployeeNameFire];
                  String clientAddress =
                      snapshot.data?.docs[index][KClientAddressFire];
                  String clientName =
                      snapshot.data!.docs[index][KClientNameFire];
                  String clientPhone =
                      snapshot.data?.docs[index][KClientPhoneFire];
                  String datePicker = snapshot.data?.docs[index][KDateFire];
                  String details = snapshot.data?.docs[index][KDetailsFire];
                  String misionType =
                      snapshot.data!.docs[index][KMisionTypeFire];
                  String giveMission =
                      snapshot.data!.docs[index][KGiveMissionFire];
                  return Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppCubit.get(context).isDark
                            ? HexColor('333739')
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 15,
                              offset: Offset(2, 2)),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      padding: EdgeInsetsDirectional.only(
                        start: 5,
                        end: 2,
                        bottom: 10,
                        top: 10,
                      ),
                      child: Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      'TodayTasksDetailsScreen',
                                      arguments: index,
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                          child: Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: AppCubit.get(context).isDark
                                              ? Colors.green
                                              : Colors.orange,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${index + 1}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 35,
                                            ),
                                          ),
                                        ),
                                      )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              snapshot.data!.docs[index]
                                                  [KClientNameFire],
                                              style: TextStyle(
                                                fontSize: 20,
                                                color:
                                                    AppCubit.get(context).isDark
                                                        ? darkTextLight
                                                        : lightTextLight,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  [KClientAddressFire],
                                              style: TextStyle(
                                                fontSize: 20,
                                                color:
                                                    AppCubit.get(context).isDark
                                                        ? darkTextLight
                                                        : lightTextLight,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SelectableText(
                                              snapshot.data!.docs[index]
                                                  [KClientPhoneFire],
                                              style: TextStyle(
                                                fontSize: 20,
                                                color:
                                                    AppCubit.get(context).isDark
                                                        ? darkTextLight
                                                        : lightTextLight,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  [KMisionTypeFire],
                                              style: TextStyle(
                                                fontSize: 15,
                                                color:
                                                    AppCubit.get(context).isDark
                                                        ? darkTextLight
                                                        : lightTextLight,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['give_mission'],
                                              style: TextStyle(
                                                fontSize: 15,
                                                color:
                                                    AppCubit.get(context).isDark
                                                        ? darkTextLight
                                                        : lightTextLight,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                permission == 'Admin'? Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: myInkwell(
                                        context,
                                        onTap: () => showBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return SingleChildScrollView(
                                              child: Container(
                                                color:
                                                    AppCubit.get(context).isDark
                                                        ? HexColor('333739')
                                                        : Colors.white,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        translator.translate(
                                                            'writeYourReport'),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1,
                                                      ),
                                                      SizedBox(
                                                        height: 7,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            reportController,
                                                        minLines: 10,
                                                        maxLines: null,
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        decoration:
                                                            InputDecoration(
                                                          alignLabelWithHint:
                                                              true,
                                                          border:
                                                              OutlineInputBorder(),
                                                          labelText: translator
                                                              .translate(
                                                                  'enterText'),
                                                          labelStyle: TextStyle(
                                                            color: AppCubit.get(
                                                                        context)
                                                                    .isDark
                                                                ? Colors.white
                                                                : Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      myButton(
                                                          text: translator
                                                              .translate(
                                                                  'submit'),
                                                          textColor: AppCubit.get(
                                                                      context)
                                                                  .isDark
                                                              ? Colors.black
                                                              : Colors.white,
                                                          color: AppCubit.get(
                                                                      context)
                                                                  .isDark
                                                              ? Colors.white
                                                              : Colors.black,
                                                          onPressed: () {
                                                            AppCubit.get(
                                                                    context)
                                                                .addFinishedTaskD(
                                                              employeeName,
                                                              clientAddress,
                                                              clientName,
                                                              clientPhone,
                                                              datePicker,
                                                              details,
                                                              misionType,
                                                              reportController,
                                                              giveMission,
                                                              context,
                                                            );
                                                            //
                                                            String tasksID =
                                                                snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    'tasks_ID'];
                                                            AppCubit.get(
                                                                    context)
                                                                .deleteTask(
                                                                    snapShotID:
                                                                        tasksID,
                                                                    collectionName:
                                                                        tasks);

                                                            AppCubit.get(
                                                                    context)
                                                                .deleteTask(
                                                                    snapShotID:
                                                                        todaySnapshotID,
                                                                    collectionName:
                                                                        todayTasks);

                                                            setState(() {
                                                              return reportController
                                                                  .clear();
                                                            });

                                                            Navigator.pop(
                                                                context);
                                                          }),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        icon: Icons.done_outline_rounded,
                                        text: translator.translate('done'),
                                        size: 25,
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: myInkwell(
                                        context,
                                        onTap: () => showBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return SingleChildScrollView(
                                              child: Container(
                                                color:
                                                    AppCubit.get(context).isDark
                                                        ? HexColor('333739')
                                                        : Colors.white,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        translator.translate(
                                                            'reasonsForMissionFailure'),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1,
                                                      ),
                                                      SizedBox(
                                                        height: 7,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            failedController,
                                                        onFieldSubmitted:
                                                            (value) {
                                                          setState(() {});
                                                        },
                                                        minLines: 10,
                                                        maxLines: null,
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        decoration:
                                                            InputDecoration(
                                                          alignLabelWithHint:
                                                              true,
                                                          border:
                                                              OutlineInputBorder(),
                                                          labelText: translator
                                                              .translate(
                                                                  'enterText'),
                                                          labelStyle: TextStyle(
                                                            color: AppCubit.get(
                                                                        context)
                                                                    .isDark
                                                                ? Colors.white
                                                                : Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      myButton(
                                                          text: translator
                                                              .translate(
                                                                  'submit'),
                                                          textColor: AppCubit.get(
                                                                      context)
                                                                  .isDark
                                                              ? Colors.black
                                                              : Colors.white,
                                                          color: AppCubit.get(
                                                                      context)
                                                                  .isDark
                                                              ? Colors.white
                                                              : Colors.black,
                                                          onPressed: () {
                                                            AppCubit.get(
                                                                    context)
                                                                .addFinishedTaskF(
                                                              employeeName,
                                                              clientAddress,
                                                              clientName,
                                                              clientPhone,
                                                              datePicker,
                                                              details,
                                                              misionType,
                                                              failedController,
                                                              giveMission,
                                                              context,
                                                            );

                                                            String tasksID =
                                                                snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    'tasks_ID'];
                                                            AppCubit.get(
                                                                    context)
                                                                .deleteTask(
                                                                    snapShotID:
                                                                        tasksID,
                                                                    collectionName:
                                                                        tasks);
                                                            AppCubit.get(
                                                                    context)
                                                                .deleteTask(
                                                                    snapShotID:
                                                                        todaySnapshotID,
                                                                    collectionName:
                                                                        todayTasks);

                                                            setState(() {
                                                              return failedController
                                                                  .clear();
                                                            });

                                                            Navigator.pop(
                                                                context);
                                                          }),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        icon: Icons.sms_failed_rounded,
                                        text: translator.translate('failed'),
                                        size: 25,
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                        icon: Icon(
                                          Icons.delete_forever_rounded,
                                          size: 35,
                                          color: Colors.redAccent,
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return CupertinoAlertDialog(
                                                title: Text(translator
                                                    .translate('alert')),
                                                content: Text(translator
                                                    .translate('missionAlert')),
                                                actions: [
                                                  CupertinoDialogAction(
                                                    child: Text(translator
                                                        .translate('yes')),
                                                    onPressed: () {
                                                      AppCubit.get(context)
                                                          .deleteTask(
                                                              snapShotID:
                                                                  todaySnapshotID,
                                                              collectionName:
                                                                  todayTasks);
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  CupertinoDialogAction(
                                                    child: Text(translator
                                                        .translate('no')),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  )
                                                ],
                                              );
                                            },
                                          );
                                        }),
                                  ],
                                ) : SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                },
                itemCount: snapshot.data!.size),
          );
        } else {
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      color: Colors.black,
                    ),
                  ],
                ),
              ));
        }
      },
    );
  }
}
