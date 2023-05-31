// Bootstrap
import "popper"
import "bootstrap"

// Font Awesome
import "@fortawesome/fontawesome-free"

// Charts
import "chartkick"
import "Chart.bundle"

// Bootstrap Tooltips
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})
