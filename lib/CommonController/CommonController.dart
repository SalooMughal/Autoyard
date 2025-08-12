import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CommonContoller extends GetxController{
  RxString bearertoken=''.obs;
  RxString user_First_name=''.obs;
  RxString user_Last_name=''.obs;
  RxString user_Phone_No=''.obs;
  RxString Selected_Status=''.obs;
  RxString Selected_Date=''.obs;
  RxString user_Image=''.obs;
  RxString user_email=''.obs;
  RxInt Selected_Car_Make_id=0.obs;
  RxInt Selected_Car_Model_id=0.obs;
  RxString selectedCarMake = ''.obs;
  var carMakeList = [''].obs;
  var selectedCarModel = ''.obs;
  var carModelList = ['Toyota', 'Honda', 'Ford', 'BMW', 'Mercedes'].obs;
  var carVariantlList = <String>[].obs;
  List carVariant_id_List = [].obs;
  List carBrandList = [].obs;
  TextEditingController Car_Make_Controller=TextEditingController();
  TextEditingController Car_Model_Controller=TextEditingController();
  TextEditingController Car_RegistrationNo_Controller=TextEditingController();
  RxString Car_RegistrationDue_Controller=''.obs;
  TextEditingController Car_Variant_Series_Controller=TextEditingController();
  RxString Car_Built_Controller=''.obs;
  //Automatically get car details variablex
  RxInt Selected_car_id_make=0.obs;
  RxInt Selected_car_id_model=0.obs;
  TextEditingController Car_Engine_Size_Controller=TextEditingController();
  TextEditingController Car_Vin_Controller=TextEditingController();
  TextEditingController Car_Engine_Controller=TextEditingController();
  TextEditingController Car_Odameter_Controller=TextEditingController();
  TextEditingController Car_Body_type_Controller=TextEditingController();
  TextEditingController First_Name_Controller=TextEditingController();
  TextEditingController Last_Name_Controller=TextEditingController();
  TextEditingController ABN_ACN_Controller=TextEditingController();
  TextEditingController License_Controller=TextEditingController();
  TextEditingController Buisness_Controller=TextEditingController();
  TextEditingController Phone_No_Controller=TextEditingController();
  RxString Pickup_Date_Controller=''.obs;
  RxString Date_of_birth_Controller=''.obs;
  TextEditingController Pickup_Address_Controller=TextEditingController();
  TextEditingController Pickup_residential_Address_Controller=TextEditingController();
  TextEditingController Add_Note_Controller=TextEditingController();
  TextEditingController Purchase_Price_Controller=TextEditingController();
  RxBool check_email_verified=false.obs;
  RxInt length_of_assign_car=0.obs;
  RxString Payment_Method=''.obs;
  RxString Car_Conditon=''.obs;
  RxString selected_transmission=''.obs;
  RxBool terms_condition=false.obs;
  var Seller_Signature_Image = Rxn<Uint8List>();
  var Buyer_Signature_Image = Rxn<Uint8List>();

  void setSignatureImage(Uint8List image) {
    Seller_Signature_Image.value = image;
    log('image ${Seller_Signature_Image.value}');
  }
  void BuyerSignatureImage(Uint8List image) {
    Buyer_Signature_Image.value = image;
    log('image ${Buyer_Signature_Image.value}');
  }

  //Car condition
  RxString Car_Driverable=''.obs;
  RxString Car_Accidental=''.obs;
  RxString Car_Wovi=''.obs;
  RxString Car_Finance=''.obs;

  //car id
  int Add_a_Car_id=0;
  void logout() {
    bearertoken.value = '';
    user_First_name.value = '';
    user_Last_name.value = '';
    user_Phone_No.value = '';
    Selected_Status.value = '';
    Selected_Date.value = '';
    user_Image.value = '';
     user_email=''.obs;
     Selected_Car_Make_id=0.obs;
     Selected_Car_Model_id=0.obs;
     selectedCarMake = ''.obs;
     carMakeList = [''].obs;
     selectedCarModel = ''.obs;
     carModelList = ['Toyota', 'Honda', 'Ford', 'BMW', 'Mercedes'].obs;
     carVariantlList = <String>[].obs;
     carVariant_id_List = [].obs;
     carBrandList = [].obs;

    // Clear all TextEditingControllers
    Car_Make_Controller.clear();
    Car_Model_Controller.clear();
    Car_RegistrationNo_Controller.clear();
    Car_RegistrationDue_Controller.value='';
    Car_Variant_Series_Controller.clear();
    Car_Built_Controller.value='';
    Car_Engine_Size_Controller.clear();
    Car_Vin_Controller.clear();
    Car_Engine_Controller.clear();
    Car_Odameter_Controller.clear();
    Car_Body_type_Controller.clear();
    First_Name_Controller.clear();
    Last_Name_Controller.clear();
    ABN_ACN_Controller.clear();
    License_Controller.clear();
    Buisness_Controller.clear();
    Phone_No_Controller.clear();
    Pickup_Date_Controller.value='';
    Date_of_birth_Controller.value='';
    Pickup_Address_Controller.clear();
    Pickup_residential_Address_Controller.clear();
    Add_Note_Controller.clear();
    Purchase_Price_Controller.clear();

    Payment_Method.value = '';
    Car_Conditon.value = '';
    selected_transmission.value = '';
    terms_condition.value = false;

    // Clear signature images
    Seller_Signature_Image.value = null;
    Buyer_Signature_Image.value = null;

    log('User logged out and all data cleared');
  }
  void Clear_Add_A_Car_Details() {
    user_First_name.value = '';
    user_Last_name.value = '';
    user_Phone_No.value = '';
    Selected_Status.value = '';
    Selected_Date.value = '';
    user_Image.value = '';
    user_email=''.obs;
    Selected_Car_Make_id=0.obs;
    Selected_Car_Model_id=0.obs;
    selectedCarMake = ''.obs;
    carMakeList = [''].obs;
    selectedCarModel = ''.obs;
    carModelList = ['Toyota', 'Honda', 'Ford', 'BMW', 'Mercedes'].obs;
    carVariantlList = <String>[].obs;
    carVariant_id_List = [].obs;
    carBrandList = [].obs;

    // Clear all TextEditingControllers
    Car_Make_Controller.clear();
    Car_Model_Controller.clear();
    Car_RegistrationNo_Controller.clear();
    Car_RegistrationDue_Controller.value='';
    Car_Variant_Series_Controller.clear();
    Car_Built_Controller.value='';
    Car_Engine_Size_Controller.clear();
    Car_Vin_Controller.clear();
    Car_Engine_Controller.clear();
    Car_Odameter_Controller.clear();
    Car_Body_type_Controller.clear();
    First_Name_Controller.clear();
    Last_Name_Controller.clear();
    ABN_ACN_Controller.clear();
    License_Controller.clear();
    Buisness_Controller.clear();
    Phone_No_Controller.clear();
    Pickup_Date_Controller.value='';
    Date_of_birth_Controller.value='';
    Pickup_Address_Controller.clear();
    Pickup_residential_Address_Controller.clear();
    Add_Note_Controller.clear();
    Purchase_Price_Controller.clear();

    Payment_Method.value = '';
    Car_Conditon.value = '';
    selected_transmission.value = '';
    terms_condition.value = false;

    // Clear signature images
    Seller_Signature_Image.value = null;
    Buyer_Signature_Image.value = null;

    log('User logged out and all data cleared');
  }

}