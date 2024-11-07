document.addEventListener("DOMContentLoaded", function() {
    loadNavpanel();
});

function loadNavpanel() {
    var width = window.innerWidth;
    if (width <= 1200) {
        return;
    }

    var activeEls = document.getElementsByClassName('md-nav__item--active');

    for (var i = 0; i < activeEls.length; i++) {
        var navEl = activeEls.item(i);
        var toggleEl = navEl.getElementsByClassName('md-nav__toggle')[0] || null;
        if (toggleEl) {
            toggleEl.checked = true;
        }
    }
}
