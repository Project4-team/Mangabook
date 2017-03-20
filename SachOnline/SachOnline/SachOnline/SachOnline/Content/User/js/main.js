(function($) {

    $.fn.menumaker = function(options) {

        var navmenu = $(this),
            settings = $.extend({
                title: "Menu",
                format: "dropdown",
                sticky: false
            }, options);

        return this.each(function() {
            navmenu.prepend('<div id="menu-button">' + settings.title + '</div>');
            $(this).find("#menu-button").on('click', function() {
                $(this).toggleClass('menu-opened');
                var mainmenu = $(this).next('ul');
                if (mainmenu.hasClass('open')) {
                    mainmenu.hide().removeClass('open');
                } else {
                    mainmenu.show().addClass('open');
                    if (settings.format === "dropdown") {
                        mainmenu.find('ul').show();
                    }
                }
            });

            navmenu.find('li ul').parent().addClass('has-sub');

            multiTg = function() {
                navmenu.find(".has-sub").prepend('<span class="submenu-button"></span>');
                navmenu.find('.submenu-button').on('click', function() {
                    $(this).toggleClass('submenu-opened');
                    if ($(this).siblings('ul').hasClass('open')) {
                        $(this).siblings('ul').removeClass('open').hide();
                    } else {
                        $(this).siblings('ul').addClass('open').show();
                    }
                });
            };

            if (settings.format === 'multitoggle') multiTg();
            else navmenu.addClass('dropdown');

            if (settings.sticky === true) navmenu.css('position', 'fixed');

            resizeFix = function() {
                if ($(window).width() > 768) {
                    navmenu.find('ul').show();
                }

                if ($(window).width() <= 768) {
                    navmenu.find('ul').hide().removeClass('open');
                }
            };
            resizeFix();
            return $(window).on('resize', resizeFix);

        });
    };
})(jQuery);

