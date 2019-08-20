<?php

namespace bs\dbManager\controllers;

use Yii;
use yii\data\ArrayDataProvider;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\helpers\StringHelper;
use yii\web\Controller;
use bs\dbManager\models\Dump;
use bs\dbManager\models\Restore;
use Symfony\Component\Process\Process;

use ZipArchive;
use RecursiveIteratorIterator;
use RecursiveDirectoryIterator;


/**
 * Default controller.
 */
class DefaultController extends Controller
{

    /**
     * @return Module
     */
    public function getModule()
    {
        return $this->module;
    }

    /**
     * @return array
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'create' => ['post'],
                    'delete' => ['post'],
                    'delete-all' => ['post'],
                    'restore' => ['get', 'post'],
                    '*' => ['get'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actionIndex()
    {
        $dataArray = $this->prepareFileData();
        $dbList = $this->getModule()->dbList;
        $model = new Dump($dbList, $this->getModule()->customDumpOptions);
        $dataProvider = new ArrayDataProvider([
            'allModels' => $dataArray,
            'pagination' => [
                'pageSize' => 10,
            ],
        ]);
        $activePids = $this->checkActivePids();

        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'model' => $model,
            'dbList' => $dbList,
            'activePids' => $activePids,
        ]);
    }

    /**
     * @inheritdoc
     */
    public function actionCreate()
    {
        $model = new Dump($this->getModule()->dbList, $this->getModule()->customDumpOptions);
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $dbInfo = $this->getModule()->getDbInfo($model->db);
            $dumpOptions = $model->makeDumpOptions();
            $manager = $this->getModule()->createManager($dbInfo);
            $dumpPath = $manager->makePath($this->getModule()->path, $dbInfo, $dumpOptions);

                $nombre = explode(DIRECTORY_SEPARATOR, $dumpPath);
                $nombre = explode("/", end($nombre));
                $nombre = explode("_", end($nombre));
                $nombre=$nombre[4]. "_". $nombre[5];
                $nombre = explode(".", $nombre);




            $dumpCommand = $manager->makeDumpCommand($dumpPath, $dbInfo, $dumpOptions);
            Yii::trace(compact('dumpCommand', 'dumpPath', 'dumpOptions'), get_called_class());
            if ($model->runInBackground) {
                $this->runProcessAsync($dumpCommand);
            } else {
                $this->runProcess($dumpCommand);
            }
        } else {
            Yii::$app->session->setFlash('error', Yii::t('dbManager', 'Dump request invalid.') . '<br>' . Html::errorSummary($model));
        }

         $this->zipArticulos($nombre[0]);
         $this->zipBiblioteca($nombre[0]);

