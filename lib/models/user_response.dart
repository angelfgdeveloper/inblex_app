class User {
    User({
        this.username,
        this.authorities,
        this.accountNonExpired,
        this.accountNonLocked,
        this.credentialsNonExpired,
        this.enabled,
        this.id,
    });

    String username;
    List<Authority> authorities;
    bool accountNonExpired;
    bool accountNonLocked;
    bool credentialsNonExpired;
    bool enabled;
    int id;

    factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        authorities: List<Authority>.from(json["authorities"].map((x) => Authority.fromJson(x))),
        accountNonExpired: json["accountNonExpired"],
        accountNonLocked: json["accountNonLocked"],
        credentialsNonExpired: json["credentialsNonExpired"],
        enabled: json["enabled"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "authorities": List<dynamic>.from(authorities.map((x) => x.toJson())),
        "accountNonExpired": accountNonExpired,
        "accountNonLocked": accountNonLocked,
        "credentialsNonExpired": credentialsNonExpired,
        "enabled": enabled,
        "id": id,
    };
}

class Authority {
    Authority({
        this.authority,
    });

    String authority;

    factory Authority.fromJson(Map<String, dynamic> json) => Authority(
        authority: json["authority"],
    );

    Map<String, dynamic> toJson() => {
        "authority": authority,
    };
}