$(document).ready(function() {
    "use strict";

    // MENU
    $("#navmenu").menumaker({
        title: "Menu",
        format: "multitoggle"
    });

    // TRAINERS LIST
    $('.trainers-slider').slick({
        arrows: true,
        speed: 800,
        centerMode: false,
        autoplay: false,
        slidesToShow: 4,
        slidesToScroll: 1,
        dots: false,
        responsive: [{
            breakpoint: 1024,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1,
                infinite: true
            }
        }, {
            breakpoint: 600,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }, {
            breakpoint: 480,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }]
    });

    // GALLERY
    $('.rp-slider').slick({
        arrows: true,
        speed: 800,
        centerMode: false,
        autoplay: false,
        slidesToShow: 4,
        slidesToScroll: 1,
        dots: false,
        responsive: [{
            breakpoint: 1024,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1,
                infinite: true
            }
        }, {
            breakpoint: 600,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }, {
            breakpoint: 480,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }]
    });

    // RECENT POSTS
    $('.rp-slider1').slick({
        arrows: true,
        speed: 800,
        centerMode: false,
        autoplay: false,
        slidesToShow: 3,
        slidesToScroll: 1,
        dots: false,
        responsive: [{
            breakpoint: 1024,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 1,
                infinite: true
            }
        }, {
            breakpoint: 600,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }, {
            breakpoint: 480,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }]
    });

    // CLIENTS
    $('.client-slider').slick({
        arrows: true,
        speed: 800,
        centerMode: false,
        autoplay: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        dots: true,
        responsive: [{
            breakpoint: 1024,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1,
                infinite: true
            }
        }, {
            breakpoint: 600,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }, {
            breakpoint: 480,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }]
    });

    // SIDEBAR POSTS
    $('.pp-slider').slick({
        arrows: true,
        speed: 800,
        centerMode: false,
        autoplay: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: false,
        responsive: [{
            breakpoint: 1024,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1,
                infinite: true
            }
        }, {
            breakpoint: 600,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }, {
            breakpoint: 480,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }]
    });

    // QUOTE
    $('.quote-slider').slick({
        arrows: false,
        speed: 800,
        centerMode: false,
        autoplay: true,
        autoplayspeed: 4000,
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: true
    });

    // Skills
    $('.home-stats').appear(function() {
        $('.stat1').animateNumber({ number: 300 }, 1200);
        $('.stat2').animateNumber({ number: 100 }, 1200);
        $('.stat3').animateNumber({ number: 50 }, 1000);
        $('.stat4').animateNumber({ number: 640 }, 1700);
    }, {
        accX: 0,
        accY: -200
    });

    $('.skills').appear(function() {
        $('.skills li:nth-child(1) h5 span em').animateNumber({ number: 90 }, 1200);
        $('.skills li:nth-child(2) h5 span em').animateNumber({ number: 95 }, 1200);
        $('.skills li:nth-child(3) h5 span em').animateNumber({ number: 80 }, 1200);
        $('.skills li:nth-child(4) h5 span em').animateNumber({ number: 70 }, 1200);
        $('.skills li:nth-child(5) h5 span em').animateNumber({ number: 80 }, 1200);
    }, {
        accX: 0,
        accY: -200
    });

    $('.tl-skills1').appear(function() {
        $('.tl-skills1 .tls-main:nth-child(1) .tls-bar em small').animateNumber({ number: 90 }, 1200);
        $('.tl-skills1 .tls-main:nth-child(2) .tls-bar em small').animateNumber({ number: 95 }, 1200);
        $('.tl-skills1 .tls-main:nth-child(3) .tls-bar em small').animateNumber({ number: 98 }, 1200);
    }, {
        accX: 0,
        accY: -200
    });

    $('.tl-skills2').appear(function() {
        $('.tl-skills2 .tls-main:nth-child(1) .tls-bar em small').animateNumber({ number: 90 }, 1200);
        $('.tl-skills2 .tls-main:nth-child(2) .tls-bar em small').animateNumber({ number: 95 }, 1200);
        $('.tl-skills2 .tls-main:nth-child(3) .tls-bar em small').animateNumber({ number: 98 }, 1200);
    }, {
        accX: 0,
        accY: -200
    });

    $('.tl-skills3').appear(function() {
        $('.tl-skills3 .tls-main:nth-child(1) .tls-bar em small').animateNumber({ number: 90 }, 1200);
        $('.tl-skills3 .tls-main:nth-child(2) .tls-bar em small').animateNumber({ number: 95 }, 1200);
        $('.tl-skills3 .tls-main:nth-child(3) .tls-bar em small').animateNumber({ number: 98 }, 1200);
    }, {
        accX: 0,
        accY: -200
    });

    $('.tl-skills4').appear(function() {
        $('.tl-skills4 .tls-main:nth-child(1) .tls-bar em small').animateNumber({ number: 90 }, 1200);
        $('.tl-skills4 .tls-main:nth-child(2) .tls-bar em small').animateNumber({ number: 95 }, 1200);
        $('.tl-skills4 .tls-main:nth-child(3) .tls-bar em small').animateNumber({ number: 98 }, 1200);
    }, {
        accX: 0,
        accY: -200
    });

    $('.tl-skills1').appear(function() {
		$(".tl-skills1 .tls-bar span").removeClass("nowidth");
    }, {
        accX: 0,
        accY: -200
    });

    $('.tl-skills2').appear(function() {
		$(".tl-skills2 .tls-bar span").removeClass("nowidth");
    }, {
        accX: 0,
        accY: -200
    });

    $('.tl-skills3').appear(function() {
		$(".tl-skills3 .tls-bar span").removeClass("nowidth");
    }, {
        accX: 0,
        accY: -200
    });

    $('.tl-skills4').appear(function() {
		$(".tl-skills4 .tls-bar span").removeClass("nowidth");
    }, {
        accX: 0,
        accY: -200
    });


    $('.skill-bar').appear(function() {
		$(".skill-bar span").removeClass("nowidth");
    }, {
        accX: 0,
        accY: -200
    });

    // Pie Chart
    $('.circular-skills').appear(function() {
	$('.chart').easyPieChart({
		easing: 'easeOutBounce',
		onStep: function(from, to, percent) {
			$(this.el).find('.percent').text(Math.round(percent));
		}
	});
    }, {
        accX: 0,
        accY: -200
    });

    // TOGGLE
    $('.toggle1').each(function() {
        $(this).find('.toggle-content1').show();
    });
    $('.toggle1 a.toggle-trigger1').on("click", function() {
        var el = $(this),
            parent = el.closest('.toggle1');
        if (el.hasClass('active')) {
            parent.find('.toggle-content1').slideToggle();
            el.removeClass('active');
        } else {
            parent.find('.toggle-content1').slideToggle();
            el.addClass('active');
        }
        return false;
    });

    $('.toggle').each(function() {
        $(this).find('.toggle-content').hide();
    });

    $('.toggle a.toggle-trigger').on("click", function() {
        var el = $(this),
            parent = el.closest('.toggle');
        if (el.hasClass('active')) {
            parent.find('.toggle-content').slideToggle();
            el.removeClass('active');
        } else {
            parent.find('.toggle-content').slideToggle();
            el.addClass('active');
        }
        return false;
    });

    // PRICE RNAGE
    $("#sliderRange")
        .slider({
            range: true,
            min: 25,
            max: 9500,
            step: 1,
            values: [1050, 8500],
            slide: function(event, ui) {
                var price1 = ui.values[0];
                var price2 = ui.values[1];
                $("#price1")
                    .val("\u20ac" + price1);
                $("#price2")
                    .val("\u20ac" + price2);
            }
        });

    $('#price1')
        .bind('keyup', function() {
            var from = $(this)
                .val();
            var to = $('#price2')
                .val();
            $('#sliderRange')
                .slider('option', 'values', [from, to]);
        });

    $('#price2')
        .bind('keyup', function() {
            var from = $('#price1')
                .val();
            var to = $(this)
                .val();
            $('#sliderRange')
                .slider('option', 'values', [from, to]);
        });

    // MAIN SLIDER
    var owl = $("#main-slider1");
    owl.owlCarousel({
        navigation: false,
        pagination: true,
        autoPlay: 5000,
        singleItem: true,
        transitionStyle: "fade"
    });

    // Custom Select
    enableSelectBoxes();
});

