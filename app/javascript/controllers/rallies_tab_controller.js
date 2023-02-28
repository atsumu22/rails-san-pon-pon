import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rallies-tab"
export default class extends Controller {

  static targets = ["rallies", "link"]

  connect() {
    console.log("Connected")
  }

}
