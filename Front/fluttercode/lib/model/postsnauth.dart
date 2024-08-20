class PostsNoAuth {
  int? id;
  String? title;
  Profile? profile;
  bool? public;
  String? content;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  Null? media;
  List<Null>? likes;

  PostsNoAuth(
      {this.id,
      this.title,
      this.profile,
      this.public,
      this.content,
      this.publishedAt,
      this.createdAt,
      this.updatedAt,
      this.media,
      this.likes});

  PostsNoAuth.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    public = json['public'];
    content = json['content'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    media = json['media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    data['public'] = this.public;
    data['content'] = this.content;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['media'] = this.media;
    return data;
  }
}

class Profile {
  int? id;
  String? fname;
  String? lname;
  String? email;
  int? user;
  Null? post;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
      this.fname,
      this.lname,
      this.email,
      this.user,
      this.post,
      this.publishedAt,
      this.createdAt,
      this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    user = json['user'];
    post = json['post'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['user'] = this.user;
    data['post'] = this.post;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
