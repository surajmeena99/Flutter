import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart' as encrypt;

// AES Encryption/Decryption
  // static final key = encrypt.Key.fromUtf8('my 32 length key................');  //ikgd7WQa8pwN2r3s
  static final key = encrypt.Key.fromUtf8('ikgd7WQa8pwN2r3s');
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));
  // final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

  String encryptAES(String text) {
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  String decryptAES(String encryptedText) {
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }

  void login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Map<String, dynamic> map = {};
      map['login_name'] = nameController.text.trim();

      // Encrypt the password before sending it
      String encryptedPassword = encryptAES(passwordController.text.trim());
      map['password'] = encryptedPassword;
      print('Encrypted Password: $encryptedPassword');

      // Decrypt the password (just for demonstration purposes)
      String decryptedPassword = decryptAES(encryptedPassword);
      print('Decrypted Password: $decryptedPassword');

      try {
        final response = await http.post(Uri.parse('${ApiConstant.baseUrl}/${UseLoginApi.usersLogin}'),
          body: json.encode(map),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonData = json.decode(response.body);
          print('jsonData: $jsonData');
          if (jsonData.containsKey('errorMessages')) {
            final errorMessages = jsonData['errorMessages'] as Map<String, dynamic>;
            final errorMessage = errorMessages['message'] ?? 'Unknown error occurred';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardPage(tokenMap: jsonData),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Login Successfully"),
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Invalid login_name and password"),
            ),
          );
        }
      } catch (error) {
        print('Error: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("An error occurred. Please try again later."),
          ),
        );
      }
    }
  }