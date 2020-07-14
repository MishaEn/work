<div class="card">
    <h5 class="card-header text-left">Профиль</h5>
    <div class="card-body">
        <h5 class="card-title text-left">ФИО</h5>
        <p data-type="full-name" class="text-left"><?php echo $data['data']['last_name'].' '.$data['data']['first_name'].' '.$data['data']['middle_name']?></p>
        <div class="password-holder" style="display: none; margin-top: 5px">
            <h5 class="card-title text-left">Новый пароль</h5>
            <form>
                <div class="form-group text-left">
                    <label for="password">Пароль</label>
                    <input class="form-control" id="password" type="password" data-type="password" placeholder="Введите новый пароль">
                </div>
                <div class="form-group text-left">
                    <label for="confirm-password">Повторите пароль</label>
                    <input class="form-control" id="confirm-password" type="password" data-type="confirm-password" placeholder="Повторите новый пароль">
                </div>


            </form>
        </div>
    </div>
    <div class="card-footer">
        <button class="btn btn-block btn-success" data-type="edit-profile">Редактировать</button>
    </div>
</div>