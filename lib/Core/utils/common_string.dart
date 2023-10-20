import 'package:get/get_navigation/src/routes/transitions_type.dart';

class CommonString  {
  static const Transition transition = Transition.fadeIn;
  static const error = "Error!";
  static const english = "English";
  static const spanish = "Spanish";

  static const login = "Log In";
  static const loginsuccess = "Log In Successfully";

  static const email = "Email Address";
  static const password = "Password";

  static const emailplaceholder = "Enter Your Email Address";
  static const passwordplaceholder = "Enter Your Password";
  static const fillbelowDetail = "Please fill below details to continue.";
  //SignUp
  static const signup = "Sign Up";
  static const newuser = "Don’t have an account? ";
  static const filldetailforsignup = "Please enter the below details to create an account.";
  static const username = "Name";

  static const usersurname = "Sur Name";
  static const usernameplaceholder = "Enter Your Name";
  static const usersurnameplaceholder = "Enter Your Sur Name";
  static const alreadyAccount = "  Already have an account? ";
  //Dashboard
  static const appName = "Smart Lighting";
  static const lightOnAndOff = "LED Light";

  //Drawer
  static const logout = "Logout";
  static const logoutmsg = "Are you sure you want to logout?";
  static const yes = "Yes";
  static const no = "No";
  static const save = "Save";
  static const cancel = "Cancel";

  static const on = "On";
  static const off = "Off";
//Wifi Login
  static const wifiLogin = "Wifi";
  static const connect = "Connect";

  static const wifiSSID= "Wifi SSID";
  static const wifipassword = "Wifi Password";

  static const wifinameplaceholder = "Enter Wifi Name";
  static const wifipasswordplaceholder = "Enter Wifi Password";

//Tabs
  static const settings = "Settings";
  static const profile = "Profile";
  static const devices = "Devices";
// profile
  static const deviceName = "Device Name";
  static const deviceId = "Device Id";
  static const deleteAccount = "Delete Account";


  static const changePassword = "Change Password";
//Device
  static const noOfDevice = "Number of devices";

  static const addDevice = "Add Device";
  static const editDevice = "Edit Device";

  static const devicenameplaceholder = "Enter Device Name";
  static const deviceidplaceholder = "Enter Device Id";
//ChangePassword

  static const oldpassword = "Old Password";
  static const oldpasswordplaceholder = "Enter Old Password";

  static const newpassword = "New Password";
  static const newpasswordplaceholder = "Enter New Password";

  static const confirmpassword = "Confirm Password";
  static const confirmpasswordplaceholder = "Enter Confirm Password";

//settings
  static const wifiSetting = "Wifi";

}

class Validations {
  static const entername = "Please enter your name";
  static const entersurename = "Please enter your sur name";

  static const enteremail = "Please enter your email address";
  static const entervaildemail= "Please enter your vaild email address";

  static const enterpassword = "Please enter your password";

  static const entervaildpassword = "Please enter your vaild password";
  static const msgminpasswordatleast = "Please enter minimum 8 characters with combination.";
  static const kMsgPasswordAtleast = "Your password must contain at least one uppercase letter, lowercase letter, numbers and special characters.";

  static const enterwifiname = "Please enter wifi name";

  static const enterwifipassword = "Please enter wifi password";

  static const entervaildwifipassword = "Please enter vaild wifi password";
  static const msgminwifipasswordatleast = "Please enter minimum 8 characters with combination.";

  static const enterdevicename = "Please enter device name";

  static const enterdeviceid = "Please enter device id";


}

class InternetConnection {
  static const nointernetconnection = "No Internet Connection";
  static const checkinternet = "Please check your internet conntection";
}
