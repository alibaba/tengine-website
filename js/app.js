$(function () {

    $('#particles-js').length && particlesJS('particles-js', {
        "particles": {
            "number": {
                "value": 80,
                "density": {
                    "enable": true,
                    "value_area": 800
                }
            },
            "color": {
                "value": "#ddd"
            },
            "shape": {
                "type": "circle",
                "stroke": {
                    "width": 0,
                    "color": "#888888"
                },
                "polygon": {
                    "nb_sides": 5
                },
                "image": {
                    "src": "img/github.svg",
                    "width": 100,
                    "height": 100
                }
            },
            "opacity": {
                "value": 0.5,
                "random": false,
                "anim": {
                    "enable": false,
                    "speed": 1,
                    "opacity_min": 0.1,
                    "sync": false
                }
            },
            "size": {
                "value": 5,
                "random": true,
                "anim": {
                    "enable": false,
                    "speed": 40,
                    "size_min": 0.1,
                    "sync": false
                }
            },
            "line_linked": {
                "enable": true,
                "distance": 150,
                "color": "#777",
                "opacity": 0.4,
                "width": 1
            },
            "move": {
                "enable": true,
                "speed": 6,
                "direction": "none",
                "random": false,
                "straight": false,
                "out_mode": "out",
                "attract": {
                    "enable": false,
                    "rotateX": 600,
                    "rotateY": 1200
                }
            }
        },
        "interactivity": {
            "detect_on": "canvas",
            "events": {
                "onhover": {
                    "enable": true,
                    "mode": "repulse"
                },
                "onclick": {
                    "enable": true,
                    "mode": "push"
                },
                "resize": true
            },
            "modes": {
                "grab": {
                    "distance": 400,
                    "line_linked": {
                        "opacity": 1
                    }
                },
                "bubble": {
                    "distance": 400,
                    "size": 40,
                    "duration": 2,
                    "opacity": 8,
                    "speed": 3
                },
                "repulse": {
                    "distance": 200
                },
                "push": {
                    "particles_nb": 4
                },
                "remove": {
                    "particles_nb": 2
                }
            }
        },
        "retina_detect": true,
        "config_demo": {
            "hide_card": false,
            "background_color": "#b61924",
            "background_image": "",
            "background_position": "50% 50%",
            "background_repeat": "no-repeat",
            "background_size": "cover"
        }
    });

    function updateURL(lang) {
        switch (lang) {
            case 'cn':
                switch (location.pathname) {
                    case '/':
                    case '/index_en.html':
                    case '/index.html':
                        location.pathname = 'index_cn.html';
                        break;
                    default:
                        if (location.pathname.match(/^(\/)(.+)(\/)(.+)(\.html)$/) && !location.pathname.match(/^(\/)(.+)(_cn)(\/)(.+)(_cn\.html)$/)) {
                            location.pathname = location.pathname.replace(/^(\/)(.+)(\/)(.+)(\.html)$/, "$1$2_cn$3$4_cn$5");
                            return;
                        } else if (!location.pathname.match(/^(\/)(.+)(_cn\.html)$/)) {
                            location.pathname = location.pathname.replace(/^(\/)(.+)(\.html)$/, "$1$2_cn$3");
                        }
                        break;
                }
                break;
            case 'en':
            default:
                switch (location.pathname) {
                    case '/':
                        break;
                    case '/index_cn.html':
                        location.pathname = 'index_en.html';
                        break;
                    default:

                        if (location.pathname.match(/^(\/)(.+)(_cn)(\/)(.+)(_cn\.html)$/)) {
                            // location.pathname = location.pathname.replace(/^(\/)(.+)(_cn)(\/)(.+)(_cn\.html)$/, "$1$2$4$5.html");
                            return;
                        }

                        if (location.pathname.match(/^(\/)(.+)(_cn\.html)$/)) {
                            location.pathname = location.pathname.replace(/^(\/)(.+)(_cn\.html)$/, "$1$2.html")
                        }
                        break;
                }
                break;
        }
    }

    var cur = location.pathname.match(/^(\/)(.+)(_cn\.html)$/) ? 'cn' : 'en';
    if ($.cookie('lang') !== cur) {
        updateURL($.cookie('lang'));
    }
    if ($.cookie('lang') === 'cn') {
        $('#nav-menu .menu-item').each(function (k, item) {
            $(item).attr('href', item.href.replace('.html', '_cn.html'));
        });
    }

    (function (control) {
        if (!control.length) {
            return;
        }
        switch ($.cookie('lang')) {
            case 'cn':
                control.append('<option value="cn" selected>China</option><option value="en">English</option>')
                break;
            case 'en':
            default:
                control.append('<option value="cn">China</option><option value="en" selected>English</option>')
                break;
        }
        control.on('change', function () {
            $.cookie('lang', this.value, {expires: 30, path: '/'});
            location.reload();
        });

    })($('.lang-switch'));


});



