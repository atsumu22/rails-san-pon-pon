import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reward-popup"
export default class extends Controller {

  static targets = ["reward", "cards"]

  connect() {
  }

  revealReward() {
    this.rewardTarget.classList.remove("d-none")
  }

  closeReward() {
    this.rewardTarget.classList.add("d-none")
  }
}
