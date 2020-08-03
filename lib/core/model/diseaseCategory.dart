class DiseaseCategory {
  int id;
  String diseaseName;

  String image;
  bool isSelected;
  DiseaseCategory(
      {this.id, this.diseaseName, this.isSelected = false, this.image});
}
