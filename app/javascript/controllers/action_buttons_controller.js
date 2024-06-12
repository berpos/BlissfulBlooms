import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="action-buttons"
export default class extends Controller {
  static targets = ["water", "trim", "soil"]

  disable(event) {
    console.log("Hello");
    this.waterTarget.removeAttribute('disabled');
    this.trimTarget.removeAttribute('disabled');
    this.soilTarget.removeAttribute('disabled');
    event.currentTarget.setAttribute("disabled", "");
    let radiobutton = `log_categories_${event.currentTarget.dataset.disableButtonTarget}`;
    document.getElementById(radiobutton).click();
  }
}
