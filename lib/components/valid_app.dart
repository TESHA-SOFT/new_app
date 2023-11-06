class ValidApp{
  String? validateEmail(String? email) {
    RegExp emailRegax = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegax.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password!.length < 8) {
      return 'The password must be at least 8 characters long';
    }
    return null;
  }
} 