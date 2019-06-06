$(function(){
    $(".left-selected").parents("dl").attr('show','1');
    $(".left-selected").parents("dl").find("i").removeClass("left-arrow-down");
    $(".left-selected").parents("dl").find("i").addClass("left-arrow-up");
    $(".left-selected").parents("dl").find("dd").show();
    $(".left-selected").parents("dl").siblings().find("dd").hide();
}) ;

//	 /导航收缩
$('.left-side').find('dt').bind('click', function () {
    showNav = $(this).parent().attr('show');
    $('.left-side').find(".shareholder-icon").removeClass('left-arrow-up');
    $('.left-side').find(".shareholder-icon").addClass('left-arrow-down');
    if (showNav == 1) {
        $(this).parent().find('dd').slideUp(200);
        $(this).parents('dl').attr('show', '0');
        $(this).css({ 'border-bottom': 'none' });
        $(this).find('i').removeClass('left-arrow-up');
        $(this).find('i').addClass('left-arrow-down');
    } else {
        $('.left-side').find('dd').hide(200);
        $(this).parent().find('dd').slideDown(200);
        $('.left-side').find('dl').attr('show', '0');
        $(this).parents('dl').attr('show', '1');
        $(this).css({ 'border-bottom': '1px solid #e6e6e6' });
        $(this).find('i').removeClass('left-arrow-down')
        $(this).find('i').addClass('left-arrow-up')
    }
});








