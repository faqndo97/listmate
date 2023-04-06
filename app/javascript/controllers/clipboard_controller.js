import { Controller } from "@hotwired/stimulus";
import tippy from "tippy.js";

export default class extends Controller {
  static values = {
    tooltipContent: { type: String, default: "URL Copied!" }
  }

  connect() {
    this.#setupTooltip()
    this.element.addEventListener("click", this.#copyURL)
  }

  #setupTooltip() {
    tippy(this.element, {
      content: this.tooltipContentValue,
      theme: 'success',
      animation: 'scale-extreme',
      trigger: 'click',
      hideOnClick: false,
      onShow(instance) {
        setTimeout(() => {
          instance.hide();
        }, 2000);
      }
    });
  }

  #copyURL() {
    const textArea = document.createElement("textarea");
    textArea.value = window.location.href;
    document.body.appendChild(textArea);
    textArea.select();
    document.execCommand("copy");
    document.body.removeChild(textArea);
  }
}

