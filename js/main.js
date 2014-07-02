$(document).ready(function () {
    $(window).scroll(function () {
        var top = $(window).scrollTop()
        console.log(top)
        /*put your color in background color */
        if (top > 20) { $('#totop').css('display', 'inline-block'); }
        else { $('#totop').css('display', 'none'); }

    })
    $('#ng1').click(function () {
        $('#slides ul li').css('display', 'none');
        $('#ng').fadeIn('slow');
        $('table').css('display','none')
        $('#ng3').fadeIn('slow');
        $('img').css('border', '0px')
        $('#ng1 img').css('border', '3px solid #e74c3c')
        $('#ng').css('border', '3px solid #e74c3c')
    })
    $('#cor1').click(function () {
        $('#slides ul li').css('display', 'none');
        $('#cor').fadeIn('slow');
        $('table').css('display', 'none')
        $('#cor3').fadeIn('slow');
        $('img').css('border', '0px')
        $('#cor1 img').css('border', '3px solid #27ae60')
        $('#cor').css('border', '3px solid #27ae60')
    })
    $('#her1').click(function () {
        $('#slides ul li').css('display', 'none');
        $('#her').fadeIn('slow');
        $('table').css('display', 'none')
        $('#her3').fadeIn('slow');
        $('img').css('border', '0px')
        $('#her1 img').css('border', '3px solid #7f8c8d')
        $('#her').css('border', '3px solid #7f8c8d')

    })
    $('#lic1').click(function () {
        $('#slides ul li').css('display', 'none');
        $('#lic').fadeIn('slow');
        $('table').css('display', 'none')
        $('#lic3').fadeIn('slow');
        $('img').css('border', '0px')
        $('#lic1 img').css('border', '3px solid #2980b9')
        $('#lic').css('border', '3px solid #2980b9')
    })
    $('#oli1').click(function () {
        $('#slides ul li').css('display', 'none');
        $('#oli').fadeIn('slow');
        $('table').css('display', 'none')
        $('#oli3').fadeIn('slow');
        $('img').css('border', '0px')
        $('#oli1 img').css('border', '3px solid #e67e22')
        $('#oli').css('border', '3px solid #e67e22')
    })
    $('a').click(function () {
        $('html, body').animate({
            scrollTop: $($(this).attr('href')).offset().top
        }, 500);
        return false;
    });
	$("#button").click(function(){
	window.location='SJMayoralContributionsByZip.zip';
	});
});
