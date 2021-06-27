# photo_app

A new Flutter project.

## Getting Started

Create a sample flutter app which will have the following :-
1. It should have the option to click an image using the camera.
2. Make sure Image size should not exceed 4MB.
3. There should be one image reducer method which will reduce the size of the image if
it exceeds 4MB.
4. Make a demo network api call for uploading the image. Let’s consider, the request
method is POST, and the image will be sent as a base64 string.
E.g: Request body will look something like {
{
"base64" : "value"
}
5. Make sure every network call contains an authorization header (For now just take
some random string value, and consider it as an authorization token). (Optional)
Tools to use:-
1. It should use the Bloc pattern to manage the states.
2. Try to use the dependency injection feature using the injectable package.
3. Try to write the code in a cleaner way, Modular way.

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
