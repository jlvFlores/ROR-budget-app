import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "sidemenu" ]

  toggleSideMenu() {
    this.sidemenuTarget.classList.toggle('open');
  }

  return() {
    window.history.back();
  }
}