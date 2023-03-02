import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rallies-tab"
export default class extends Controller {

  static targets = ["rallies", "allRallies", "ongoingRallies", "comingSoonRallies"]

  // connect() {
  //   console.log("Connected")
  // }

  hideAllRallies() {
    console.log(this.ralliesTargets[0].children.children)
  }

  // to get the clicked tab
  switchTab(event) {
    event.preventDefault()

    const target = event.target.getAttribute("data-rallies-tab-target")
    let filter = ""
    if (target === "comingSoonRallies") {
      filter = "coming_soon=1"
    } else if (target === "ongoingRallies") {
      filter = "ongoing=1"
    }
    const url = `/stamp_rallies?${filter}`
    window.location.href = url
    // fetch(url, { headers: { "X-Requested-With": "XMLHttpRequest" } })
    //   .then(response => console.log(response.text()))

      // .then(html => {
      //   const container = this.ralliesTargets.querySelector(`[data-rallies-tab-target="${target}"]`)
      //   console.log(html)
      //   // container.innerHTML = html
      // })
  }

  showAll() {
    this.hideAllRallies()
  }

  showOngoingRallies() {
    console.log(this.ongoingRalliesTarget)
  }

  showComingSoonRallies() {
    console.log(this.comingSoonRalliesTarget)
  }

}
