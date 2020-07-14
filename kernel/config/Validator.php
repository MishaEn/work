<?php


class Validator
{
    public function validate($field, $opt){
        return ['error' => false, 'status' => 'success'];
    }
    public function mass_validate($fields){
        $response = ['error' => false, 'status' => 'success', 'fields' => []];
        foreach ($fields as $key => $field){
            if($fields[$key]['field'] == ''){
                array_push($response['fields'], [$key => ['error' => true, 'status' => 'Пустое значение']]);
                $response['error'] = true;
                $response['status'] = 'validate error';
                continue;
            }
            else{
                if(strlen($fields[$key]['field']) < $fields[$key]['option']['min_length']){
                    array_push($response['fields'], [$key => ['error' => true, 'status' => 'Минимальное значение для поля 3 символа']]);
                    $response['error'] = true;
                    $response['status'] = 'validate error';
                    continue;
                }
                else{
                    if(strlen($fields[$key]['field']) > $fields[$key]['option']['max_length']){
                        array_push($response['fields'], [$key => ['error' => true, 'status' => 'Максимальное значение для поля 55 символов']]);
                        $response['error'] = true;
                        $response['status'] = 'validate error';
                        continue;
                    }
                    else{
                        array_push($response['fields'], [$key => ['error' => false, 'status' => 'success']]);
                    }
                }
            }

        }
        return $response;
    }
}