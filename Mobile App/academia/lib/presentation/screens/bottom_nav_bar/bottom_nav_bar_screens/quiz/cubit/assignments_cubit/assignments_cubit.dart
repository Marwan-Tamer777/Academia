import 'dart:async';
import 'dart:math';

import 'package:academia/app/constants.dart';
import 'package:academia/data/network/dio_helpers/dio_helpers.dart';
import 'package:academia/data/network/dio_helpers/end_points.dart';
import 'package:academia/domain/models/assignment.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz/cubit/assignments_cubit/assignments_states.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignmentsCubit extends Cubit<AssignmentsStates> {
  // constructor 
  AssignmentsCubit() : super(AssignmentsInitial()); 

  // static method to get the instance of the cubit 
  static AssignmentsCubit get(context) => BlocProvider.of(context); 


  // make a get request to get all assignments from DioHelber class 
  List<Assignment>? assignments; 

  Future<void> getAssignments() async {
    emit(GetAssignmentsLoadingState()); 
    try {
      await DioHelper.getData(url: EndPoint.assignments, token: userToken).then((value) {
          if(value.statusCode == 200) {
            assignments = (value.data as List).map((e) => Assignment.fromJson(e)).toList(); 
            emit(GetAssignmentsSuccessState()); 
          } else { 
            emit(GetAssignmentsErrorState(value.statusMessage.toString()));
          }
        
      }).catchError((error) { 
        emit(GetAssignmentsErrorState(error.toString())); 
      }); 
    } catch (e) {
      emit(GetAssignmentsErrorState(e.toString())); 
    }
  }

Future<void> pickAndUploadFile() async {
  emit(FilePickingState());
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    PlatformFile file = result.files.first; // Assuming single file selection
    int fileSize = file.size; // Get the file size

    emit(FileUploadProgressState(0, fileSize)); // Pass fileSize to the state
    Timer.periodic(Duration(seconds: 1), (timer) {
      double progress = min(1, timer.tick * 0.2);
      emit(FileUploadProgressState(progress, fileSize)); // Update with fileSize
      if (progress == 1) {
        timer.cancel();
        emit(FileUploadSuccessState());
      }
    });
  } else {
    emit(FileUploadErrorState("No file selected"));
  }
} 

void changeStateToInitial() {
  emit(AssignmentsInitial());
}

}