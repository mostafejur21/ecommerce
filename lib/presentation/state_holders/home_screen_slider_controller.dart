import 'package:ecommerce/data/models/home_screen_slider_model.dart';
import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/url_links.dart';
import 'package:get/get.dart';

class HomeScreenSliderController extends GetxController{

  bool _homeScreenSliderInProgress = false;
  HomeScreenSliderModel _sliderModel = HomeScreenSliderModel();
  String _message = '';

  bool get homeScreenSliderInProgress => _homeScreenSliderInProgress;
  HomeScreenSliderModel get homeScreenSliderModel => _sliderModel;

  String get message => _message;

  Future<bool> getHomeScreenSlider () async {
    _homeScreenSliderInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.homeScreenSlider);
    _homeScreenSliderInProgress = false;
    if(response.isSuccess && response.statusCode == 200){
      _sliderModel = HomeScreenSliderModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      _message = "slider fetch failed";
      update();
      return false;
    }

  }
}