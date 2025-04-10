import { Application } from "@hotwired/stimulus";
import "jquery";
import "./custom/select2_custom";

const application = Application.start();

application.debug = false;
window.Stimulus = application;
document.addEventListener("turbo:load", () => {
  $(".select2").select2({
    allowClear: true,
  });
});
export { application };
