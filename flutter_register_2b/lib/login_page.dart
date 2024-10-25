import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}
 final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final String statisEmail='anggita@gmail.com';
    final String statisPassword = 'saya123';
class _LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
        backgroundColor: Colors.blueAccent,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 100, color: Colors.blueAccent),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value==null||value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+.[^@]+').hasMatch(value)) {
                    return 'Masukkan email yang valid';
                  }
                  return null;

                },
           
              ),
              //kolom password
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value==null||value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (value.length < 6) {
                    return 'Masukkan password yang valid';
                  }
                  return null;

                },
               obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                     if (emailController.text ==statisEmail &&
                    passwordController.text == statisPassword) {
                      Navigator.pushNamed(context, '/home', arguments:  {
                        'email': emailController.text,
                        'password': passwordController.text
                      });
                    }else{
                      ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar
                      (content: Text
                      ('email atau password salah', 
                      textAlign:  TextAlign.center,)
                      )
                      );
                    }
                  }
                },
                child: Text('login'),
              ),
              TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text('Belum Punya akun ? Daftar'))
          
            ],
          ),
        ),
      ),
    );
  }
}