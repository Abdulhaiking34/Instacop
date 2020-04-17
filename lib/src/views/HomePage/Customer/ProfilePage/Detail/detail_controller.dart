import 'dart:async';

class DetailUserInfoController {
  StreamController _fullNameController = new StreamController();
  StreamController _addressController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _genderController = new StreamController();
  StreamController _birthdayController = new StreamController();
  StreamController _btnLoadingController = new StreamController();

  Stream get fullNameStream => _fullNameController.stream;
  Stream get addressStream => _addressController.stream;
  Stream get phoneStream => _phoneController.stream;
  Stream get genderStream => _genderController.stream;
  Stream get birthdayStream => _birthdayController.stream;
  Stream get btnLoading => _btnLoadingController.stream;

  onSave({
    String fullName,
    String address,
    String phone,
    String gender,
    String birthday,
  }) {
    _fullNameController.sink.add('');

    int countError = 0;

    if (fullName == '' || fullName == null) {
      _fullNameController.sink.addError('Full name is invalid.');
      countError++;
    }

    if (countError == 0) {
      if (address == '' || address == null) {
        address = '';
      }

      if (phone == '' || phone == null) {
        phone = '';
      }

      if (gender == '' || gender == null) {
        gender = '';
      }

      if (birthday == '' || birthday == null) {
        gender = '';
      }
    }
  }

  void dispose() {
    _fullNameController.close();
    _addressController.close();
    _phoneController.close();
    _genderController.close();
    _birthdayController.close();
    _btnLoadingController.close();
  }
}
