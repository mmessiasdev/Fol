class PostNotAuthenticated {
	int? id;
	String? title;
	Profile? profile;
	bool? public;
	String? content;
	String? publishedAt;
	String? createdAt;
	String? updatedAt;
	List<Null>? likes;

	PostNotAuthenticated({this.id, this.title, this.profile, this.public, this.content, this.publishedAt, this.createdAt, this.updatedAt, this.likes});

	PostNotAuthenticated.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		title = json['title'];
		profile = json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
		public = json['public'];
		content = json['content'];
		publishedAt = json['published_at'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
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
		return data;
	}
}

class Profile {

	Profile.fromJson(Map<String, dynamic> json) {
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		return data;
	}
}
