<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "registros".
 *
 * @property int $id
 * @property string $fecha_registro Fecha y Hora del registro de acceso.
 * @property string $clase_log_id código de clase de log: E=Error, A=Aviso, S=Seguimiento, I=Información, D=Depuración, ...
 * @property string $modulo Modulo o Sección de la aplicación que ha generado el mensaje de registro.
 * @property string $texto Texto con el mensaje de registro.
 * @property string $ip Dirección IP desde donde accede el usuario (vale para IPv4 e IPv6.
 * @property string $browser Texto con información del navegador utilizado en el acceso.
 */
class Registro extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'registros';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['fecha_registro', 'clase_log_id'], 'required'],
            [['fecha_registro'], 'safe'],
            [['texto', 'browser'], 'string'],
            [['clase_log_id'], 'string', 'max' => 1],
            [['modulo'], 'string', 'max' => 50],
            [['ip'], 'string', 'max' => 40],
            [['id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'fecha_registro' => Yii::t('app', 'Fecha y Hora'),
            'clase_log_id' => Yii::t('app', 'Tipo'),
            'modulo' => Yii::t('app', 'Módulo'),
            'texto' => Yii::t('app', 'Log'),
            'ip' => Yii::t('app', 'IP'),
            'browser' => Yii::t('app', 'Navegador'),
        ];
    }

    protected static $tipos=[ 'E'=>'Error', 'A'=>'Aviso', 'I'=>'Informacion','S'=>'Seguimiento', 'D'=>'Depuracion'];

    public static function getListaTipos()
    {
        return self::$tipos;
    }

    public static function nombreTipo($id)
    {
        return isset(self::$tipos[$id]) ? self::$tipos[$id] : null;
    }

    public function getTipo()
    {

        return self::nombreTipo($this->clase_log_id);
    }

    public function Registrar($tipo,$texto,$modulo){

            if (array_key_exists($tipo, self::$tipos)){
             
                $log = new Registro();
                $log->clase_log_id = $tipo;
                $log->texto = $texto;

                $log->fecha_registro = date("Y-m-d H:i:s"); 
                $log->modulo = $modulo;
                $log->ip = Yii::$app->request->getUserIP();
                $log->browser = Yii::$app->request->getUserAgent();
                return $log->save();
            }
            return false;
    }


    /**
     * {@inheritdoc}
     * @return RegistroQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new RegistroQuery(get_called_class());
    }
}
