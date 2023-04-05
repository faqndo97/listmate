import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["addItem", "template"]

  addAssociation(event) {
    event.preventDefault()
    let content = this.templateTarget.innerHTML.replace(new RegExp("TEMPLATE_RECORD", "g"), new Date().getTime())

    this.addItemTarget.insertAdjacentHTML("beforebegin", content)
  }

  removeAssociation(event) {
    event.preventDefault()
    let item = event.target.closest(".nested-fields")

    item.querySelector("input[name*='_destroy']").value = 1
    item.style.display = 'none'
  }
}
