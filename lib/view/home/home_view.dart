import 'package:demo_app/models/user.dart';
import 'package:demo_app/res/string_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConfig.userDetailTitle),
      ),
      body: Obx(() {
        return controller.usersList.value.isNotEmpty
            // For show data  from Network
            ? buildUserListWidget(controller.usersList.value)
            // If network data not available then show data from Local
            : controller.localUsersData.value.isNotEmpty
                ? buildUserListWidget(controller.localUsersData.value)
                // No local data available then Check if API call in progress
                : controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    // API  call completed and local and network data  not availabe thenn show  no data msg
                    : const Center(
                        child: Text(StringConfig.noDataFoundMsg),
                      );
      }),
    );
  }

  Widget buildUserListWidget(List<Results> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(
            Icons.account_circle_sharp,
            size: 40,
          ),
          subtitle: Text(
            users[index].email!,
          ),
          title: Text(
            '${users[index].name?.first} ${users[index].name?.last}',
          ),
        );
      },
    );
  }
}
