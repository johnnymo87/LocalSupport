// Lesson: You can't spy on a $(css) jQuery DOM selector, it's not an object, it's a return value.
// So instead of spying on $('.nav-collpase'), I spy on $.fn .
// http://stackoverflow.com/a/6198122/2197402

// Lesson: Event spying requires knowing the actual event triggered when the function is called.
// Calling collapse will trigger the events 'show' or 'hide'
// https://github.com/seyhunak/twitter-bootstrap-rails/blob/master/app/assets/javascripts/twitter/bootstrap/bootstrap-collapse.js#L69

describe('This is my Organization button', function () {
    var timo, nav, menu;
    beforeEach(function () {
        setFixtures('<a id="TIMO">This is my organization</a>');
        appendSetFixtures(sandbox({class: 'nav-collapse'}));
        appendSetFixtures('<li id="menuLogin" class="dropdown"></li>');
        appendSetFixtures('<form id="loginForm"></form>');
        timo = $('#TIMO');
        nav = $('.nav-collapse');
        menu = $('#menuLogin');
        spyOnEvent(timo, 'click');
        timo.TIMO();
    });
    it('matchers should match', function () {
        expect(timo.length).not.toBe(0);
        expect(nav.length).not.toBe(0);
        expect(menu.length).not.toBe(0);
    });
    describe('when not logged in', function () {
        var spyCollapse;
        beforeEach(function () {
            timo.attr('data-signed_in', 'false');
            timo.attr('data-org_id', '10');
            spyCollapse = spyOn($.fn, 'collapse').andCallThrough();
            spyOnEvent(nav, 'show');
        });
        it('click propagation should be stopped', function () {
            timo.click();
            expect('click').toHaveBeenStoppedOn(timo);
        });
        describe('hidden input inserted into login form', function () {
            var login, POI;
            beforeEach(function() {
                login = $('#loginForm');
                spyOn($.fn, 'append').andCallThrough();
                POI = 'user[pending_organization_id]'
            });
            it('inserts private field for organization user is claiming', function () {
                timo.click();
                expect(login.children('input[name="'+POI+'"]').length).toEqual(1)
            });
            it('does not insert private field if it is already present', function () {
                timo.click();
                timo.click();
                expect($.fn.append.calls.count()).toEqual(1);
            });
        });
        describe('when login menu is closed and TIMO is clicked', function () {
            beforeEach(function () {
                timo.click()
            });
            it('$.fn.TIMO will call collapse("show")', function () {
                expect(spyCollapse).toHaveBeenCalledWith('show');
            });
            it('nav will have "show" event', function () {
                expect('show').toHaveBeenTriggeredOn(nav)
            });
            it('nav changes attributes', function () {
                expect(nav).toHaveClass('in');
            });
            it('menu changes attributes', function () {
                expect(menu).toHaveClass('open');
            });
        });
        describe('when login menu is open and TIMO is clicked', function () {
            beforeEach(function () {
                nav.addClass('in');
                menu.addClass('open');
                timo.click()
            });
            it('$.fn.TIMO will not call collapse("show")', function () {
                expect(spyCollapse).not.toHaveBeenCalledWith('show');
            });
            it('nav will not have "show" event', function () {
                expect('show').not.toHaveBeenTriggeredOn(nav)
            });
            it('nav does not change attributes', function () {
                expect(nav).toHaveClass('in');
            });
            it('menu does not change attributes', function () {
                expect(menu).toHaveClass('open');
            });
        });
    });
    describe('when logged in', function () {
        it('should return true, allowing default behavior', function () {
            timo.attr('data-signed_in', 'true');
            timo.click();
            expect('click').not.toHaveBeenStoppedOn(timo);
        });
    });
});

