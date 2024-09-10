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
part '../page/productdetailspage.dart';

// widget
part '../widget/textformfield.dart';

// auth
part '../auth/authservice.dart';

// provider
part '../provider/alprovider.dart';
// model
part '../model/categorymodel.dart';
part '../model/productmodel.dart';

//conponnent
part '../conpnement/homecategorieswidget.dart';
part '../conpnement/homeproductswidget.dart';
part '../conpnement/realetedproduct.dart';

//core

part '../core/faiture.dart';
//constant

part '../constant/firebaseconstant.dart';
//provider
part '../provider/firebaseprovider.dart';

//controller
part '../controller/productcontroller.dart';
part '../controller/categoriecontroller.dart';
//service

part '../services/productservices.dart';
