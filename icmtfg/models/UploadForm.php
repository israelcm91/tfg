<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\web\UploadedFile;

class UploadForm extends Model
{
    /**
     * @var UploadedFile
     */
    public $imageFile;

    public function rules()
    {
        return [
            [['imageFile'], 'file', 'skipOnEmpty' => true, 'extensions' => 'png, jpg'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'imageFile' => Yii::t('app', 'Imagen'),         
        ];
    }
    
    public function upload($ruta=null)
    {
        if ($this->validate()) {
            $this->imageFile->saveAs($ruta);
            return true;
        } else {
            return false;
        }
    }
}