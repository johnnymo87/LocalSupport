// Tips on stopPropagation(): http://fuelyourcoding.com/jquery-events-stop-misusing-return-false/

(function($) {
    'use strict';
    $.fn.TIMO = function() {
        var that = this;
        $(this).click(function() {
            var menu = $('#menuLogin');
            if (that.attr('data-signed_in') === 'false') {
                if (!jQuery.contains(document, $('.in')[0])) {
                    $('.nav-collapse').collapse('show');
                }
                if (!menu.hasClass('open')) {
                    menu.addClass('open')
                }
//                $.session.set('org_id', that.attr('data-org_id'));
                return false;
            }
        });
    }
})(jQuery);