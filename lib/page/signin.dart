part of '../import_path/import_path.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final GlobalKey _formkey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/icon/pills.png',
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextForm(
                hint: 'Enter you Email',
                textInputType: TextInputType.emailAddress,
                change: (value) {
                  _email = value;
                  return;
                },
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Colors.black,
                  size: 22,
                ),
                vali: (value) {
                  if (value!.isEmpty || value.contains('@')) {
                    return "Invalid Email Adress";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextForm(
                hint: 'Enter Your Password',
                textInputType: TextInputType.emailAddress,
                change: (value) {
                  _password = value;
                },
                prefixIcon: const Icon(
                  Icons.password,
                  color: Colors.black,
                  size: 22,
                ),
                vali: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return "password is incorrect";
                  }
                  return null;
                },
              ),
              const Divider(
                thickness: 2,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
                      (route) => false);
                },
                child: const Text(
                  'No Account? Register',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () {
                        _authService.signInWithEmailAndPassword(
                            _email.trim(), _password.trim(), context);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                            (route) => false);
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )))
            ],
          ),
        ),
      )),
    );
  }
}
