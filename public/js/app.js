$(document).ready(function () {
    $(document).on('click', 'button[data-type="get-register"]',function (event) {
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
    $(document).on('click', 'button[data-type="get-login"]', function (event) {
        $.ajax({
            url: '/login/get_login_module',
            method: 'post',
            dataType: 'html',
            success: function (data) {
                $('div[data-type="register-card"]').fadeOut(300, function () {
                    this.remove();
                    $('.container-fluid').append(data)
                });
            }
        })
    });
    $(document).on('click', 'button[data-type="login"]',function (event) {
        let login_field = $('#login');
        let password_field = $('#password');

        let login = login_field.val().trim();
        let password = password_field.val().trim();

        let fields = {
            login: {field: login_field, option: {min_length: 3, max_length: 55, reg: ''}},
            password: {field: password_field, option: {min_length: 3, max_length: 55, reg: ''}}
        };
        let validation = valid_fields(fields);
        if(!validation.error){
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
    });
    $(document).on('click', 'button[data-type="register"]', function (event) {
        let first_name_field = $('#first-name');
        let middle_name_field = $('#middle-name');
        let last_name_field = $('#last-name');
        let email_field = $('#email');
        let login_field = $('#login');
        let password_field = $('#password');
        let confirm_password_field = $('#confirm-password');

        let first_name = first_name_field.val().trim();
        let middle_name = middle_name_field.val().trim();
        let last_name = last_name_field.val().trim();
        let email = email_field.val().trim();
        let login = login_field.val().trim();
        let password = password_field.val().trim();
        let confirm_password = confirm_password_field.val().trim();

        let fields = {
            first_name: {field: first_name_field, option: {min_length: 3, max_length: 55, reg: ''}},
            middle_name: {field: middle_name_field, option: {min_length: 3, max_length: 55, reg: ''}},
            last_name: {field: last_name_field, option: {min_length: 3, max_length: 55, reg: ''}},
            email: {field: email_field, option: {min_length: 3, max_length: 55, reg: ''}},
            login: {field: login_field, option: {min_length: 3, max_length: 55, reg: ''}},
            password: {field: password_field, option: {min_length: 3, max_length: 55, reg: ''}}
        };
        let validation = valid_fields(fields);
        if(!validation.error){
            if(password !== confirm_password){
                field_reaction(password_field, true, 'Пароли не совпадают');
                field_reaction(confirm_password_field, true, 'Пароли не совпадают');
            }
            else {
                let data = {
                    first_name: first_name,
                    middle_name: middle_name,
                    last_name: last_name,
                    email: email,
                    login: login,
                    password: password
                };
                $.ajax({
                    url: '/register/add_user',
                    method: 'post',
                    dataType: 'json',
                    data: data,
                    success: function (data) {
                        if(data.error){

                        }
                        else{
                            location = '/login';
                        }
                    }
                });
            }
        }

    });

    $('button[data-type="get-repeating-email"]').click(function () {
        $.ajax({
            url:'/user/get_repeating_email',
            method: 'post',
            dataType: 'json',
            success: function (response) {
                $('.data-holder').children().remove();
                let list = '';
                if(!response.error){
                    $.each(response.list, function (key, item) {
                        if(list === ''){
                            list = '<li>'+item.email+'</li>';
                        }
                        else{
                            list += '<li>'+item.email+'</li>';
                        }

                    })
                }
                $('.data-holder').append('<h1>Повторяющиеся email</h1>').append('<ul style="list-style: none">'+list+'</ul>');

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

                $('.data-holder').append('<h1>Пользователи без заказов</h1>').append('<ul style="list-style: none">'+list+'</ul>');

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
                $('.data-holder').append('<h1>Пользователи, у которых более 2-х заказов</h1>').append('<ul style="list-style: none">'+list+'</ul>');
            }
        });
    });
    $('button[data-type="logout"]').click(function () {
        $.ajax({
            url:'/login/logout',
            method: 'post',
            dataType: 'json',
            success: function (data) {
                location = data;
            }
        });
    })

    $('button[data-type="profile"]').click(function () {
        $.ajax({
            url: '/user/get_profile',
            method: 'post',
            dataType: 'html',
            success: function(data){
                Swal.fire({
                    html: data,
                    background: 'rgba(0,0,0,0)',
                    showConfirmButton: false,
                    onBeforeOpen: () => {
                        $(document).on('click', 'button[data-type="edit-profile"]', function () {
                            let full_name = $('p[data-type="full-name"]').text();
                            $('p[data-type="full-name"]').replaceWith('<input style="margin-bottom: 5px" type="text" id="full-name" class="form-control" placeholder="Введите ФИО" value="'+full_name+'">');
                            $('button[data-type="edit-profile"]').replaceWith('<button class="btn btn-block btn-success" data-type="save-profile">Сохранить</button>');
                            $('.password-holder').show();
                        });
                        $(document).on('click', 'button[data-type="save-profile"]', function () {
                            let password_field = $('#password');
                            let full_name_field = $('#full-name');
                            let confirm_password_field = $('#confirm-password');

                            let full_name = full_name_field.val().trim();
                            let password = password_field.val().trim();
                            let confirm_password = confirm_password_field.val().trim();
                            if(full_name === ''){
                                field_reaction(full_name_field, true, 'Пустое значение')
                            }
                            else{
                                if(password === ''){
                                    field_reaction(password_field, true, 'Пустое значение')
                                }
                                else{
                                    if(confirm_password === ''){
                                        field_reaction(confirm_password_field, true, 'Пустое значение')
                                    }
                                    else{
                                        if(password !== confirm_password){
                                            field_reaction(password_field, true, 'Пароли не совпадают');
                                            field_reaction(confirm_password_field, true, 'Пароли не совпадают');
                                        }
                                        else{
                                            $.ajax({
                                                url: '/user/update_user',
                                                method: 'post',
                                                dataType: 'json',
                                                data: {full_name: full_name, password: password},
                                                success: function (data) {
                                                    if(data.error){

                                                    }
                                                    else{
                                                        $('.password-holder').hide();
                                                        $('#full-name').replaceWith('<p class="text-left" data-type="full-name">'+full_name+'</p>');
                                                        $('button[data-type="save-profile"]').replaceWith('<button class="btn btn-block btn-success" data-type="edit-profile">Редактировать</button>');
                                                    }
                                                }
                                            })
                                        }
                                    }
                                }
                            }
                        });
                    }
                })
            }
        })
    })
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

function valid_fields(fields) {
    let field_val;
    let field_valid = {error: false, status: 'success'};
    let response = {error: false, status: 'success'};
    $.each(fields, function (key, item) {
        field_val = item.field.val().trim();
        if(field_val === ''){
            field_valid = {error: true, status: 'Пустое значение'}
        }
        else {
            if(field_val.length < item.option.min_length){
                field_valid = {error: true, status: 'Минимальное значение для поля '+item.option.min_length+ ' символа'}
            }
            else {
                if(field_val.length > item.option.max_length){
                    field_valid = {error: true, status: 'Максимальное значение для поля '+item.option.max_length+ ' символа'}
                }
            }
        }
        if(field_valid.error){
            field_reaction(item.field, field_valid.error, field_valid.status);
            response = {error: true, status: 'valid error'}
        }
    });
    return response;
}

function field_reaction(field, error, message) {
    if(error){
        field.css({
            border: '1px solid #D62B3F'
        });
        field.val('');
        field.attr('placeholder', message);
    }
    else{
        field.css({
            border: '1px solid green'
        });
        field.val('');
        field.attr('placeholder', message);
    }
}