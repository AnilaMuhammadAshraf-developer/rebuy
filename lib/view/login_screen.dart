import 'package:flutter/material.dart';
import 'package:rebuy/controllers/user_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    late UserController userController;
    final _formKey = GlobalKey<FormState>();
    String email = '';
    String password = '';
    bool obp = true;
    

     @override
  void initState() {
    super.initState();
    userController = UserController(); 
  }

  @override
  void dispose() {
    userController.dispose(); 
    super.dispose();
  }
    void togglePasswordVisibility() {
      setState((){
         obp=!obp;
      });
       
    }

   String? passwordValidator(String? value){
    if(value==null || value.isEmpty){
        return "Please enter password.";
    }
    if(value.length < 8){
      return "Please enter at least 8 characters for the password";
    }
       return null;
   }




   String? emailValidator(String? value){

     if(value==null || value.isEmpty){
       return "Please enter email.";
     }

      return null;
   }

   Future<void> login() async {
    if (_formKey.currentState?.validate() ?? false) { 
           _formKey.currentState?.save();
           debugPrint("ui ka email:${_emailController.text}");
           Map<String, dynamic> apiResponse = {};
          List result =await userController.login(_emailController.text,_passwordController.text);
          
           setState(() {
    apiResponse = result.isNotEmpty ? result[0] : {};

  });
           debugPrint("api ka response:$apiResponse");
    }
   }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 50.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("ReBuy",
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 32))
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Log in",
                      style: TextStyle(fontSize: 48, fontWeight: FontWeight.w800))
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Login with one of the following options",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF828282)))
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 1.0, left: 50.0),
              child: Row(
                children: [
                  customContainer('assets/images/Google.png'),
                  const SizedBox(width: 30.0),
                  customContainer('assets/images/Twitter.png'),
                  const SizedBox(width: 30.0),
                  customContainer('assets/images/Apple.png'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(top: 1.0, left: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  dividerContainer(),
                  const SizedBox(width: 10),
                  const Text("Or",
                      style: TextStyle(color: Color(0xFF828282), fontSize: 12)),
                  const SizedBox(width: 10),
                  dividerContainer(),
                ],
              ),
            ),
            formContainer(_emailController, _passwordController, context,
                _formKey, email, password, obp),
          ],
        )),
      );
    }



Widget customContainer(img) {
  return Container(
      width: 90,
      height: 57,
      decoration: const BoxDecoration(
        color: Color(0xFFDEDEDE),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Image.asset(img, width: 10, height: 10));
}


Widget dividerContainer() {
  return Container(
      width: 150,
      child: const Expanded(child: Divider(color: Color(0xFF6F6F6F))));
}


Widget formContainer(TextEditingController emailController, passwordController,
    context, formKey, email, password, obp) {
  return Container(
    margin: const EdgeInsets.only(left: 50.0, top: 20.0),
    width: MediaQuery.of(context).size.width - 150,
    height: MediaQuery.of(context).size.height,
    child: Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: "Email", hintText: "Enter your email"),
              onSaved: (value) {
                email = value ?? '';
              },
              validator: emailValidator,
              maxLength: 30,
               buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) {
                return null;
              },
              
              ),
          const SizedBox(height: 10),
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obp,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              suffixIcon: IconButton(
                  icon: Icon(
                    obp ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    togglePasswordVisibility();
                  }),
            ),
            onSaved: (value) {
              password = value ?? '';
            },
            validator:passwordValidator,
            maxLength: 10,
            buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) {
              return null; 
            },
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              login();
            },
            child: buttonContainer(context),
          ),
        ],
      ),
    ),
  );
}



Widget buttonContainer(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 56,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
          colors: [Color(0xFFFF5A5F), Color(0xFFC1839F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      borderRadius: BorderRadius.circular(30.0),
    ),
    alignment: Alignment.center,
    child: const Text("Log in",
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700)),
  );
}







}







