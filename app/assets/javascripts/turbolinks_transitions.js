document.addEventListener('page:change', function() {
        document.getElementById('primary-content').className += 'animated fadeInUp';
});
document.addEventListener('page:before-change', function() {
        document.getElementById('primary-content').className += 'animated zoomOut';
});