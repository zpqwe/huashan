function leftMenu() {
    $('.help-left').find('dt').toggle(
        function () {
            $(this).parent().find('dd').slideUp();
            $(this).find('.left-arrow').addClass("left-arrow-selected");
            $(this).css({ borderBottom: "none" })
        },
        function () {
            $(this).parent().find('dd').slideDown();
            $(this).find('.left-arrow').removeClass("left-arrow-selected");
            $(this).css({ borderBottom: "1px solid #e6e6e6" })

        }
    )
}
/**
* Created by Administrator on 15-1-5.
*/
//消息滚动
function AutoScroll(obj) {
    $(obj).find("ul:first").animate({
        marginTop: "-40px"
    }, 800, function () {
        $(this).css({ marginTop: "0px" }).find("li:first").appendTo(this);
    });
}
$('.list').hover(function () {
    clearInterval(t);
},
function () {
    t;
});
t = setInterval('AutoScroll(".list")', 5000);
//消息滚动结束-----------------------------------------------------------

$(function () {
    leftMenu();
    $('#help-left').load('left.html');
    $("#xinshoumore").attr("href", "/help/list.html?cid=92");
    $("#redianquestion").attr("href", "/help/list.html?cid=98");
    tag1(); //新手指南 tag
    tag2(); //热点问题 tag
    function tag1() { //新手指南 tag
        $('.new-hand').find('li').click(function () {
            $("#xinshoumore").attr("href", "");
            $('.new-hand').find('li').removeClass('selected');
            $(this).addClass('selected');
            _index = $(this).index();
            $('.new-hand-list').find('ul').hide();
            $('.new-hand-list').find('ul').eq(_index).fadeIn();
            var pos = $('.new-hand-list').find('.new-hand-arrow');
            var cid = 92;
            if (_index == 0) {
                cid = 92;
                pos.animate({ left: 54 })
            }
            else if (_index == 1) {
                cid = 93;
                pos.animate({ left: 174 })
            }
            else if (_index == 2) {
                cid = 94;
                pos.animate({ left: 294 })
            }
            else if (_index == 3) {
                cid = 95;
                pos.animate({ left: 415 })
            }
            else if (_index == 4) {
                cid = 96;
                pos.animate({ left: 534 })
            }
            else if (_index == 5) {
                cid = 97;
                pos.animate({ left: 655 })
            }
            $("#xinshoumore").attr("href", "/help/list.html?cid=" + cid);
        })

    }

    function tag2() { //热点问题 tag
        $('.hot').find('.title').find('li').click(function () {
            $("#redianquestion").attr("href", "");
            $('.hot').find('.title').find('li').removeClass('li-selected');
            $(this).addClass('li-selected');
            _index = $(this).index();

            $('.hot-content').find('ul').hide();
            $('.hot-content').find('ul').eq(_index).fadeIn();
            var cid = ""; redianquestion
            switch (_index) {
                case 0:
                    cid = 98;
                    break;
                case 1:
                    cid = 100;
                    break;
                case 2:
                    cid = 102;
                    break;
                case 3:
                    cid = 104;
                    break;
                case 4:
                    cid = 106;
                    break;
                case 5:
                    cid = 108;
                    break;
                default:

            }
            $("#redianquestion").attr("href", "/help/list.html?cid=" + cid);
        })
    }

});

function Search(elid, url) {
    if (elid != "") {
        var key = $(elid).val();
        //window.open(url + "?key=" + key);
        window.location.href = url + "?key=" + key;
    }
}

