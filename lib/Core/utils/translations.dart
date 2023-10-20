import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:iotdemoflutter/Core/utils/common_string.dart';

class MyTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "es": {
          CommonString.login: "acceso",
          CommonString.email: "dirección de correo electrónico",
          CommonString.password: "contraseña",
          CommonString.emailplaceholder:
              "Introduce tu dirección de correo electrónico",
          CommonString.passwordplaceholder: "Ingresa tu contraseña",
          CommonString.fillbelowDetail:
              "Complete los detalles a continuación para continuar.",
          CommonString.newuser: "¿No tienes una cuenta?",
          CommonString.loginsuccess: "¿No tienes una cuenta?",

          CommonString.loginsuccess: "Iniciar sesión exitosamente",

          //SignUp
          CommonString.signup: "Inscribirse",
          CommonString.filldetailforsignup:
              "Ingrese los detalles a continuación para crear una cuenta.",
          CommonString.username: "Nombre",
          CommonString.usersurname: "Apellido",
          CommonString.usernameplaceholder: "Introduzca su nombre",
          CommonString.usersurnameplaceholder: "Ingrese su apellido",
          CommonString.alreadyAccount: "¿Ya tienes una cuenta?",
          Validations.enteremail:
              "Por favor, introduzca su dirección de correo electrónico",
          Validations.entervaildemail:
              "Por favor ingrese su dirección de correo electrónico válida",
          Validations.enterpassword: "Por favor, introduzca su contraseña",
          Validations.entervaildpassword:
              "Por favor ingrese su contraseña válida",
          Validations.msgminpasswordatleast:
              "Introduzca un mínimo de 8 caracteres con combinación.",
          Validations.kMsgPasswordAtleast:
              "Su contraseña debe contener al menos una letra mayúscula, minúscula, números y caracteres especiales.",

          InternetConnection.nointernetconnection: "Sin conexión a Internet",
          InternetConnection.checkinternet:
              "Por favor verifique su conexión a Internet.",
        }
      };
}
