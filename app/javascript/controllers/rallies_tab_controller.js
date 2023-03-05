import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rallies-tab"
export default class extends Controller {

  static targets = ["rallies", "allRallies", "ongoingRallies", "comingSoonRallies"]

  // connect() {
  //   console.log("Connected")
  // }

  hideAllRallies() {
    console.log(this.ralliesTargets[0].children)
  }

  // to get the clicked tab
  switchTab(event) {
    event.preventDefault()
    // this.hideAllRallies()
    const target = event.target.getAttribute("data-rallies-tab-target")
    // console.log(target);
    let filter = ""
    if (target === "comingSoonRallies") {
      filter = "coming_soon=1"
    } else if (target === "ongoingRallies") {
      filter = "ongoing=1"
    }
    const url = `/stamp_rallies?${filter}`
    window.location.href = url



    // my experiment to try to make AJAX WORK...

    // TO GET EACH RALLY CARD

    // all the children:
    // let children = this.ralliesTargets[0].children
    // console.log(children);
    // // this returns an object and I need to iterate through it

    // // to check if this element has a class with ongoin
    // console.log(this.ralliesTargets[0].children[0].children[0].className.includes("soon"))
    // console.log(this.ralliesTargets[0].children[0].children[0].className)

    // let condition = ""
    // if (target === "ongoingRallies") {
    //   condition = "ongoing"
    // } else if (target === "comingSoonRallies") {
    //   condition = "soon"
    // }


    // const filtered = children.map(children => children[0].children[0].className.includes(condition) )
    // console.log(filtered);



    // fetch(url, { headers: { "X-Requested-With": "XMLHttpRequest" } })
    //   .then(response => console.log(response.text()))

    //   .then(html => {
    //     // console.log(target);
    //     // let container = this.ralliesTargets[0].children.children;
    //     let condition = ""
    //     const filtered = children.map(children => children[0].children[0].className.includes(condition) )
    //     console.log(filtered);
    //     if (target === "ongoingRallies") {
    //       condition = "ongoing"
    //     } else if (target === "comingSoonRallies") {
    //       condition = "soon"
    //     }

    //     // .getAttribute(`[data-rallies-tab-target="${target}"]`)
    //     console.log(condition);
    //   })
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
