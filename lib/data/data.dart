class SliderModel {
  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});

  void setImageAssetPath(String getImagepath) {
    imagePath = getImagepath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setImageAssetPath("assets/Learning-rafiki.png");
  sliderModel.setTitle("learn");
  sliderModel.setDesc("");
  slides.add(sliderModel);

  SliderModel sliderModel2 = new SliderModel();

  //2
  sliderModel.setImageAssetPath("assets/Nerd-amico.png");
  sliderModel.setTitle("Questions");
  sliderModel.setDesc("");
  slides.add(sliderModel2);

  SliderModel sliderModel3 = new SliderModel();

  //3
  sliderModel.setImageAssetPath("assets/Nerd-rafiki.png");
  sliderModel.setTitle("Answers");
  sliderModel.setDesc("");
  slides.add(sliderModel3);

  return slides;
}
