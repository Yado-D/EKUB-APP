import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_snackbar.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:flutter/material.dart';

class AccountInformationScreen extends StatefulWidget {
  @override
  _AccountInformationScreenState createState() =>
      _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  String _username = 'Yared';
  String _email = 'yared@example.com';
  String _phone = '+251993157092';
  String _password = '123456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 30,
          ),
        ),
        title: Text('Account Information'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveChanges,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildAvatarSection(),
              SizedBox(height: 24),
              _buildAccountFormFields(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/profile/yared.png'),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Change Profile Picture'),
        ),
      ],
    );
  }

  Widget _buildAccountFormFields() {
    return Column(
      children: [
        TextFormField(
          style: TextStyle(color: Colors.black),
          initialValue: _username,
          decoration: InputDecoration(
            labelText: 'Username',
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a username';
            }
            return null;
          },
          onSaved: (value) => _username = value ?? _username,
        ),
        SizedBox(height: 16),
        TextFormField(
          style: TextStyle(color: Colors.black),
          initialValue: _email,
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty || !value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
          onSaved: (value) => _email = value ?? _email,
        ),
        SizedBox(height: 16),
        TextFormField(
          style: TextStyle(color: Colors.black),
          initialValue: _phone,
          decoration: InputDecoration(
            labelText: 'Phone Number',
            prefixIcon: Icon(Icons.phone),
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a phone number';
            }
            return null;
          },
          onSaved: (value) => _phone = value ?? _phone,
        ),
        SizedBox(height: 16),
        TextFormField(
          style: TextStyle(color: Colors.black),
          initialValue: _password,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty || value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          onSaved: (value) => _password = value ?? _password,
        ),
        SizedBox(height: 24),
        InkWell(
          onTap: _saveChanges,
          child: Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.all(10),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorCollections.GreenColor,
            ),
            child: Center(
              child: ReusableText(
                TextString: "Save Changes",
                FontSize: 18,
              ),
            ),
          ),
        )
      ],
    );
  }

  void _saveChanges() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      commonSnackBar(
        context,
        "Account information updated",
        Colors.black,
      );
    }
  }
}
