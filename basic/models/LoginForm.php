<?php

namespace app\models;

use Yii;
use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 *
 * @property User|null $user This property is read-only.
 *
 */
class LoginForm extends Model
{
    public $username;
    public $password;
    public $rememberMe = true;
    public $fecha_acceso;
    public $confirmar = false;

    private $_user = false;


    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            // username and password are both required
            [['username', 'password'], 'required'],
            // rememberMe must be a boolean value
            ['rememberMe', 'boolean'],
            // password is validated by validatePassword()
            ['password', 'validatePassword'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'username' => Yii::t('app', 'Nick'),
            'password' => Yii::t('app', 'Contraseña'),
            'rememberMe' => Yii::t('app', 'Recuérdame'),            
        ];
    }

    /**
     * Validates the password.
     * This method serves as the inline validation for password.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */
    public function validatePassword($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();

            if (!$user || !$user->validatePassword($this->password)) {
                $this->addError($attribute, 'Nick o Contraseña incorrectos.');
            }
        }
    }

    /**
     * Logs in a user using the provided username and password.
     * @return bool whether the user is logged in successfully
     */
    public function login()
    {
       //cargamos el modelo del usuario
        $this->_user = Usuario::findByUsername($this->username); 
       
        //comprobamos si el usuario existe...
        $existe = isset($this->_user->id);
        if(!$existe){
            $this->addError('username', 'El usuario no existe.');
            return false;
        }

        //obtener las variables de bloqueo de la configuracion, si no existen, le damos un valor por defecto
        if(!($max_accesos = Configuracion::findOne(['variable' => 'max_accesos']))) $max_accesos = 5;
        else $max_accesos = $max_accesos->valor;

        if(!($tiempo_bloqueo = Configuracion::findOne(['variable' => 'tiempo_bloqueo']))) $tiempo_bloqueo = 60;
        else $tiempo_bloqueo = $tiempo_bloqueo->valor;

        if($this->_user->bloqueado == 1 ){
            
            //$this->_user->updateAttributes(['num_accesos' => $this->_user->num_accesos+=1]);

            $fecha_acceso = $this->_user->fecha_acceso;
            $ahora =  strtotime(date("Y-m-d H:i:s"));
            $segundos = $ahora - strtotime($fecha_acceso);

                         
            if($segundos <= $tiempo_bloqueo){
                $this->addError('password', 'Acceso bloqueado tras '.$max_accesos.' intentos fallidos. Espera '.($tiempo_bloqueo-$segundos).' segundos.');
                return false;
                             
            }else{
                $this->_user->updateAttributes(['num_accesos' => 0, 'bloqueado' => 0,'fecha_bloqueo' => NULL,'notas_bloqueo' => NULL]);
            }
        }
        
        if ($this->validate()) {

            if($this->_user->confirmado == 0){
                //si el usuario no esta confimado, le mandamos a la pantalla de confirmación de usuario...
                $this->confirmar = true;
                return false;



            }else{

              return Yii::$app->user->login($this->getUser(), $this->rememberMe ? 3600*24*30 : 0);  
            }
            
        }else{
            //preparar el modelo para guardar el registro...
            Registro::Registrar('A',"Intento de acceso fallido","LoginForm.php");  
           
            //si es el primer acceso fallido, almacenamos la fecha de acceso
            if($this->_user->num_accesos == 0){
                $this->_user->updateAttributes(['fecha_acceso' => date("Y-m-d H:i:s"),'num_accesos' => $this->_user->num_accesos+=1]);
            }

            else{

                $this->_user->updateAttributes(['num_accesos' => $this->_user->num_accesos+=1]);

                
                if($this->_user->num_accesos >= $max_accesos){
                    //bloquear el acceso
                    $this->_user->updateAttributes(['bloqueado' => 1,'fecha_bloqueo' => date("Y-m-d H:i:s"),'notas_bloqueo' => 'Número de accesos fallidos excedido.']);
                    
                }

            } 

        }
        return false;


    }

    /**
     * Finds user by [[username]]
     *
     * @return User|null
     */
    public function getUser()
    {
        if ($this->_user === false) {
            $this->_user = User::findByUsername($this->username);
        }

        return $this->_user;
    }
}
