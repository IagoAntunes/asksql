import 'dart:convert';

class BodyData {
  String max_tokens;
  String mode;
  String model;
  String n;
  String temperature;
  String text;
  BodyData({
    required this.max_tokens,
    required this.mode,
    required this.model,
    required this.n,
    required this.temperature,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'max_tokens': max_tokens,
      'mode': mode,
      'model': model,
      'n': n,
      'temperature': temperature,
      'text': text,
    };
  }

  factory BodyData.fromMap(Map<String, dynamic> map) {
    return BodyData(
      max_tokens: map['max_tokens'] as String,
      mode: map['mode'] as String,
      model: map['model'] as String,
      n: map['n'] as String,
      temperature: map['temperature'] as String,
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BodyData.fromJson(String source) =>
      BodyData.fromMap(json.decode(source) as Map<String, dynamic>);
}
