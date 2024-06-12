import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="action-button"
export default class extends Controller {
  static targets = ["water", "trim", "soil"]

  connect() {

  }

  disable(event) {
    function removeDisabledAttributeIfPresent(target) {
      if (target.hasAttribute('disabled')) {
        target.removeAttribute('disabled');
      }
    }

    removeDisabledAttributeIfPresent(this.waterTarget);
    removeDisabledAttributeIfPresent(this.trimTarget);
    removeDisabledAttributeIfPresent(this.soilTarget);

    event.currentTarget.setAttribute("disabled", "");
    let radiobutton = `log_categories_${event.currentTarget.dataset.actionButtonTarget}`;
    document.getElementById(radiobutton).click();
  }
}
