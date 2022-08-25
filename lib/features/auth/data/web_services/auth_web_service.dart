// import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

// class AuthWebServices {
//   AuthWebServices();

//   login(String email, String password) async {
//     try {
//       final user = ParseUser(email, password, email);
//       ParseResponse response = await user.login();
//       return response.result;
//     } catch (e) {
//       print(e.toString());
//       return {};
//     }
//   }
// }
// //   Future<Map<String, dynamic>> retrievePassword(
// //     String email,
// //   ) async {
// //     try {
// //       Response response = await dio.post(
// //         '',
// //         queryParameters: {
// //           'act': 'forgotPass',
// //           'email': email,
// //         },
// //       );
// //       return response.data;
// //     } catch (e) {
// //       // ignore: avoid_print
// //       print(e.toString());
// //       return {};
// //     }
// //   }
// // }
