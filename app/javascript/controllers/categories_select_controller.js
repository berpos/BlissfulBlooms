import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="categories-select"
export default class extends Controller {
  static targets = ["image1","image2"]

  connect() {
  }

  select(event) {
    // event listener nas images
    if (event.currentTarget.id == "image1") {
      // imagem 1 click

      this.image1Target.classList.toggle("selected-image")
      this.image2Target.classList.remove("selected-image")
      document.getElementById("plant_categories_person").click()
    }else {
      //imagem 2 click

      this.image2Target.classList.toggle("selected-image")
      this.image1Target.classList.remove("selected-image")
      document.getElementById("plant_categories_moment").click()
    }

  }

      // quando clickas numa imagem clickas no radio button respectivo


}
