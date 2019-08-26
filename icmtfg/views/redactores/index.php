<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

use yii\widgets\ListView;
use yii\data\ActiveDataProvider;


?>
<div class="site-index">

	

<div class="perfil-index">

    <h1><?= Html::encode($this->title) ?></h1>

		<div class="col-md-8">

			<!--First row-->
			<div class="row">
					<div class="col-md-12">
						<div class="divider-new">
							<h1 class="h1-responsive"><span class="glyphicon glyphicon-user">&nbsp;</span>Hola, <?=$model->nombre." ".$model->apellidos ?></h1>
						</div>
						<hr/>
						<h3><span class="glyphicon glyphicon-asterisk">&nbsp;</span>
							Has publicado <?= ($nArticulos==1)? $nArticulos.' articulo':$nArticulos.' articulos' ?>.</h3>
						<h3><span class="glyphicon glyphicon-eye-open">&nbsp;</span>
							Tus artículos han generado <?= ($nVisitas==1)? $nVisitas.' visita':$nVisitas.' visitas' ?>.</h3>
						<h3><span class="glyphicon glyphicon-heart">&nbsp;</span>
							Tus artículos han recibido <?= ($nLikes==1)? $nLikes.' "Me Gusta"':$nLikes.' "Me Gustas"' ?>.</h3>
				
					</div>
				</div>
			</div>
		</div>
	</div>
</div>