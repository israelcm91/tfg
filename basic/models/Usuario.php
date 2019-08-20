<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "usuarios".
 *
 * @property int $id
 * @property string $email Correo electrónico y login del usuario.
 * @property string $password Contraseña de acceso del usuario-
 * @property string $nick Nombre identificativo del usuario.
 * @property string $nombre
 * @property string $apellidos
 * @property string $fecha_nacimiento Fecha de nacimiento del usuario o NULL si no quiere informar de ello.
 * @property string $fecha_registro Fecha y hora de registro del usuario.
 * @property int $confirmado Indicador de que el usuario a confirmado su registro.(0 no confirmado, 1 confirmado).
 * @property string $fecha_acceso Fecha y hora del ultimo acceso del usuario. Debería estar a null si no se accedió nunca.
 * @property int $num_accesos Contador de accesos fallidos del usuario. 0 si no ha tenido o se reinició por un acceso válido.
 * @property int $bloqueado Indicador de usuario bloqueado: 0 = no, 1 = si (bloqueado por accesos), 2 = si (bloqueado por administrador)
 * @property string $fecha_bloqueo Fecha y hora del bloqueo del usuario. Debería ser NULL si no esta bloqueada, o si ha sido desbloqueada.
 * @property string $notas_bloqueo Notas visibles sobre el motivo del bloqueo del usuario, o NULL si no hay. Se muestra por defecto según indique (bloqueado).
 */
class Usuario extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'usuarios';
    }


    //lista de Roles posibles
    protected static $roles = array(
        0 => 'usuario', 
        1 => 'redactor', 
        2 => 'moderador', 
        3 => 'admin', 
        4 => 'sysadmin', 

    );

    public $email2;
    public $password2;
    public $authKey;

    public $oldpass;
    public $newpass;
    public $newpass2;

    //devuelve el array de roles
    public static function listaRoles()
    {
        return self::$roles;
    }


    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['password', 'nick', 'nombre', 'apellidos'], 'required'],
            [['fecha_nacimiento', 'fecha_registro', 'fecha_acceso', 'fecha_bloqueo'], 'safe'],
            [['confirmado', 'num_accesos', 'bloqueado'], 'integer'],
            [['notas_bloqueo'], 'string'],
            [['email'], 'string', 'max' => 255],
            [['email2'], 'string','max' => 255],
            [['email2'],'compare','compareAttribute'=>'email'],
            [['password'], 'string', 'max' => 60],
            [['oldpass'], 'string', 'max' => 60],
            [['newpass'], 'string', 'max' => 60],
            [['newpass2'], 'string', 'max' => 60],
            [['password2'], 'string', 'max' => 60],
            [['password2'], 'compare','compareAttribute'=>'password'],
            [['newpass2'], 'compare','compareAttribute'=>'newpass'],
            [['nick'], 'string', 'max' => 25],
            [['nombre'], 'string', 'max' => 50],
            [['apellidos'], 'string', 'max' => 100],
            [['nick'], 'unique'],
            [['email'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'email' => Yii::t('app', 'E-Mail'),
            'email2' => Yii::t('app', 'Repite E-Mail'),
            'password' => Yii::t('app', 'Contraseña'),
            'password2' => Yii::t('app', 'Repite Contraseña'),
            'oldpass' => Yii::t('app', 'Contraseña antigua'),
            'newpass' => Yii::t('app', 'Nueva Contraseña'),
            'newpass2' => Yii::t('app', 'Repita Nueva Contraseña'),
            'nick' => Yii::t('app', 'Nick'),
            'nombre' => Yii::t('app', 'Nombre'),
            'apellidos' => Yii::t('app', 'Apellidos'),
            'fecha_nacimiento' => Yii::t('app', 'Fecha de nacimiento'),
            'fecha_registro' => Yii::t('app', 'Fecha y hora de registro del usuario.'),
            'confirmado' => Yii::t('app', 'Indicador de que el usuario a confirmado su registro.(0 no confirmado, 1 confirmado).'),
            'fecha_acceso' => Yii::t('app', 'Fecha y hora del ultimo acceso del usuario. Debería estar a null si no se accedió nunca.'),
            'num_accesos' => Yii::t('app', 'Contador de accesos fallidos del usuario. 0 si no ha tenido o se reinició por un acceso válido.'),
            'bloqueado' => Yii::t('app', 'Indicador de usuario bloqueado: 0 = no, 1 = si (bloqueado por accesos), 2 = si (bloqueado por administrador)'),
            'fecha_bloqueo' => Yii::t('app', 'Fecha y hora del bloqueo del usuario. Debería ser NULL si no esta bloqueada, o si ha sido desbloqueada.'),
            'notas_bloqueo' => Yii::t('app', 'Notas visibles sobre el motivo del bloqueo del usuario, o NULL si no hay. Se muestra por defecto según indique (bloqueado).'),
        ];
    }



    /**
     * {@inheritdoc}
     * @return UsuarioQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new UsuarioQuery(get_called_class());
    }//implementando la interfaz IdentityInterface...
    ///////////////////////////////////////////////////
    public function getAuthKey(){

        return $this->authKey;
    }

    public function getId(){

        return $this->id;
    }

    public function validateAuthKey($authKey){

        return $this->authKey;
    }

    public static function findIdentity($id){

        return self::findOne($id);
    }

    public static function findIdentityByAccessToken($token,$type = null){

        throw new yii\base\NotSupportedException();
    }
    ////////////////////////////////////////////////////


    //buscar por nombre de usuario
    public static function findByUsername($username){

        return self::findOne(['nick'=>$username]);

    }

    //validar password
    public function validatePassword($password){

        return $this->password === md5($password);

    }



}
