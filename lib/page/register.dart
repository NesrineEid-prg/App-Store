part of '../import_path/import_path.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
      body: SingleChildScrollView(
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
              hint: 'Enter you Emsil',
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
              textInputType: TextInputType.visiblePassword,
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
            const SizedBox(
              height: 30,
            ),
            TextForm(
              hint: 'Enter Your Password',
              textInputType: TextInputType.visiblePassword,
              change: (value) {
                _password = value;
              },
              prefixIcon: const Icon(
                Icons.password,
                color: Colors.black,
                size: 22,
              ),
              vali: (value) {
                if (value != _password) {
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
                    MaterialPageRoute(builder: (context) => const SignIn()),
                    (route) => false);
              },
              child: const Text(
                'Al Ready have an account ? SignIn',
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
                      _authService.signUpWithEmailAndPassword(
                          _email.trim(), _password.trim(), context);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()),
                          (route) => false);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )))
          ],
        ),
      )),
    );
  }
}
