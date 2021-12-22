class UserModel {
  String name;
  String imageUrl;
  UserModel({
    required this.name,
    required this.imageUrl,
  });

  factory UserModel.fake() {
    return UserModel(
        name: 'AAB',
        imageUrl: 'https://avatars.githubusercontent.com/u/57479546?v=4');
  }
}
