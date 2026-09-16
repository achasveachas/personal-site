document.addEventListener("DOMContentLoaded", function () {
  var dropdown = document.querySelector(".resume-dropdown");
  if (!dropdown) return;

  var toggle = dropdown.querySelector(".resume-dropdown-toggle");

  // Only click-to-toggle on devices without real hover; hover-capable devices rely on CSS :hover
  var isHoverCapable = window.matchMedia && window.matchMedia("(hover: hover)").matches;
  if (isHoverCapable) return;

  toggle.addEventListener("click", function (e) {
    e.stopPropagation();
    var isOpen = dropdown.classList.toggle("open");
    toggle.setAttribute("aria-expanded", isOpen);
  });

  document.addEventListener("click", function (e) {
    if (!dropdown.contains(e.target)) {
      dropdown.classList.remove("open");
      toggle.setAttribute("aria-expanded", "false");
    }
  });
});
