$(document).ready(function() {
    // common scroll
    $(".scroll_inner").mCustomScrollbar({
        scrollInertia: 300
    });

    $(".scroll_horizon").mCustomScrollbar({
        axis:"x",
        scrollInertia: 300
    });

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
    var length_sum = 0;
    $('.sub_nav ul li').each(function() {
         var nav_w = $(this).outerWidth();
         length_sum += nav_w;
         console.log(nav_w)
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
        /*var reviewOffset = $('.review_list').offset();*/
        var footOffset =$('.footer_m').offset();
        var scroll_t = $(document).scrollTop();
        var multipleh = st + scroll_t;
        if (st < ScrollTop) { // upscroll code
            $('.footer_m').addClass("fixed");
            $('.review_btn').removeClass("fixed");
        } else { // downscroll code
            $('.footer_m').removeClass("fixed");
            /*if (multipleh <= reviewOffset.top) {
                $('.review_btn').addClass("fixed");
            }else{
                 $('.review_btn').removeClass("fixed");
            }   */   
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

    // profile tab
    $('.profile_tab .tab_con').first().show();
    $('.profile_tab_nav li a').click(function(e) {
        e.preventDefault();
        $('.profile_tab .tab_con').hide();
        $('.profile_tab_nav li').removeClass('on');
        $(this).parent().addClass('on');
        $($(this).attr('href')).show();
    });

/*     $('.stars').rating({
        filledStar:'<i class="fa fa-star"></i>',
        emptyStar: '<i class="fa fa-star"></i>',
        min:0, 
        max:5,
        starCaptions: {0.5: '0.5(별로에요)',1: '1.0(별로에요)',1.5: '1.5(그저그래요)', 2: '2.0(그저그래요)', 2.5: '2.5(괜찮아요)',3: '3.0(괜찮아요)', 3.5: '3.5(좋아요)',4: '4.0(좋아요)', 4.5: '4.5(좋아요)',5: '5.0(최고에요)'},
        // starCaptionClasses: {1: 'text-danger', 2: 'text-warning', 3: 'text-info', 4: 'text-primary', 5: 'text-success'}
    });*/
});