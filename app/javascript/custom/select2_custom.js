import $ from "jquery";
import "select2";

document.addEventListener("turbo:load", function () {
  const $select = $(".js-category-select");

  if ($select.length > 0) {
    $select.select2({
      maximumSelectionLength: 3,
      width: "100%",
    });
  }
});
