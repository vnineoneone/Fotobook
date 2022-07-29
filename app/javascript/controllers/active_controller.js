import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = [ "link1", "link2" ];
  active1(){
    this.link2Target.style.color = "red";
  }
}
