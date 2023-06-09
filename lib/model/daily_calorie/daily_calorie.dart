import 'dart:convert';

class DailyCalorie {
    int? bmr;
    Goals? goals;

    DailyCalorie({
        this.bmr,
        this.goals,
    });

    factory DailyCalorie.fromRawJson(String str) => DailyCalorie.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DailyCalorie.fromJson(Map<String, dynamic> json) => DailyCalorie(
        bmr: json["BMR"],
        goals: json["goals"] == null ? null : Goals.fromJson(json["goals"]),
    );

    Map<String, dynamic> toJson() => {
        "BMR": bmr,
        "goals": goals?.toJson(),
    };
}

class Goals {
    int? maintainWeight;
    WeightLoss? mildWeightLoss;
    WeightLoss? weightLoss;
    WeightLoss? extremeWeightLoss;
    WeightGain? mildWeightGain;
    WeightGain? weightGain;
    WeightGain? extremeWeightGain;

    Goals({
        this.maintainWeight,
        this.mildWeightLoss,
        this.weightLoss,
        this.extremeWeightLoss,
        this.mildWeightGain,
        this.weightGain,
        this.extremeWeightGain,
    });

    factory Goals.fromRawJson(String str) => Goals.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        maintainWeight: json["maintain weight"],
        mildWeightLoss: json["Mild weight loss"] == null ? null : WeightLoss.fromJson(json["Mild weight loss"]),
        weightLoss: json["Weight loss"] == null ? null : WeightLoss.fromJson(json["Weight loss"]),
        extremeWeightLoss: json["Extreme weight loss"] == null ? null : WeightLoss.fromJson(json["Extreme weight loss"]),
        mildWeightGain: json["Mild weight gain"] == null ? null : WeightGain.fromJson(json["Mild weight gain"]),
        weightGain: json["Weight gain"] == null ? null : WeightGain.fromJson(json["Weight gain"]),
        extremeWeightGain: json["Extreme weight gain"] == null ? null : WeightGain.fromJson(json["Extreme weight gain"]),
    );

    Map<String, dynamic> toJson() => {
        "maintain weight": maintainWeight,
        "Mild weight loss": mildWeightLoss?.toJson(),
        "Weight loss": weightLoss?.toJson(),
        "Extreme weight loss": extremeWeightLoss?.toJson(),
        "Mild weight gain": mildWeightGain?.toJson(),
        "Weight gain": weightGain?.toJson(),
        "Extreme weight gain": extremeWeightGain?.toJson(),
    };
}

class WeightGain {
    String? gainWeight;
    int? calory;

    WeightGain({
        this.gainWeight,
        this.calory,
    });

    factory WeightGain.fromRawJson(String str) => WeightGain.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WeightGain.fromJson(Map<String, dynamic> json) => WeightGain(
        gainWeight: json["gain weight"],
        calory: json["calory"],
    );

    Map<String, dynamic> toJson() => {
        "gain weight": gainWeight,
        "calory": calory,
    };
}

class WeightLoss {
    String? lossWeight;
    int? calory;

    WeightLoss({
        this.lossWeight,
        this.calory,
    });

    factory WeightLoss.fromRawJson(String str) => WeightLoss.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WeightLoss.fromJson(Map<String, dynamic> json) => WeightLoss(
        lossWeight: json["loss weight"],
        calory: json["calory"],
    );

    Map<String, dynamic> toJson() => {
        "loss weight": lossWeight,
        "calory": calory,
    };
}