        return $this->redirect(['index']);
    }

    public function agregar_zip($dir, $zip) 
    {
        //verificamos si $dir es un directorio
        if (is_dir($dir)) {
        //abrimos el directorio y lo asignamos a $da
            if ($da = opendir($dir)) {
        //leemos del directorio hasta que termine
                while (($archivo = readdir($da)) !== false) {
        /*Si es un directorio imprimimos la ruta
         * y llamamos recursivamente esta función
         * para que verifique dentro del nuevo directorio
         * por mas directorios o archivos
         */
                    if (is_dir($dir . DIRECTORY_SEPARATOR . $archivo) && $archivo != "." && $archivo != "..") {
                        self::agregar_zip2($dir . DIRECTORY_SEPARATOR . $archivo , $zip, $archivo);

                        /*si encuentra un archivo imprimimos la ruta donde se encuentra
                        * y agregamos el archivo al zip junto con su ruta 
                        */
                    }elseif (is_file($dir . DIRECTORY_SEPARATOR . $archivo) && $archivo != "." && $archivo != "..") {

                        $zip->addFile($dir . DIRECTORY_SEPARATOR . $archivo, $archivo);
                    }
                }
                //cerramos el directorio abierto en el momento
                closedir($da);
            }
        }
    }

    public function agregar_zip2($dir, $zip, $ruta) 
    {
        //verificamos si $dir es un directorio
        if (is_dir($dir)) {

            
        //abrimos el directorio y lo asignamos a $da
            if ($da = opendir($dir)) {
        //leemos del directorio hasta que termine
                while (($archivo = readdir($da)) !== false) {
        /*Si es un directorio imprimimos la ruta
         * y llamamos recursivamente esta función
         * para que verifique dentro del nuevo directorio
         * por mas directorios o archivos
         */
                    if (is_dir($dir . DIRECTORY_SEPARATOR . $archivo) && $archivo != "." && $archivo != "..") { echo $archivo;

                        self::agregar_zip2($dir . DIRECTORY_SEPARATOR . $archivo , $zip, $ruta. DIRECTORY_SEPARATOR . $archivo);

                        /*si encuentra un archivo imprimimos la ruta donde se encuentra
                        * y agregamos el archivo al zip junto con su ruta 
                        */
                    }elseif (is_file($dir . DIRECTORY_SEPARATOR . $archivo) && $archivo != "." && $archivo != "..") {

                        $zip->addFile($dir . DIRECTORY_SEPARATOR . $archivo, $ruta . DIRECTORY_SEPARATOR. $archivo);
                    }
                }
                //cerramos el directorio abierto en el momento
                closedir($da);
            }
        }
    }

    public function zipArticulos($nombre)
    {

        //creamos una instancia de ZipArchive
        $zip = new ZipArchive();

        /*directorio a comprimir
        * la barra inclinada al final es importante
        * la ruta debe ser relativa no absoluta
        */
        $articulos = Yii::getAlias('@webroot').'\articulos';


        //ruta donde guardar los archivos zip, ya debe existir
        $rutaFinal = Yii::getAlias('@app').'\backups';

        if(!file_exists($rutaFinal)){
            mkdir($rutaFinal);
        }

        $archivoZip =$rutaFinal. DIRECTORY_SEPARATOR . "articulos_". $nombre . ".zip";


        if ($zip->open($archivoZip, ZIPARCHIVE::CREATE | ZIPARCHIVE::OVERWRITE) === true) { 
            $this->agregar_zip($articulos, $zip);
            //$this->agregar_zip($biblioteca, $zip);

            $zip->close();


        }
    }


    public function zipBiblioteca($nombre)
    {

        //creamos una instancia de ZipArchive
        $zip = new ZipArchive();

        /*directorio a comprimir
        * la barra inclinada al final es importante
        * la ruta debe ser relativa no absoluta
        */
        $biblioteca = Yii::getAlias('@webroot').'\biblioteca';


        //ruta donde guardar los archivos zip, ya debe existir
        $rutaFinal = Yii::getAlias('@app').'\backups';

        if(!file_exists($rutaFinal)){
            mkdir($rutaFinal);
        }

        $archivoZip =$rutaFinal. DIRECTORY_SEPARATOR . "biblioteca_". $nombre . ".zip";


        if ($zip->open($archivoZip, ZIPARCHIVE::CREATE | ZIPARCHIVE::OVERWRITE) === true) { 
            $this->agregar_zip($biblioteca, $zip);
            //$this->agregar_zip($biblioteca, $zip);

            $zip->close();


        }
    }
    /**
     * @inheritdoc
     */
    public function actionDownload($id)
    {
        $dumpPath = $this->getModule()->path . StringHelper::basename(ArrayHelper::getValue($this->getModule()->getFileList(), $id));

        $nombre = explode(DIRECTORY_SEPARATOR, $dumpPath);
        $nombre = explode("/", end($nombre));
        $archivo = end($nombre);
        $nombre = explode("_", end($nombre));
        $nombre=$nombre[4]. "_". $nombre[5];
        $nombre2 = explode(".", $nombre);
        $articulos = Yii::getAlias('@app') . "/backups/articulos_" .$nombre2[0] . ".zip";
        $biblioteca = Yii::getAlias('@app') . "/backups/biblioteca_" .$nombre2[0] . ".zip";


        $zip = new ZipArchive();

        /*directorio a comprimir
        * la barra inclinada al final es importante
        * la ruta debe ser relativa no absoluta
        */
        $dir = Yii::getAlias('@webroot').'\backups';

        //ruta donde guardar los archivos zip, ya debe existir
        $rutaFinal = Yii::getAlias('@app').'\tmp';

        if(!file_exists($rutaFinal)){
            mkdir($rutaFinal);
        }
        $archivoZip =$rutaFinal. DIRECTORY_SEPARATOR . "backup_". $nombre2[0] . ".zip";


        if ($zip->open($archivoZip, ZIPARCHIVE::CREATE | ZIPARCHIVE::OVERWRITE) === true) { 
            $zip->addFile($articulos, "articulos_" .$nombre2[0] . ".zip");
            $zip->addFile($biblioteca, "biblioteca_" .$nombre2[0] . ".zip");
            $zip->addFile($dumpPath, $archivo);
            $zip->close();
        }
       return Yii::$app->response->sendFile($archivoZip);
    }

    /**
     * @inheritdoc
     */
    public function actionRestore($id)
    {
        $dumpFile = $this->getModule()->path . StringHelper::basename(ArrayHelper::getValue($this->getModule()->getFileList(), $id));
        $nombre = explode(DIRECTORY_SEPARATOR, $dumpFile);
        $nombre = explode("/", end($nombre));
        $nombre = explode("_", end($nombre));
        $nombre=$nombre[4]. "_". $nombre[5];
        $nombre = explode(".", $nombre);
        $model = new Restore($this->getModule()->dbList, $this->getModule()->customRestoreOptions);
        if (Yii::$app->request->isPost) {
            if ($model->load(Yii::$app->request->post()) && $model->validate()) {
                $dbInfo = $this->getModule()->getDbInfo($model->db);
                $restoreOptions = $model->makeRestoreOptions();
                $manager = $this->getModule()->createManager($dbInfo);
                $restoreCommand = $manager->makeRestoreCommand($dumpFile, $dbInfo, $restoreOptions);
                Yii::trace(compact('restoreCommand', 'dumpFile', 'restoreOptions'), get_called_class());
                if ($model->runInBackground) {
                    $this->runProcessAsync($restoreCommand, true);
                } else {
                    self::restaurarArticulos($nombre[0]);
                    self::restaurarBiblioteca($nombre[0]);

                    $this->runProcess($restoreCommand, true);
                }

                return $this->redirect(['index']);
            }
        }
        return $this->render('restore', [
            'model' => $model,
            'file' => $dumpFile,
            'id' => $id,
        ]);
    }

        public function restaurarArticulos($nombre)
    {
        //exec('compact /u'. Yii::getAlias('@app').'\backups\imagenes.zip');
        $archivo = Yii::getAlias('@app').'\backups\articulos_'. $nombre.'.zip';
        $destino = Yii::getAlias('@webroot').'\articulos';
        $zip = new zipArchive;
        if($zip->open($archivo)===TRUE)
        {
            $zip->extractTo($destino);
            $zip->close();
            echo 'OK';
        }
        else
        {
            echo 'Fail';
        }
    }

        public function restaurarBiblioteca($nombre)
    {
        //exec('compact /u'. Yii::getAlias('@app').'\backups\imagenes.zip');
        $archivo = Yii::getAlias('@app').'\backups\biblioteca_'. $nombre.'.zip';
        $destino = Yii::getAlias('@webroot').'\biblioteca';
        $zip = new zipArchive;
        if($zip->open($archivo)===TRUE)
        {
            $zip->extractTo($destino);
            $zip->close();
            echo 'OK';
        }
        else
        {
            echo 'Fail';
        }
    }
    /**
     * @inheritdoc
     */
    public function actionStorage($id)
    {
        if (Yii::$app->has('backupStorage')) {
            $dumpname = StringHelper::basename(ArrayHelper::getValue($this->getModule()->getFileList(), $id));
            $dumpPath = $this->getModule()->path . $dumpname;
            $exists = Yii::$app->backupStorage->has($dumpname);
            if ($exists) {
                Yii::$app->backupStorage->delete($dumpname);
                Yii::$app->session->setFlash('success', Yii::t('dbManager', 'Dump deleted from storage.'));
            } else {
                $stream = fopen($dumpPath, 'r+');
                Yii::$app->backupStorage->writeStream($dumpname, $stream);
                Yii::$app->session->setFlash('success', Yii::t('dbManager', 'Dump uploaded to storage.'));
            }
        }

        return $this->redirect(['index']);
    }

    /**
     * @inheritdoc
     */
    public function actionDelete($id)
    {
        $dumpFile = $this->getModule()->path . StringHelper::basename(ArrayHelper::getValue($this->getModule()->getFileList(), $id));
        $nombre = explode(DIRECTORY_SEPARATOR, $dumpFile);
        $nombre = explode("/", end($nombre));
        $nombre = explode("_", end($nombre));
        $nombre=$nombre[4]. "_". $nombre[5];
        $nombre2 = explode(".", $nombre);
        $nombre = Yii::getAlias('@app') . "/backups/articulos_" .$nombre2[0] . ".zip";
        $biblioteca = Yii::getAlias('@app') . "/backups/biblioteca_" .$nombre2[0] . ".zip";

        if ((unlink($dumpFile)) && (unlink($nombre)) && (unlink($biblioteca)) ) {
            Yii::$app->session->setFlash('success', Yii::t('dbManager', 'Copia eliminada correctamente.'));
        } else {
            Yii::$app->session->setFlash('error', Yii::t('dbManager', 'Error al eliminar la copia.'));
        }

        return $this->redirect(['index']);
    }

    /**
     * @inheritdoc
     */
    public function actionDeleteAll()
    {
        if (!empty($this->getModule()->getFileList())) {
            $fail = [];
            foreach ($this->getModule()->getFileList() as $file) {
        $nombre = explode(DIRECTORY_SEPARATOR, $file);
        $nombre = explode("/", end($nombre));
        $nombre = explode("_", end($nombre));
        $nombre=$nombre[4]. "_". $nombre[5];
        $nombre2 = explode(".", $nombre);
        $nombre = Yii::getAlias('@app') . "/backups/articulos_" .$nombre2[0] . ".zip";
        $biblioteca = Yii::getAlias('@app') . "/backups/biblioteca_" .$nombre2[0] . ".zip";
        unlink($nombre);
        unlink($biblioteca);
                if (!unlink($file)) {
                    $fail[] = $file;
                }
            }
            if (empty($fail)) {
                Yii::$app->session->setFlash('success', Yii::t('dbManager', 'Copia eliminadas correctamente.'));
            } else {
                Yii::$app->session->setFlash('error', Yii::t('dbManager', 'Error al eliminar las copias.'));
            }
        }

        return $this->redirect(['index']);
    }

    /**
     * @param $command
     * @param bool $isRestore
     */
    protected function runProcess($command, $isRestore = false)
    {
        $process = new Process($command);
        $process->run();
        if ($process->isSuccessful()) {
            $msg = (!$isRestore) ? Yii::t('dbManager', 'Backup creado con éxito.') : Yii::t('dbManager', 'Backup restaurado con éxito.');
            Yii::$app->session->addFlash('success', $msg);
        } else {
            $msg = (!$isRestore) ? Yii::t('dbManager', 'Backup fallido.') : Yii::t('dbManager', 'Restauración fallida.');
            Yii::$app->session->addFlash('error', $msg . '<br>' . 'Command - ' . $command . '<br>' . $process->getOutput() . $process->getErrorOutput());
            Yii::error($msg . PHP_EOL . 'Command - ' . $command . PHP_EOL . $process->getOutput() . PHP_EOL . $process->getErrorOutput());
        }
    }

    /**
     * @param $command
     * @param bool $isRestore
     */
    protected function runProcessAsync($command, $isRestore = false)
    {
        $process = new Process($command);
        $process->start();
        $pid = $process->getPid();
        $activePids = Yii::$app->session->get('backupPids', []);
        if (!$process->isRunning()) {
            if ($process->isSuccessful()) {
                $msg = (!$isRestore) ? Yii::t('dbManager', 'Backup creado con éxito.') : Yii::t('dbManager', 'Backup restaurado con éxito.');
                Yii::$app->session->addFlash('success', $msg);
            } else {
                $msg = (!$isRestore) ? Yii::t('dbManager', 'Dump failed.') : Yii::t('dbManager', 'Restore failed.');
                Yii::$app->session->addFlash('error', $msg . '<br>' . 'Command - ' . $command . '<br>' . $process->getOutput() . $process->getErrorOutput());
                Yii::error($msg . PHP_EOL . 'Command - ' . $command . PHP_EOL . $process->getOutput() . PHP_EOL . $process->getErrorOutput());
            }
        } else {
            $activePids[$pid] = $command;
            Yii::$app->session->set('backupPids', $activePids);
            Yii::$app->session->addFlash('info', Yii::t('dbManager', 'Process running with pid={pid}', ['pid' => $pid]) . '<br>' . $command);
        }
    }

    /**
     * @return array
     */
    protected function checkActivePids()
    {
        $activePids = Yii::$app->session->get('backupPids', []);
        $newActivePids = [];
        if (!empty($activePids)) {
            foreach ($activePids as $pid => $cmd) {
                $process = new Process('ps -p ' . $pid);
                $process->run();
                if (!$process->isSuccessful()) {
                    Yii::$app->session->addFlash('success',
                        Yii::t('dbManager', 'Process complete!') . '<br> PID=' . $pid . ' ' . $cmd);
                } else {
                    $newActivePids[$pid] = $cmd;
                }
            }
        }
        Yii::$app->session->set('backupPids', $newActivePids);

        return $newActivePids;
    }

    /**
     * @return array
     */
    protected function prepareFileData()
    {
        $dataArray = [];
        foreach ($this->getModule()->getFileList() as $id => $file) {
            $dataArray[] = [
                'id' => $id,
                'type' => pathinfo($file, PATHINFO_EXTENSION),
                'name' => StringHelper::basename($file),
                'size' => Yii::$app->formatter->asSize(filesize($file)),
                'create_at' => Yii::$app->formatter->asDatetime(filectime($file)),
            ];
        }
        ArrayHelper::multisort($dataArray, ['create_at'], [SORT_DESC]);

        return $dataArray ?: [];
    }
}
