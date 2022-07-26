import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"];

  launchPhoto() {
    this.modalTarget.innerHTML = `${data-id}`; 
    console.log(this.modalTarget);
  }
}