///* Loading Script */
//Royal_Preloader.config({
//	mode           : 'number',
//	showProgress   : true,
//	showPercentage : true,
//	background     : '#132438'
//});

function enableSelectBoxes() {
    $('div.selectBox').each(function() {
        $(this).children('span.selected').html($(this).children('div.selectOptions').children('span.selectOption:first').html());
        $(this).attr('value', $(this).children('div.selectOptions').children('span.selectOption:first').attr('value'));

        $(this).children('span.selected,span.selectArrow').on('click', function() {
            if ($(this).parent().children('div.selectOptions').css('display') == 'none') {
                $(this).parent().children('div.selectOptions').css('display', 'block');
            } else {
                $(this).parent().children('div.selectOptions').css('display', 'none');
            }
        });

        $(this).find('span.selectOption').on('click', function() {
            $(this).parent().css('display', 'none');
            $(this).closest('div.selectBox').attr('value', $(this).attr('value'));
            $(this).parent().siblings('span.selected').html($(this).html());
        });
    });
}

$(window).load(function() {

    // Isotope
    var $container = $('#folio');
    $container.isotope({
        itemSelector: '.studio-item',
        transitionDuration: '0.8s'
    });

    var $optionSets = $('#studio .studio-filter'),
        $optionLinks = $optionSets.find('a');
    $optionLinks.click(function() {
        var $this = $(this);
        if ($this.hasClass('selected')) {
            return false;
        }
        var $optionSet = $this.parents('.studio-filter');
        $optionSet.find('.selected').removeClass('selected');
        $this.addClass('selected');
        // make option object dynamically, i.e. { filter: '.my-filter-class' }
        var options = {},
            key = $optionSet.attr('data-option-key'),
            value = $this.attr('data-option-value');
        value = value === 'false' ? false : value;
        options[key] = value;
        if (key === 'layoutMode' && typeof changeLayoutMode === 'function') {
            changeLayoutMode($this, options);
        } else {
            $container.isotope(options);
        }
        return false;
    });

    // Isotope
    var $container = $('#course-folio');
    $container.isotope({
        layoutMode: "masonry",
        masonry: {
            columnWidth: 2
        },
        itemSelector: '.course-list',
        transitionDuration: '0.8s'
    });

    var $optionSets = $('#course-grid .studio-filter'),
        $optionLinks = $optionSets.find('a');
    $optionLinks.click(function() {
        var $this = $(this);
        if ($this.hasClass('selected')) {
            return false;
        }
        var $optionSet = $this.parents('.studio-filter');
        $optionSet.find('.selected').removeClass('selected');
        $this.addClass('selected');
        // make option object dynamically, i.e. { filter: '.my-filter-class' }
        var options = {},
            key = $optionSet.attr('data-option-key'),
            value = $this.attr('data-option-value');
        value = value === 'false' ? false : value;
        options[key] = value;
        if (key === 'layoutMode' && typeof changeLayoutMode === 'function') {
            changeLayoutMode($this, options);
        } else {
            $container.isotope(options);
        }
        return false;
    });
});

