$(document).ready(function() {

    // common scroll
    $(".scroll_inner").mCustomScrollbar({
        scrollInertia: 300
    });

    // side nav scroll
    $(".side_nav_inner").mCustomScrollbar({
        scrollInertia: 300
    });

    // gnb_modal
    // $('.gnb_con > ul > li > a').click(function(e) {
    //     e.preventDefault();
    //     if ($(this).parent().find('.sub_depth').css("display") == "none") {
    //         $(this).parent().find('.sub_depth').slideDown();
    //         $(this).parent().siblings().find('.sub_depth').slideUp("slow");
    //         $(this).parent().addClass('on');
    //         $(this).parent().siblings().removeClass('on');
    //     } else {
    //         $(this).parent().find('.sub_depth').slideUp();
    //         $(this).parent().removeClass('on');
    //     }
    // });

    // $('.gnb_con > ul > li:first-child > a').click(function() {
    //     $(this).parent().addClass('on').siblings().removeClass('on');
    //     $(this).parent().siblings().find('.sub_depth').slideUp("slow");
    // });

    // sub_nav responsive width
    var nav_length = $('.sub_nav ul li').length;
    var length_sum = 0;
    $('.sub_nav ul li').each(function() {
         var nav_w = $(this).outerWidth();
         length_sum += nav_w;
    });
    $('.sub_nav ul').css('width', length_sum);

    if(nav_length == 1){
        $('.sub_nav').css('display','none')
    };
    if(nav_length == 2){
        $('.sub_nav').addClass('nav02')
    }else{
        $('.sub_nav').removeClass('nav02')
    }

    $(window).on('load resize', function() {
        $('.sub_nav ul').css('width', length_sum + 10);
    });

    // alarm list accordien
    $('.alarm_list li a').click(function(e) {
        e.preventDefault();
        if ($(this).parent().find('.alarm_txt').css("display") == "none") {
            $(this).parent().find('.alarm_txt').slideDown(300);
            $(this).parent().siblings().find('.alarm_txt').slideUp(300);
            $(this).parent().addClass('open');
            $(this).parent().siblings().removeClass('open');
        } else {
            $(this).parent().find('.alarm_txt').slideUp(300);
            $(this).parent().removeClass('open');
        }
    });


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

    // 회원가입 tab
    $('.dr_tab_nav li a').click(function(e) {
        e.preventDefault();
        $('.dr_tab_wrap .tab_con').hide();
        $('.dr_tab_nav li').removeClass('on');
        $(this).parent().addClass('on');
        $($(this).attr('href')).show();
        $('#sldie01')[0].slick.refresh();
        $('#sldie02')[0].slick.refresh();
        if ($(window).width() > 767) {
            if (drSlick.hasClass('slick-initialized')) {
                drSlick.slick('unslick');
            }
        }
    });

    // 회원가입 slide
    var drSlick = $(".dr_slide");
    settings = {
        autoplay: false,
        infinite: false,
        dots: true,
        arrows: false,
        slidesToShow: 1,
        slidesToScroll: 1
    };

    drSlick.each(function() {
        $(this).slick(settings)
    });
    $(window).on('load resize', function() {
        if ($(window).width() > 767) {
            if (drSlick.hasClass('slick-initialized')) {
                drSlick.slick('unslick');
            }
            return false
        } else {
            if (!drSlick.hasClass('slick-initialized')) {
                return drSlick.slick(settings);
            };
        }

    });

    // 과 구분 토글이벤트
    $('.part_wrap > span').each(function() {
        $(this).click(function() {
            $(this).toggleClass('on')
        });
    });




});