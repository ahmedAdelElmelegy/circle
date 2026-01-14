import 'package:circle/core/network/network_provider.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/custom_error_widget.dart';
import 'package:circle/features/home/logic/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Tasks"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.h),
          child: const NetworkStatusBanner(),
        ),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, provider, child) {
          switch (provider.status) {
            case TaskStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case TaskStatus.error:
              return CustomErrorWidget(
                errMessage: provider.errorMessage ?? "An error occurred",
                onRetry: () => provider.fetchTasks(),
              );
            case TaskStatus.loaded:
              return ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: provider.tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.task_alt,
                          color: ColorManger.primary),
                      title: Text(provider.tasks[index]),
                    ),
                  );
                },
              );
            case TaskStatus.initial:
            default:
              return Center(
                child: ElevatedButton(
                  onPressed: () => provider.fetchTasks(),
                  child: const Text("Load Tasks"),
                ),
              );
          }
        },
      ),
    );
  }
}

class NetworkStatusBanner extends StatelessWidget {
  const NetworkStatusBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final networkStatus = context.watch<NetworkProvider>().status;
    final isOffline = networkStatus == NetworkStatus.offline;

    if (!isOffline) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      color: Colors.redAccent,
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, size: 14.sp, color: Colors.white),
          SizedBox(width: 8.w),
          Text(
            "You are currently offline",
            style:
                TextStyles.font14MadaRegularBlack.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