// MAP TRIGGER
$(".map-trigger").on('click', function() {
    $(".footer-bottom .contact-content").toggleClass("fcc-active");
    $("footer").toggleClass("footer-active");
    $(".map-trigger i").toggleClass("fa-angle-double-down , fa-angle-double-up");
});

// FOLIO POPUP
$(".studio-thumb").on("click", function() {
    $(".folio-popup").addClass("folio-pop-active");
});

$(".pop-close").on("click", function() {
    $(".folio-popup").removeClass("folio-pop-active");
});

// EVENT CALENDAR
$(".s-event").on("click", function() {
  $(".schedule-table tbody tr td").removeClass('event-active');
  $(this).parent().toggleClass('event-active');
});

$(".schedule-info li").hover(function() {
  $(".schedule-info li").removeClass('active');
  $(this).addClass('active');
});

$(".s-close").on("click", function() {
    $(this).parent().parent().removeClass('event-active');
});

$(".shop-cart").on("click", function() {
	$(".scart-wrap").slideToggle();
});

// Quantity Meter
jQuery("#quantity").append('<input type="button" value="+" id="add1" class="plus" />').prepend('<input type="button" value="-" id="minus1" class="minus" />');
jQuery(".plus").click(function() {
	var currentVal = parseInt(jQuery(this).prev(".qty").val());
	if (!currentVal || currentVal=="" || currentVal == "NaN") currentVal = 0;
	jQuery(this).prev(".qty").val(currentVal + 1); 
});
	
jQuery(".minus").click(function() {
	var currentVal = parseInt(jQuery(this).next(".qty").val());
	if (currentVal == "NaN") currentVal = 0;
	if (currentVal > 0)
	        {
	            jQuery(this).next(".qty").val(currentVal - 1);
	        }
});

$(window).scroll(function() {
    var value = $(this).scrollTop();
    if (value > 500)
        $(".header-wrap").addClass("header-sticky");
    else
        $(".header-wrap").removeClass("header-sticky");
});

$(function() {
	$('a.page-scroll').bind('click', function(event) {
	var $anchor = $(this);
	$('html, body').stop().animate({
	scrollTop: $($anchor.attr('href')).offset().top
	}, 1500, 'easeInOutExpo');
	event.preventDefault();
	});
});

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').on("click", function() {
	$('.navbar-toggle:visible').click();
});
