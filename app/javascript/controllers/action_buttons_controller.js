import { Controller } from '@hotwired/stimulus'

export default class extends Controller {

  static targets = ["button", "button-1", "button-2"]

  disable() {
    // console.log("Hello");
    this.buttonTarget.setAttribute("disabled", "", "", "");
  }
}
