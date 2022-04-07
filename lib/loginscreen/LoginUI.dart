import 'package:taniku/loginscreen/LoginUI2.dart';
import 'package:taniku/loginscreen/LoginUI3.dart';
import 'package:flutter/material.dart';

class loginui extends StatefulWidget {
  const loginui({Key? key}) : super(key: key);

  @override
  State<loginui> createState() => _loginuiState();
}

class _loginuiState extends State<loginui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true ,
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.blue,
        body: SingleChildScrollView(
          child: Container(
          margin: EdgeInsets.all(0),
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage("assets/background2.png"), fit: BoxFit.cover
              //     )
              // ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80, width: 60,),
            Image.asset("assets/logo3.png", width: 80, height: 80,),
          const SizedBox(height: 40,),
          const Text("Avron",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 80
            ),),
          const SizedBox(height: 20,),
          const Text("Project Android",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20
            ),),
          SizedBox(height: 40, width: 70,),

                const SizedBox(
                  height: 20,
                ),
                Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const singup(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Colors.lightBlueAccent,
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  ]
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const signin(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Colors.white,
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.lightBlue,
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
                  SizedBox(height: 30, width: 90,),
                  InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const singup(),
                      ),
                    );
                  },
                  child: const Text(
                    'Skip for Now',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 50,)
            ]
            )
          ),
    )
    );
  }
}
