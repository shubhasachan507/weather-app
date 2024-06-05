import "package:flutter/material.dart";
import "package:weatherapp/constants.dart";

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({
    super.key,
    required this.name,
    required this.icon,
    required this.description,
    required this.temp,
  });

  final String? name;
  final String? icon;
  final String? description;
  final int? temp;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        if (name != null)
          Text(
            name!,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        if (icon != null)
          Container(
            height: screenSize.height * .3,
            width: screenSize.width * .4,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("${AppStrings.imageUrl}$icon@4x.png"),
              ),
            ),
          ),
        const SizedBox(
          height: 20,
        ),
        if (description != null)
          Text(
            description!.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        const SizedBox(
          height: 20,
        ),
        if (temp != null)
          Text("$temp°C",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenSize.width * .3)),
      ],
    );
  }
}
