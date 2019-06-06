$(function() {
    $('#search').focus(function() {
        $(this).attr('placeholder', '');
    }).blur(function() {
        $(this).attr('placeholder', '请输入搜索关键词 如“充值”');
    });
    $("body").delegate("#search", "focus", function() {
        $(this).siblings('.wrap-placeholder').text('');
    });
    $("body").delegate("#search", "blur", function() {
        $(this).siblings('.wrap-placeholder').text('请输入搜索关键词 如“充值”');
    });

    $(".help_questions dt").toggle(function() {
        $(this).next("dd").animate({height: 'toggle', opacity: 'toggle'}, "fast");
        $(this).find("i").toggleClass("arrow-up");
    }, function() {
        $(this).next("dd").animate({height: 'toggle', opacity: 'toggle'});
        $(this).find("i").toggleClass("arrow-up");
    });
});

//左则导航收收缩
//	$('.left-side').find('dd').hide();
//	$('.left-side').find('dl:first').find('dd').show();
//匹配链接标注a标签
var queryString = location.href.substring(location.href.indexOf());

var queryString = queryString.split('?')[1];
queryString = queryString.split('#')[0];
queryString = queryString.split('&')[0];
aLength = $('.left-side').find('a').length;
for (var i = 0; aLength > i; i++) {
    aHref = $('.left-side').find('a').eq(i).attr('href');
    thisHref = aHref.split('?')[1];
    if (thisHref === queryString) {
        $('.left-side').find('a').removeClass('left-selected');
        $('.left-side').find('a').eq(i).addClass('left-selected');
        $('.left-side').find('dl').attr('show', '0');
        $('.left-side').find('dd').hide();
        $('.left-side').find('a').eq(i).parents('dl').attr('show', '1').find('dd').show();
    }
}


//	 /导航收缩
$('.left-side').find('dt').bind('click', function() {
    showNav = $(this).parent().attr('show');
    if (showNav == 1) {
        $(this).parent().find('dd').slideUp(200);
        $(this).parents('dl').attr('show', '0');
        $(this).find('i').removeClass('left-arrow-up')
        $(this).find('i').addClass('left-arrow-down')

    } else {
        $('.left-side').find('dd').hide(200);
        $(this).parent().find('dd').slideDown(200);
        $('.left-side').find('dl').attr('show', '0');
        $(this).parents('dl').attr('show', '1');
        $(this).find('i').removeClass('left-arrow-down')
        $(this).find('i').addClass('left-arrow-up')
    }
})


