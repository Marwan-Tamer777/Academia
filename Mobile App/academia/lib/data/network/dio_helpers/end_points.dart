abstract class EndPoint {
  //static const String baseUrl = "http://localhost:8080/api";
  static const String baseUrl = "https://academia-hvno.onrender.com/api";

  static const String login = "/auth/login"; 
  static const String resetPassword = "/auth/reset-password/";
  static const String users = "/users";

  static const String courses = "/courses";
  static const String enrollCourse = "/courses/enroll";  
  static const String unEnrollCourse = "/courses/unenroll";

  static const String assignments = "/assignments"; 
  static const String quizzez = "/quiz";
  static const String questions = "/questions"; 

  static const String submitQuiz = "/quizUserInfo/submit";

  static const String posts = "/posts"; 
  static const String comments = "/comments";




}
