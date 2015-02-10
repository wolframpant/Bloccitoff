//for fading page transitions

document.addEventListener("page:change", function() {
        document.getElementById('primary-content').className += 'animated fadeInUp';
});
document.addEventListener("page:fetch", function() {
        document.getElementById('primary-content').className += 'animated zoomOut';
});