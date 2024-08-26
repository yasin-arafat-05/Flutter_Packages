# imagepicker

## Objective: 

- `Image gallary and camera থেকে upload করার জন্য । `
- `Api বা backend এ ছবি upload করার জন্য। `
- `ছবি আপলোড করার পর, আবার ছবির উপর ক্লিক করে, নতুন ছবি আপলোড করতে পারি । `

# Demo: 



# Learning: 

# 1. ValueChanged<T>

In Flutter, `ValueChanged<T>` is a typedef that represents a function signature for a callback that takes a single parameter of type `T` and returns no value (`void`). It is defined as:

```dart
typedef ValueChanged<T> = void Function(T value);
```

# 2. final keyword:

The final keyword in Dart is used to declare a variable whose value can only be set once.
 After a final variable has been initialized, its value cannot be changed.


# 3.  InkWell, InkResponse, InkImage :
[video_for_understand](https://www.youtube.com/watch?v=2t-I0uryD6E&t=37s)

![image](../image/yasin/img04.gif)

<br>

`Touch feedback, আমরা screen এ  করার পর একটা Touch feedback পাবো । উপরের ক্লিক করার পর আমরা একটা পেয়েছি । আমরা এই effect টা ছবিতে add করা যেতে পারে, profile picture change করার সময় । আমরা   InkWell() widget ব্যবহার  rectangular splash, InkResponse() widget ব্যবহার করি circular splash, আর Ink.Image() widget ব্যবহার করে image এ splash screen ব্যবহার করি । Ink.Image() widget ব্যবহার করলে এর child এ আমাদের InkWell() widget implement করতে হয় । `

### Note: `যদি আমাদের widget এ থাকে তাহলে না কাজ করলে এর solution উপরের ভিডিওতে দেওয়া আছে । `

<br>




 