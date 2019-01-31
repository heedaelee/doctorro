$(document).ready(function() {

    // gnb_modal
    $('.gnb_con > ul > li > a').click(function(e) {
        e.preventDefault();
        if ($(this).parent().find('.sub_depth').css("display") == "none") {
            $(this).parent().find('.sub_depth').slideDown();
            $(this).parent().siblings().find('.sub_depth').slideUp("slow");
            $(this).parent().addClass('on');
            $(this).parent().siblings().removeClass('on');
        } else {
            $(this).parent().find('.sub_depth').slideUp();
            $(this).parent().removeClass('on');
        }
    });

    $('.gnb_con > ul > li:first-child > a').click(function() {
        $(this).parent().addClass('on').siblings().removeClass('on');
        $(this).parent().siblings().find('.sub_depth').slideUp("slow");
    });

    // sub_nav responsive width
    var nav_length = $('.sub_nav ul li').length;
        $('.sub_nav ul').css('width', 106 * nav_length);

    if(nav_length ==1){
        $('.sub_nav').css('display','none')
    }

    // footer scroll effect
    var ScrollTop = 0;
    
    $(window).scroll(function() {
        var st = $(this).scrollTop();
        if (st < ScrollTop) { // upscroll code
            $('.footer_m').addClass("fixed");
            
        } else { // downscroll code
            $('.footer_m').removeClass("fixed");
        }
        ScrollTop = st;
    });

    // all check   
    $(".checkAll").change(function() {
        $(".checkSel").prop('checked', $(this).prop("checked"));
    });
    $(".checkSel").change(function() {
        var allcount = $(".checkSel").length;
        var ckcount = $(".checkSel:checked").length;
        $(".checkAll").prop('checked', false);
        if (allcount == ckcount) {
            $(".checkAll").prop('checked', true);
        };
    });



});