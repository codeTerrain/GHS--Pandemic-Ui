import 'package:ghspandemic/core/model/diseaseCategory.dart';

class AppData {
  static List<DiseaseCategory> categoryList = [
    DiseaseCategory(
        id: 1,
        diseaseName: "Covid-19",
        image: 'assets/images/pandemics/covid.png',
        isSelected: true),
    DiseaseCategory(
        id: 2,
        diseaseName: "Ebola",
        image: 'assets/images/pandemics/ebola.png'),
    DiseaseCategory(
        id: 3,
        diseaseName: "HIV/AIDS",
        image: 'assets/images/pandemics/HIV.png'),
    DiseaseCategory(
        id: 4, diseaseName: "SARS", image: 'assets/images/pandemics/sars.png'),
    DiseaseCategory(
        id: 4, diseaseName: "CSM", image: 'assets/images/pandemics/ebola.png'),
  ];
}
