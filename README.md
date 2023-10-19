# Crafty-Bay

## Description

Welcome to Crafty-Bay. A full e-commerce application build using flutter, getx . This app is a complete ecommerce app with all the features like add to cart, wishlist, review, checkout etc. This app is built with flutter and dart.

## Responsibilities

As the creator of CraftyBay, my responsibilities included:

* Designing the app's user interface (UI).
* Developing the complete ecommerce app.
* Adding user profiles for a personalized shopping experience.
* Allowing product addition to wishlists for user convenience.
* Implementing color and size filters for product selection.
* Categorizing products into four distinct categories.
* Showcasing special, new, and popular products.
* Creating an attractive product carousel slider.
* Enabling users to write and share product reviews.

## Features of the app With Screenshots

* [x] Splash Screen
![Alt text](assets/screenshots/Screenshot_20231019_224257.png)
* [x] Login Screen
 ![Alt text](assets/screenshots/13.png)
* [x] Complete Profile Screen
![Alt text](assets/screenshots/11.png)
* [x] OTP Verification Screen
![Alt text](assets/screenshots/12.png)
* [x] Home Screen
![Alt text](assets/screenshots/2.png)
* [x] Categories Screen
![Alt text](assets/screenshots/4.png)
* [x] Products Details Screen
![Alt text](assets/screenshots/7.png)
* [x] Cart Screen
![Alt text](assets/screenshots/10.png)
* [x] Wish List Screen
![Alt text](assets/screenshots/5.png)
* [x] Review Showing Screen
![Alt text](assets/screenshots/8.png)
* [x] Create Review Screen
![Alt text](assets/screenshots/9.png)

## folder structure

```root
craftyBay/
    ├── assets/
    │   └── images/
    └── lib/
        ├── application/
        │   ├── apps.dart
        │   └── state_holder_binding.dart
        ├── data/
        │   ├── models/
        │   │   ├── brands.dart
        │   │   ├── cart_list_data.dart
        │   │   ├── cart_list_model.dart
        │   │   ├── category_data.dart
        │   │   ├── category_model.dart
        │   │   ├── home_screen_slider_data.dart
        │   │   ├── home_screen_slider_model.dart
        │   │   ├── network_response.dart
        │   │   ├── products.dart
        │   │   ├── products_details.dart
        │   │   ├── products_details_model.dart
        │   │   ├── products_model.dart
        │   │   ├── review_list_model.dart
        │   │   └── user_read_profile_model.dart
        │   ├── services/
        │   │   └── network_caller.dart
        │   └── utils/
        │       └── url_links.dart
        ├── presentation/
        │   ├── state_holder/
        │   │   ├── add_to_cart_controller.dart
        │   │   ├── auth_controller.dart
        │   │   ├── cart_list_controller.dart
        │   │   ├── categories_controller.dart
        │   │   ├── complete_profile_controller.dart
        │   │   ├── create_review_controller.dart
        │   │   ├── create_wish_list.dart
        │   │   ├── delete_cart_list.dart
        │   │   ├── email_verification_controller.dart
        │   │   ├── home_screen_slider_controller.dart
        │   │   ├── main_bottom_nav_controller.dart
        │   │   ├── new_products_controller.dart
        │   │   ├── popular_products_controller.dart
        │   │   ├── products_details_controller.dart
        │   │   ├── products_wish_list_controller.dart
        │   │   ├── read_profile_controller.dart
        │   │   ├── review_list_controller.dart
        │   │   ├── spacial_products_controller.dart
        │   │   └── verify_login_controller.dart
        │   └── ui/
        │       ├── screen/
        │       │   ├── auth/
        │       │   │   ├── complete_profile_screen.dart
        │       │   │   ├── email_verification_screen.dart
        │       │   │   └── otp_screen.dart
        │       │   ├── cart_screen.dart
        │       │   ├── categories_screen.dart
        │       │   ├── create_review_screen.dart
        │       │   ├── home_screen.dart
        │       │   ├── item_screen.dart
        │       │   ├── main_bottom_nav_screen.dart
        │       │   ├── products_details_screen.dart
        │       │   ├── review_showing_screen.dart
        │       │   ├── splash_screen.dart
        │       │   └── wish_list_screen.dart
        │       ├── utils/
        │       │   ├── app_color.dart
        │       │   ├── color_extension.dart
        │       │   └── images_utils.dart
        │       └── widgets/
        │           ├── home_screen_widgets/
        │           │   ├── home_carousel_slider.dart
        │           │   ├── home_screen_search_bar.dart
        │           │   └── home_slider.dart
        │           ├── products_details_screen_widgets/
        │           │   ├── home_carousel_slider.dart
        │           │   └── home_screen_search_bar.dart
        │           ├── app_bar_icons.dart
        │           ├── bottom_price_details_and_button.dart
        │           ├── cart_screen_list_tile_card.dart
        │           ├── categories_card.dart
        │           ├── custom_app_bar.dart
        │           ├── custom_otp_field.dart
        │           ├── custom_stepper.dart
        │           ├── love_icon_button.dart
        │           ├── products_card.dart
        │           ├── products_carousel_slider.dart
        │           └── title_header_and_see_all_button.dart
        └── main.dart
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
