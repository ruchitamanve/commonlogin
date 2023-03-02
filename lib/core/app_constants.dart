class AppConstants {
  /// Common Constants
  ///
  static const String somethingWentWrong =
      'Oops! Something went wrong. Try again later';

  /// Leave Module
  static const String selectTypeOfLeave = 'Please select type of leave';
  static const String selectFromDate = "Please select 'From' date";
  static const String selectToDate = "Please select 'To' date";
  static const String leaveReasonAlert = "Please enter leave reason";
  static const String leaveTypeWarning =
      "You cannot apply leave for selected leave type, after it has been taken. Please contact administrator";
  static const String applyLeaveWarning =
      "Leave should be applied within %@ day(s) of rejoining duty. Do you want to continue?";
  static const String continueWithoutDocument =
      "Do you want to continue without submitting documentary evidence?";
  static const String serverError =
      "The server encountered an error while syncing, please try again";
  static const String passwordChangedByAdmin =
      "Your password has changed. Please login with new password";

  // "Your password got changed. Please login again";
  static const String internetError =
      "Device is offline. Please connect to an active network connection";
  static String getLeaveWarning(int days) {
    return "Leave should be applied within  $days day(s) of rejoining duty. Do you want to continue?";
  }

  static String getLeaveFutureWarning(int days) {
    return "Leave should be applied within  $days day(s) in advance for the selected leave type. Do you want to continue?";
  }
  static String leaveWarningForCurrentDate(int days) {

    return "Leave should be applied $days day(s) in advance for the selected leave type. Do you want to continue?";

  }

  static String leaveCanApplyBefore(int days) {
    return "Leave can only be applied $days day(s) before leave start date. Do you want to continue?";
  }

  static const String syncSuccessMessage = 'Sync Completed Successfully';
  static const String internetErrorMsg = 'Device is offline. Please connect to an active network connection';
}
