import { Controller } from "@hotwired/stimulus"
import { ApplicationController, useDebounce } from "stimulus-use"

export default class extends ApplicationController {
  static debounces = ["submit"]

  connect() {
    useDebounce(this)
  }

  submitWithDebounce() {
    this.submit()
  }

  submitNow() {
    this.submit()
  }

  submit() {
    this.element.requestSubmit();
  }
}
