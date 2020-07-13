$(document).ready(function () {
    $('button[data-type="login"]').click(function (event) {
        let login_field = $('#login');
        let password_field = $('#password');

        let login = login_field.val().trim();
        let password = password_field.val().trim();

        let valid_login = valid_filed(login_field, {min_length: 3, max_length: 55, reg: ''});
        let valid_password = valid_filed(password_field, {min_length: 3, max_length: 55, reg: ''});
        if(!valid_login.error && !valid_password.error){
            $.ajax({
                url: '/login/authenticate',
                method: 'post',
                dataType: 'json',
                data: {login: login, password: password},
                success: function (data) {
                    if(data.error){

                    }
                    else{
                       location = '/';
                    }
                }
            })
        }
        else{
            if(valid_login.error){
                login_field.css({
                    border: '1px solid #D62B3F'
                });
                login_field.val('');
                login_field.attr('placeholder', valid_login.status)
            }
            if(valid_password.error){
                password_field.css({
                    border: '1px solid #D62B3F'
                });
                password_field.val('');
                password_field.attr('placeholder', valid_password.status)
            }
        }


});
    $('button[data-type="get-register"]').click(function (event) {
        $.ajax({
            url: '/register/get_register_module',
            method: 'post',
            dataType: 'html',
            success: function (data) {
                $('div[data-type="login-card"]').fadeOut(300, function () {
                    this.remove();
                    $('.container-fluid').append(data)
                });
            }
        })
    });

    $('button[data-type="get-repeating-email"]').click(function () {
        $.ajax({
            url:'/user/get_repeating_email',
            method: 'post',
            dataType: 'json',
            success: function (response) {
                $('.data-holder').children().remove();
                if(!response.error){
                    $('.data-holder').append(response.data);
                }

            }
        });
    });
    $('button[data-type="get-user-without-order"]').click(function () {
        $.ajax({
            url:'/user/get_user_without_order',
            method: 'post',
            dataType: 'json',
            success: function (response) {
                $('.data-holder').children().remove();
                if(!response.error){

                    $('.data-holder').append(response.data);
                }

            }
        });
    });
    $('button[data-type="get-user-with-order"]').click(function () {
        $.ajax({
            url:'/user/get_user_with_order',
            method: 'post',
            dataType: 'json',
            success: function (response) {
                $('.data-holder').children().remove();
                let list = '';
                if(!response.error){
                    $.each(response.list, function (key, item) {
                        if(list === ''){
                            list = '<li>'+item.login+'</li>';
                        }
                        else{
                            list += '<li>'+item.login+'</li>';
                        }

                    })
                }
                $('.data-holder').append('<ul style="list-style: none">'+list+'</ul>');
            }
        });
    });
});

function valid_filed(field, opt) {
    let response = {error: false, status: 'success'};
    let field_val = field.val().trim();
    if(field_val === ''){
        response = {error: true, status: 'Пустое значение'}
    }
    else {
        if(field_val.length < opt.min_length){
            response = {error: true, status: 'Минимальное значение для поля '+opt.min_length+ ' символа'}
        }
        else {
            if(field_val.length > opt.max_length){
                response = {error: true, status: 'Максимальное значение для поля '+opt.max_length+ ' символа'}
            }
        }
    }
    return response;
}