import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// import '../../../domain/services/hive_service.dart';
import '../../../domain/models/user_details_model.dart';
import '../../../domain/services/session_service.dart';
import '../../widgets/progress_step.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();

  late ClerkAuthState _auth;

  bool _loading = false;
  bool _isOtpStep = false;
  bool _isLogin = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _auth = ClerkAuth.of(context);

      if (_auth.user != null) {
        _navigateToHome(_auth.user!.id);
      }

      _auth.addListener(_handleUserChange);
    });
  }

  // void _handleUserChange() {
  //   final user = _auth.user;
  //   if (user != null) {
  //     _navigateToHome(user.id);
  //   }
  // }

void _handleUserChange() async {
  final user = _auth.user;
  if (user != null) {
         _navigateToHome(user.id);
  }
}

 

Future<void> _navigateToHome(String userId) async {
 
  await SessionService.saveUserId(userId);

 
  final box = Hive.box<UserDetailsModel>('userBox');
  final user = box.get(userId);

  if (!mounted) return;

  
  if (user == null) {
    context.go('/signup-age');
    return;
  }

  if(user.age == null || user.gender == null || user.interests == null || user.interests!.isEmpty) {
      print('Incomplete profile for user: $userId');

    context.go('/signup-age');
    return;
  }


  context.go('/home');
}


  Future<void> _sendOtp() async {
    setState(() => _loading = true);

    try {
      if (_isLogin) {
        await _auth.attemptSignIn(
          strategy: clerk.Strategy.emailCode,
          identifier: _emailController.text.trim(),
        );
      } else {
        await _auth.attemptSignUp(
          strategy: clerk.Strategy.emailCode,
          emailAddress: _emailController.text.trim(),
        );
      }

      setState(() => _isOtpStep = true);
    } catch (e) {
      _showError(e.toString());
    }

    setState(() => _loading = false);
  }

  Future<void> _verifyOtp() async {
    setState(() => _loading = true);

    try {
      if (_isLogin) {
        await _auth.attemptSignIn(
          strategy: clerk.Strategy.emailCode,
          code: _otpController.text.trim(),
        );
      } else {
        await _auth.attemptSignUp(
          strategy: clerk.Strategy.emailCode,
          code: _otpController.text.trim(),
        );
      }
    } catch (e) {
      _showError(e.toString());
    }

    setState(() => _loading = false);
  }

  Future<void> _googleSignIn() async {
    setState(() => _loading = true);

    try {
      if (_auth.user != null) {
        _navigateToHome(_auth.user!.id);
        return;
      }

      await _auth.ssoSignIn(context, clerk.Strategy.oauthGoogle);
    } catch (e) {
      _showError(e.toString());
    }

    setState(() => _loading = false);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    _auth.removeListener(_handleUserChange);
    _emailController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

            // TOP IMAGE SECTION
            Stack(
              children: [
                SizedBox(
                  height: mq.height * 0.30,
                  width: double.infinity,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=800',
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  height: mq.height * 0.30,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                ),

                if (_isOtpStep)
                  Positioned(
                    top: 45,
                    left: 15,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios,
                          color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _isOtpStep = false;
                          _otpController.clear();
                        });
                      },
                    ),
                  ),

                if (_isOtpStep)
                  const Positioned(
                    top: 55,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: StepIndicator(currentIndex: 2),
                    ),
                  ),

              ],
            ),

            // FORM SECTION
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: mq.width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: mq.height * 0.05),

                  Text(
                    _isOtpStep
                        ? "Enter verification code"
                        : _isLogin
                            ? "Welcome back 👋"
                            : "Create your account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mq.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: mq.height * 0.04),

                  if (!_isOtpStep)
                    _buildInputField(
                        controller: _emailController,
                        label: "Email",
                        hint: "example@email.com"),

                  if (_isOtpStep)
                    _buildInputField(
                        controller: _otpController,
                        label: "OTP",
                        hint: "Enter 6 digit code",
                        keyboard: TextInputType.number),

                  const SizedBox(height: 25),

                  _buildPrimaryButton(mq),

                  const SizedBox(height: 15),

                  if (!_isOtpStep) _buildGoogleButton(),

                  const SizedBox(height: 20),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                          _isOtpStep = false;
                        });
                      },
                      child: Text(
                        _isLogin
                            ? "Don't have an account? Sign Up"
                            : "Already have an account? Login",
                        style: const TextStyle(color: Color.fromARGB(255, 204, 202, 202), fontSize: 14),
                      ),
                    ),
                  ),

                  SizedBox(height: mq.height * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboard = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white24),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white38),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton(Size mq) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: _loading
            ? null
            : () => _isOtpStep ? _verifyOtp() : _sendOtp(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: _loading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                _isOtpStep
                    ? "Verify OTP"
                    : _isLogin
                        ? "Continue"
                        : "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: mq.width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  Widget _buildGoogleButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton.icon(
        onPressed: _loading ? null : _googleSignIn,
        icon: const Icon(Icons.g_mobiledata, color: Colors.white),
        label: const Text(
          "Continue with Google",
          style: TextStyle(color: Colors.white),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white38),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

