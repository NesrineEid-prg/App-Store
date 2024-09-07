import 'package:appstore/services/categorieservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

// page
part '../page/signin.dart';
part '../page/register.dart';
part '../page/authcheck.dart';
part '../page/errorsreen.dart';
part '../page/loadingscreen.dart';
part '../page/mainpage.dart';
part '../page/favoritepage.dart';
part '../page/cartpage.dart';
part '../page/profilepage.dart';
part '../page/homepage.dart';

// widget
part '../widget/textformfield.dart';

// auth
part '../auth/authservice.dart';

// provider
part '../provider/alprovider.dart';
// model
part '../model/categorymodel.dart';
part '../model/productmodel.dart';

//
part '../conpnement/homecategorieswidget.dart';
part '../conpnement/homeproductswidget.dart';
part '../core/faiture.dart';
part '../constant/firebaseconstant.dart';
part '../provider/firebaseprovider.dart';
part '../controller/categoriecontroller.dart';

part '../services/productservices.dart';
part '../controller/productcontroller.dart';
