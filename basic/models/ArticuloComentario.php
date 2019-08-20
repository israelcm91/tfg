<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "articulos_comentarios".
 *
 * @property int $id
 * @property int $articulo_id Artículo relacionado
 * @property string $texto Texto del comentario
 * @property int $num_denuncias Contador de denuncias del comentario, o 0 si no ha tenido.
 * @property string $fecha_denuncia1 Fecha y hora de la primera denuncia, debería estar a NULL si no hay denuncias contador a 0, o si el contador se reinicia).
 * @property int $bloqueado Indicador de comentario bloqueado (0=1, 1=si (bloqueado por denuncias), 2 = si (bloqueado por el administrador).
 * @property string $fecha_bloqueo Fecha y hora del bloqueo del comentario. Debería estar a null si no está bloqueado o si se desbloquea
 * @property string $notas_bloqueo Notas visibles sobre el motivo del bloqueo del comentario, o NULL si no hay.
 * @property int $crea_usuario_id Usuario que ha creado el comentario, o 0 si no existe o se hizo por un administrador de sistema.
 * @property string $crea_fecha Fecha y hora de creación del comentario, o null si no se conoce por algún motivo.
 * @property int $visible Visibilidad del comentario. (0 no visible, 1 visible)
 */
class ArticuloComentario extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'articulos_comentarios';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['articulo_id', 'texto'], 'required'],
            [['articulo_id', 'num_denuncias', 'bloqueado', 'crea_usuario_id', 'visible'], 'integer'],
            [['texto', 'notas_bloqueo'], 'string', 'max' => 240],
            [['fecha_denuncia1', 'fecha_bloqueo', 'crea_fecha'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'articulo_id' => Yii::t('app', 'Artículo relacionado'),
            'texto' => Yii::t('app', '¡Deja un comentario!'),
            'num_denuncias' => Yii::t('app', 'Contador de denuncias del comentario, o 0 si no ha tenido.'),
            'fecha_denuncia1' => Yii::t('app', 'Fecha y hora de la primera denuncia, debería estar a NULL si no hay denuncias contador a 0, o si el contador se reinicia).'),
            'bloqueado' => Yii::t('app', 'Indicador de comentario bloqueado (0=1, 1=si (bloqueado por denuncias), 2 = si (bloqueado por el administrador).'),
            'fecha_bloqueo' => Yii::t('app', 'Fecha y hora del bloqueo del comentario. Debería estar a null si no está bloqueado o si se desbloquea'),
            'notas_bloqueo' => Yii::t('app', 'Motivo del bloqueo'),
            'crea_usuario_id' => Yii::t('app', 'Usuario que ha creado el comentario, o 0 si no existe o se hizo por un administrador de sistema.'),
            'crea_fecha' => Yii::t('app', 'Fecha y hora de creación del comentario, o null si no se conoce por algún motivo.'),
            'visible' => Yii::t('app', 'Visibilidad del comentario. (0 no visible, 1 visible)'),
        ];
    }

    /**
     * {@inheritdoc}
     * @return ArticuloComentarioQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ArticuloComentarioQuery(get_called_class());
    }
}
