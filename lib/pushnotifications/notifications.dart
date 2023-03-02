import 'dart:convert';
import '/comman/bottom_bar.dart';
import '/comman/utils.dart';
import '/core/app_theme/theme_generator.dart';
import '/pushnotifications/models/allnotificationsmodel.dart';
import '/pushnotifications/notifications_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class NotificationPage extends StatefulWidget {
  final List<Table>? data;
  const NotificationPage({Key? key, this.data}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String notificationLogAttributes = "2";

  @override
  void initState() {
    checkBoxList;
    _callApi();
    super.initState();
  }

  _callApi() async {
    await Provider.of<NotificationProvider>(context, listen: false)
        .getAllNotifications();
  }

  final selectAll = CheckBoxModel(title: 'SelectAll', value: false);
  List selectedCategories = [];

  List<CheckBoxModel> checkBoxList = [
    CheckBoxModel(title: 'Roaster', value: false),
    CheckBoxModel(title: 'RECALL', value: false),
    CheckBoxModel(title: 'RECALL', value: false),
  ];

  void _onCategorySelected(bool selected, categoryId) {
    if (selected == true) {
      setState(() {
        selectedCategories.add(categoryId);
      });
    } else {
      setState(() {
        selectedCategories.remove(categoryId);
      });
    }
  }

  removeAllCheckItems(index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Checkbox(
            splashRadius: 1,
            focusColor: Colors.white,
            checkColor: ThemeGenerator().buttonColor,
            activeColor: Colors.grey,
            value: selectAll.value,
            onChanged: (value) => onAllClicked(selectAll),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              selectAll.title,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () async {
              debugPrint("selected categories $selectedCategories");
              await Provider.of<NotificationProvider>(context, listen: false)
                  .getDeleteNotifications(
                context,
                selectedCategories.join(',').toString(),
                notificationLogAttributes,
              )
                  .then((value) async {
                Provider.of<NotificationProvider>(context, listen: false)
                    .getAllNotifications();
              });

              debugPrint("selected things ${selectedCategories.join(',')}");
            },
            child: Image.asset(
              "assets/images/bin.png",
              height: 10,
              width: 20,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        automaticallyImplyLeading: false,
        elevation: 0,
        title: _appBar(),
        backgroundColor: ThemeGenerator().headerColor,
      ),
      body: _body(
          context) /*Center(child: Container(height: 500, width: 200, color: Colors.red,),)*/,
      // bottomNavigationBar: const BottomBar(),
    );
  }

  _body(BuildContext context) {
    return Consumer<NotificationProvider>(builder: (context, provider, child) {
      debugPrint(
          'Notifications length: ${provider.allNotifition?.table?.length}');
      if ((provider.allNotifition?.table == null)) {
        return Center(
          child: Text(
            'No notifications available',
            style: TextStyle(color: ThemeGenerator().headerColor),
          ),
        );
      }
      return Card(
        child: ListView.builder(
            itemCount: provider.allNotifition?.table?.length,
            itemBuilder: (BuildContext context, int index) {
              NotificationTable? notificationData = NotificationTable();
              if (provider.allNotifition?.table != null &&
                  provider.allNotifition!.table!.isNotEmpty) {
                notificationData =
                    provider.allNotifition?.table!.elementAt(index);
              }
              return Dismissible(
                  key: Key(notificationData?.recordID.toString() ?? '23456'),
                  onDismissed: (direction) async {
                    debugPrint("index in dismissed $index");
                    debugPrint("notification dismiss $notificationData");
                    String? pushNotificationData =
                        notificationData?.pushNotificationData;
                    Map data = json.decode(pushNotificationData!);

                    String notificationLogID = data["NotificationLogID"];
                    await Provider.of<NotificationProvider>(context,
                            listen: false)
                        .getDeleteNotifications(context, notificationLogID,
                            notificationLogAttributes)
                        .then((value) async {
                      debugPrint('delete notification resp $value');

                      /// Fetching latest notifications after successful deletion
                      // await _callApi();
                    });
                  },
                  background: refresh(),
                  child: notificationListItemWidget(
                      notificationData?.pushNotificationData,
                      "27/04/22 05:52"));
            }),
      );
    });
  }

  Widget refresh() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20.0),
      color: ThemeGenerator().headerColor,
      child: Icon(
        Icons.delete,
        color: ThemeGenerator().headerTextColor,
      ),
    );
  }

  Widget before() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...checkBoxList
              .map(
                (item) => ListTile(
                  onTap: () => onItemClicked(item),
                  leading: Checkbox(
                    splashRadius: 1,
                    checkColor: ThemeGenerator().buttonColor,
                    activeColor: Colors.grey,
                    value: item.value,
                    onChanged: (value) => onItemClicked(item),
                  ),
                  title: Text(
                    item.title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                ),
              )
              .toList(),
          _dividerLine(),
        ],
      ),
    );
  }

  Widget notificationListItemWidget(
    String? notificationData,
    String dateTime,
  ) {
    Map valueMap = notificationData != null && notificationData.isNotEmpty
        ? json.decode(notificationData)
        : {};
    String title = valueMap["data"]["NotType"];
    String notId = valueMap["data"]["Notid"];
    String buttonValue = valueMap["data"]["ButtonValue"];
    String subtitle = valueMap["data"]["message"];
    String notificationLogID = valueMap["NotificationLogID"];
    return InkWell(
      onTap: () async {
        if (title == "ROSTER") {
          // await Provider.of<NotificationProvider>(context, listen: false)
          //     .recallNotification(context, notId, "0")
          //     .then((value) async {
          DialogBox().showRejectRecall(context, "abcde", notificationLogID);
          // }
          // );
          // Navigator.of(context).push(
          //     MaterialPageRoute(
          //         builder: (context) =>
          //         const StaffRoster()));
        } else if (title == "LEAVE") {
          // Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => const StaffRoster()));
        } else if (title == "RECALL") {
          // /on click of reject button  reply action = 0
          await Provider.of<NotificationProvider>(context, listen: false)
              .recallNotification(context, notId, "0")
              .then((value) async {
            DialogBox().showRejectRecall(context, value, notificationLogID);
          });
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 0, 5),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Checkbox(
                        checkColor: ThemeGenerator().buttonColor,
                        activeColor: Colors.grey,
                        value: selectedCategories.contains(notificationLogID),
                        onChanged: (value) {
                          _onCategorySelected(value!, notificationLogID);
                        },
                      ),
                    )),
                Expanded(
                  child: Column(
                    children: [
                      /// title and date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "27/08/2022",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 80,
                        child: Text(
                          subtitle,
                          // maxLines: 3,
                          style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.jumbo,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            children: List.generate(
                300 ~/ 2,
                (index) => Expanded(
                      child: Container(
                        color: index % 2 == 0 ? Colors.white : Colors.blue,
                        height: 0.8,
                      ),
                    )),
          ),
        ],
      ),
    );
  }

  onAllClicked(CheckBoxModel ckbitem) {
    setState(() {
      final newValue = !ckbitem.value;
      ckbitem.value = newValue;
      for (var element in checkBoxList) {
        element.value = newValue;
      }
    });
  }

  onItemClicked(CheckBoxModel ckbitem) {
    final newValue = !ckbitem.value;
    setState(() {
      ckbitem.value = !ckbitem.value;
      if (!newValue) {
        selectAll.value = false;
      } else {
        final selectAllbox = checkBoxList.every((element) => element.value);
        selectAll.value = selectAllbox;
      }
    });
  }

  Widget _dividerLine() {
    return Column(
      children: [
        Row(
          children: List.generate(
              MediaQuery.of(context).size.width ~/ 2,
              (index) => Expanded(
                    child: Container(
                      color: index % 2 == 0
                          ? Colors.transparent
                          : ThemeGenerator().dottedLineColor,
                      height: 0.6,
                    ),
                  )),
        ),
        const SizedBox(
          height: 3,
        ),
      ],
    );
  }

  Widget _appBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: ThemeGenerator().headerTextColor,
                ),
                Text(
                  'Home',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: ThemeGenerator().headerTextColor),
                ),
              ],
            ),
          ),
          Text(
            'Notifications',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: ThemeGenerator().headerTextColor),
          ),
        ],
      ),
    );
  }
}

class CheckBoxModel {
  String title;
  bool value;
  CheckBoxModel({required this.title, required this.value});
}
