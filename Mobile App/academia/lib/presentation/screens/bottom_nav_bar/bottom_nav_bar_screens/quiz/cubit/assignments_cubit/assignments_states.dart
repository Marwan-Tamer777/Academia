abstract class AssignmentsStates {} 

class AssignmentsInitial extends AssignmentsStates {}

class GetAssignmentsLoadingState extends AssignmentsStates {} 

class GetAssignmentsSuccessState extends AssignmentsStates {}

class GetAssignmentsErrorState extends AssignmentsStates { 
  final String error; 
  GetAssignmentsErrorState(this.error); 
}

class FilePickingState extends AssignmentsStates {}

class FileUploadProgressState extends AssignmentsStates {
  final double progress;
  final int fileSize; // Add fileSize to the state
  FileUploadProgressState(this.progress, this.fileSize);
}

class FileUploadSuccessState extends AssignmentsStates {}

class FileUploadErrorState extends AssignmentsStates {
  final String error;

  FileUploadErrorState(this.error);
}



