import 'package:circle/core/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum TaskStatus { initial, loading, loaded, error }

class TaskProvider extends ChangeNotifier {
  TaskStatus _status = TaskStatus.initial;
  String? _errorMessage;
  List<String> _tasks = [];

  TaskStatus get status => _status;
  String? get errorMessage => _errorMessage;
  List<String> get tasks => _tasks;

  Future<void> fetchTasks() async {
    _status = TaskStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulating API Call
      await Future.delayed(const Duration(seconds: 2));
      
      // Randomly throw errors for demonstration
      final random = DateTime.now().second % 3;
      if (random == 0) {
        throw Exception("Server connection failed");
      } else if (random == 1) {
        throw DioException(
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.connectionError,
        );
      }

      _tasks = ["Deep Cleaning", "Standard Cleaning", "Dry Cleaning"];
      _status = TaskStatus.loaded;
    } on DioException catch (e) {
      _errorMessage = ServerFailure.fromDioError(e).errMessage;
      _status = TaskStatus.error;
    } catch (e) {
      _errorMessage = UnexpectedFailure(e.toString()).errMessage;
      _status = TaskStatus.error;
    } finally {
      notifyListeners();
    }
  }
}
