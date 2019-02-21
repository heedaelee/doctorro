$(document).ready(function() {

    // common scroll
    $(".scroll_inner").mCustomScrollbar({
        scrollInertia: 150
    });

    $(".scroll_horizon").mCustomScrollbar({
        axis: "x",
        scrollInertia: 150
    });

    // side nav scroll
    $(".side_nav_inner").mCustomScrollbar({
        scrollInertia: 150
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
    var totalWidth = 0;
    var navL = $('.sub_nav ul li').length;
    $('.sub_nav ul li').each(function() {
        totalWidth += $(this).outerWidth();
    });

    $('.sub_nav ul').width(totalWidth - 20);

    if (isMobile()) {
        $('.sub_nav ul li').click(function() {
            var activeDiv = $(this);
            var boxCenter = $(this).width() / 2;
            var screenCenter = $(window).width() / 2;
            var boxWrapperLeft = $('.sub_nav ul').offset().left;
            var pos = $(this).offset().left;
            var distToCenter = (pos + boxCenter) - screenCenter;
            var distToMove = 0;
            distToMove = -distToCenter + boxWrapperLeft;
            $('.sub_nav').animate({ scrollLeft: - distToMove + 'px' }, 500);
            $('.sub_nav ul li').removeClass('on');
            activeDiv.addClass('on');
        });
        if(navL == 2){
            $('.sub_nav ul li').css('width','45%')
        }
    }

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

    if (isMobile()) {
        $(window).scroll(function() {
            var st = $(this).scrollTop();
            var counselOffset = $('.counsel_list').height();
            var footOffset = $('.footer_m').offset();
            var scroll_t = $(document).scrollTop();
            var multipleh = st + scroll_t;

            console.log('foot' + footOffset.top)
            console.log('mlt' + multipleh)
            console.log('scro' + scroll_t)
            console.log('st' + st)
            console.log('counseH' + counselOffset)

            if (st >= ScrollTop) { // downscroll code
                $('.footer_m').removeClass("fixed");
                $('.counsel_bottom').addClass("fixed");
                if (multipleh < footOffset.top) {

                    $('.counsel_bottom').addClass("fixed");
                    if (multipleh > counselOffset) {
                        $('.counsel_bottom').removeClass("fixed");
                    } else {
                        $('.counsel_bottom').addClass("fixed");
                    }
                } else {
                    $('.counsel_bottom').removeClass("fixed");
                }

            } else { // upscroll code
                $('.footer_m').addClass("fixed");
                $('.counsel_bottom').removeClass("fixed");
            }
            ScrollTop = st;
        });
    };

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

    // profile tab
    $('.profile_tab .tab_con').first().show();
    $('.profile_tab_nav li a').click(function(e) {
        e.preventDefault();
        $('.profile_tab .tab_con').hide();
        $('.profile_tab_nav li').removeClass('on');
        $(this).parent().addClass('on');
        $($(this).attr('href')).show();
    });
/* 일단 보류
    $('.stars').rating({
        filledStar: '<i class="fa fa-star"></i>',
        emptyStar: '<i class="fa fa-star"></i>',
        min: 0,
        max: 5,
        starCaptions: { 0.5: '0.5(별로에요)', 1: '1.0(별로에요)', 1.5: '1.5(그저그래요)', 2: '2.0(그저그래요)', 2.5: '2.5(괜찮아요)', 3: '3.0(괜찮아요)', 3.5: '3.5(좋아요)', 4: '4.0(좋아요)', 4.5: '4.5(좋아요)', 5: '5.0(최고에요)' },
    });*/

    // 팔로우 버튼 토글 이벤트
    $('.btn_follow').click(function() {
        if ($(this).hasClass('following')) {
            $(this).removeClass('following').text('언팔로우');
        } else {
            $(this).addClass('following').text('팔로우');
        }
    });

    // 진료과목 slide
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
    // $(window).on('load resize', function() {
    //     if ($(window).width() > 767) {
    //         if (drSlick.hasClass('slick-initialized')) {
    //             drSlick.slick('unslick');
    //         }
    //         return false
    //     } else {
    //         if (!drSlick.hasClass('slick-initialized')) {
    //             return drSlick.slick(settings);
    //         };
    //     }

    // });
    
    // counsel tab
    $('.counsel_tab .tab_con').first().show();
    $('.counsel_tab_nav li a').click(function(e) {
        e.preventDefault();
        $('.counsel_tab .tab_con').hide();
        $('.counsel_tab_nav li').removeClass('on');
        $(this).parent().addClass('on');
        $($(this).attr('href')).show();
    });

    $('#filter_pop').on('shown.bs.modal', function(e) {
        $('#sldie01').slick("setPosition", 0);
    })

    // 과 구분 토글이벤트
    $('.part_wrap > span').each(function() {
        $(this).click(function() {
            $(this).toggleClass('on')
        });
    });

    // 칼럼 등록하기 버튼
    if (isMobile()) {
        $('.create_column_btn a').click(function(e) {
            e.preventDefault();
            alert('PC에서만 제공되는 기능입니다.')
        });
    }

});

// mobile
function isMobile() {
    return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
}

function reviewFix() {
    var ScrollTop = 0;
    var st = $(this).scrollTop();
    var reviewOffset = $('.review_list').offset();
    var reviewH = $('.review_list').height();
    var footOffset = $('.footer_m').offset();
    var scroll_t = $(document).scrollTop();
    var multipleh = st + scroll_t;
    if (st >= ScrollTop) { // downscroll code
        $('.review_btn').removeClass("fixed");
        if (multipleh >= reviewOffset.top) {
            $('.review_btn').addClass("fixed");
            if (multipleh >= footOffset.top) {
                $('.review_btn').removeClass("fixed");
            }
        } else {
            $('.review_btn').removeClass("fixed");
        }
    } else { // upscroll code
        $('.review_btn').removeClass("fixed");
    }
    ScrollTop = st;
}