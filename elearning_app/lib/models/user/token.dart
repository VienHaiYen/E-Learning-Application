class TokenInfo {
  String? token;
  String? expires;

  TokenInfo({
    this.token,
    this.expires,
  });

  TokenInfo.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expires = json['expires'];
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'expires': expires,
      };
}

class Token {
  TokenInfo? access;
  TokenInfo? refresh;

  Token.fromJson(Map<String, dynamic> json) {
    access = TokenInfo.fromJson(json['access']);
    refresh = TokenInfo.fromJson(json['refresh']);
  }

  Map<String, dynamic> toJson() => {
        'access': access?.toJson(),
        'refresh': refresh?.toJson(),
      };
}
