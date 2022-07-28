import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["icon", "like", "unlike", "count", "follow", "form"];
  like() {
    this.iconTarget.innerHTML = `<i class="fa-solid fa-heart fa-xl" id="active_heart" data-action="click->like#unlike"></i>`;
    this.likeTarget.submit();
    var count = Number(this.countTarget.innerHTML)+1
    this.countTarget.innerHTML = count;
  }
  unlike() {
    this.iconTarget.innerHTML = `<i class="fa-solid fa-heart fa-xl" id="empty_heart" data-action="click->like#like"></i>`;
    this.unlikeTarget.submit();
    var count = Number(this.countTarget.innerHTML)-1
    this.countTarget.innerHTML = count;
  }
  follow(){
    this.formTarget.submit();
    this.followTarget.innerHTML = `<div class="btn_follow" >
    <button>following</button></div>`;
  }
}
