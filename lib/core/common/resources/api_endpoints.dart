import 'dart:core';

class ApiEndPoints {
  static const baseUrl = "3.6.94.37:3000";

  static const brokerSignUp = "/api/broker/register";
  static const brokerLogin = "/api/broker/login";

  static const brokerProfile = "/api/broker/profile";
  static const allBrokersData = "/api/broker/fetch-all";
  static const deleteBroker = "/api/broker/delete";
  static const editBroker = "/api/broker/edit";
  static const forgotPasswordBroker = "/api/broker/forgot-password";
  static const brokerChangePassword = "/api/broker/change-password";
  static const resetPasswordBroker = "/api/broker/reset-password";
  static const verifyOtpBroker = "/api/broker/verify-otp";
  static const deleteTenent = "/api/tenent/delete";
  static const editTenent = "/api/tenent/edit";
  static const forgotPasswordTenent = "/api/tenent/forgot-password";
  static const tenentChangePassword = "/api/tenent/change-password";
  static const resetPasswordTenent = "/api/tenent/reset-password";
  static const verifyOtpTenent = "/api/tenent/verify-otp";
  static const brokerNewTenentRegister = "/api/tenent/register";
  static const tenentLogin = "/api/tenent/login";
  static const tenentProfile = "/api/tenent/profile";
  static const fetchAllTenent = "/api/tenent/fetch-all";
  static const addProperty = "api/property/add";
  static const fetchAllProperty = "/api/property/fetch-all";
  static const brokerFetchProertyById = "/api/property/fetch/";
  static const brokerdeletePropertyById = "/api/property/delete";
  static const brokerRemoveFlatById = "/api/property/remove-flat";
  static const brokerEditFlatById = "/api/property/edit-flat";
  static const brokerEditAptAddFlat = "/api/property/add-flat";
  static const brokerEditAptNameAndAddress = "api/property/edit-appartment";
  static const brokerAddNewHouse = "/api/house/add";
  static const brokerFetchProertyHouseById = "api/house/fetch";
  static const brokerdeleteHouseById = "api/house/delete";
  static const brokerHouseAddFlat = "/api/house/add-flat";
  static const brokerHouseEditFlat = "/api/house/edit-flat";
  static const brokerEditHouseFlat = "api/house/edit-house";
  static const brokerHouseRemoveFlat = "/api/house/remove-flat";

  static const brokerPgAdd = "/api/pg/add";
  static const brokerPgAddFlatDetails = "/api/pg/add-flat";
  static const brokerFetchPgById = "api/pg/fetch";

  static const brokerEditPgDetails = "api/pg/edit-pg";
  static const brokerPgAddNewFlat = "api/pg/add-new-flats";
  static const brokerPgAddRemoveBed = "/api/pg/add-remove-bed";
  static const brokerRemovePgFlat = "/api/pg/remove-flat";
  static const brokerRemovePgBed = "/api/pg/add-remove-bed";

  static const brokerEditTenant = "/api/tenent/edit-profile";

  static const brokerFetchAllTenants = "/api/broker/fetch-all-tenents";

  static const brokerFetchTenantsByPropType = '/api/broker/fetch-tenents';
  static const brokerFetchTenantPropById = '/api/broker/fetch-tenent-property';
}
