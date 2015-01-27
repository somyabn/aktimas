$(document).ready(function() {
    var _intervalId;
    
    function fadeInLastImg()
    {
        var backImg = $('.container img:first');
        backImg.hide();
        backImg.remove();
        $('.container' ).append( backImg );
        backImg.fadeIn()
    };
        
    _intervalId = setInterval( function() {
        fadeInLastImg();
    }, 3000 );

});