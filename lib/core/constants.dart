// ignore_for_file: constant_identifier_names

import 'package:mobile_pos/core/common/data/datasources/cache/cache_data_sources.dart';
import 'package:mobile_pos/core/common/data/models/models.dart';
import 'package:mobile_pos/core/common/domain/usecases/usecases.dart';
import 'package:mobile_pos/core/utils/shared_prefs.dart';
import 'package:mobile_pos/features/login/data/datasources/cache/auth_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String AUTH_TOKEN = 'AUTH_TOKEN';
const String INITIAL_DATA_DUMPED = 'INITIAL_DATA_DUMPED';

const String INITIAL_DATA_DUMPED_PRODUCT = 'INITIAL_DATA_DUMPED_PRODUCT';
const String INITIAL_DATA_DUMPED_STOCK = 'INITIAL_DATA_DUMPED_STOCK';
const String INITIAL_DATA_DUMPED_VAT_TAX = 'INITIAL_DATA_DUMPED_VAT_TAX';
const String INTIAL_DATA_DUMPED_CUSTOMER = 'INTIAL_DATA_DUMPED_CUSTOMER';

const String BILLING_ITEMS = 'BILLING_ITEMS';

// URLs
const String BASE_URL =
    'https://a2a5-41-90-15-251.ngrok.io'; //'http://2026-196-207-163-179.ngrok.io';

const String token = 'Token 50ecf5eb5902ae3d3b79afc7c23fcece821cc92c';



// "50ecf5eb5902ae3d3b79afc7c23fcece821cc92c"
