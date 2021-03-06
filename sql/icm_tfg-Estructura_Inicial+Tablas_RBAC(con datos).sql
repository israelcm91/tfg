-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-08-2019 a las 08:05:22
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `icm_tfg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(12) UNSIGNED NOT NULL,
  `titular` text CHARACTER SET utf8 NOT NULL COMMENT 'Titular del artículo.',
  `subtitulo` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Subtitulo del artículo',
  `cuerpo` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Desarrollo del artículo.',
  `categoria_id` int(12) UNSIGNED DEFAULT 0 COMMENT 'Categoria de clasificación del articulo CERO si no existe o aún no está indicada (como si fuera NULL).',
  `fecha_publicacion` datetime NOT NULL COMMENT 'Fecha en la cual se publica el artículo.',
  `imagen` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Imagen del artículo',
  `visible` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Indicador de artículo visible a los usuarios o invisible 0 = invisible 1 = visible',
  `crea_usuario_id` int(12) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Usuario que ha creado el artículo o 0 (NULL) si no existe o lo creo un administrador del sistema.\n',
  `visitas` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Campo para controlar el numero de visitas que recibe el artículo.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `titular`, `subtitulo`, `cuerpo`, `categoria_id`, `fecha_publicacion`, `imagen`, `visible`, `crea_usuario_id`, `visitas`) VALUES
(1, '10 jugadores que se han forrado jugando a Fortnite', 'No son streamers, no son \"famosos\", pero son ricos gracias a Fortnite', '<p style=\"text-align: justify;\"><span class=\"capital-letter\" style=\"background-color: initial;\">L</span>a Fortnite World Cup ya ha terminado. Hace unas semanas conocíamos el nombre del ganador del torneo mundial del battle royale, un joven jugador americano que ha ocupado las portadas de medio mundo por su victoria en el torneo, que le valió 3 millones de dólares.</p><p style=\"text-align: justify;\">Todo el mundo conoce a Kyle Giersdorf, alias Bugha, y también sabe lo de sus 3 millones. De hecho, <a href=\"https://www.marca.com/esports/fortnite/2019/08/12/5d51c8e7e2704e29488b4614.html\" target=\"_blank\">hace poco le hicieron un <em>swatting</em> en directo</a>. Pero, ¿quién más se ha \"forrado\" gracias al histórico evento de Fortnite? Pues todos estos.</p><p style=\"text-align: justify;\">1º Kyle \"Bugha\" Giersdorf - $3,024,650.00</p><p style=\"text-align: justify;\">Este jugador se hizo famoso en el pasado Fortnite World Cup al conseguir barrer a sus oponentes y obtener la primera posición en la categoría Solo.<a href=\"https://www.marca.com/esports/fortnite/2019/07/29/5d3e9b6cca4741c8698b468d.html\">Por su épica victoria</a>, este joven jugador se llevó 3 millones de dólares a casa.</p><p style=\"text-align: justify;\">Gracias a este torneo y otros más de menor envergadura, Bugha se encuentra actualmente en el décimo puesto de los jugadores de eSports con más ingresos en la historia. En Estados Unidos, es el segundo jugador con más ingresos por debajo del mítico jugador de Dota 2 Saahil \"UNiVeRsE\" Arora.</p><p style=\"text-align: justify;\">2º Harrison \"psalm\" Chang - $1,816,300.00</p><p style=\"text-align: justify;\">Este polivalente jugador fue profesional de Heroes of Storm, el MOBA de Blizzard, con el que ganó varios premios. Sin embargo, en 2018 decidió retirarse para dedicarse a tiempo completo a Fortnite. Un año más tarde,psalm consiguió la segunda posición en la final de la World Cup de Fortnite consiguiendo la cantidad de $1,800,000.</p><p style=\"text-align: justify;\">Muchos pudieron pensar que dar el salto entre juegos totalmente diferentes pudo ser una locura, pero lo cierto es que psalm ha conseguido llegar a lo más alto de ambos títulos en tan solo un año.</p><p style=\"text-align: justify;\">3º David \"Aquav2\" W - $1,568,496.55</p><p style=\"text-align: justify;\">Aquav2 consiguió el primer puesto en la categoría Duo en la Fortnite World Cup, lo que ha hecho posible que llegara a la tercera posición de este ranking. El premio por la victoria fue de $1,500,000.</p><p style=\"text-align: justify;\">Pero es que Aquav2 también se defiende bien en la categoría Solo, habiéndose llevado en esta categoría la cantidad de $50,000.00. Actualmente, el jugador austriaco tiene el primer puesto de los jugadores que más dinero han conseguido gracias a los eSports dentro de su país.</p><p style=\"text-align: justify;\">4º Emil \"Nyhrox\" Bergquist Pedersen - $1,508,876.19</p><p style=\"text-align: justify;\">Como no podía ser de otro modo, el compañero de Aquav2 ostenta el cuarto puesto dentro de esta clasificación. La cantidad de $1,500,000 que ganó gracias al premio por conseguir la primera posición dentro de la Fortnite World Cup corresponde prácticamente a todo lo conseguido por el jugador en 2019. Aun así, este jugador noruego se encuentra en la primera posición de ganancias entre los jugadores del país nórdico.</p><p style=\"text-align: justify;\">5º Shane \"EpikWhale\" Cotton - $1,265,350.00</p><p style=\"text-align: justify;\">Este joven jugador de Fortnite quedó en la tercera posición dentro de la Fortnite World Cup Finals 2019 en la categoría de Solo. Por ello, recibió de premio la cantidad de $1,200,000, suficiente para colocarle en el quinto puesto.</p><p style=\"text-align: justify;\">Además de lo anterior, EpikWhale consiguió el puesto número 12 en la categoría Duo del Fortnite World Cup, por lo que engrosó su premio en $50,000.00 más. El resto de la cantidad corresponde a otros torneos de Fortnite.</p><p style=\"text-align: justify;\">6º Dave \"Rojo\" Jong - $1,138,500.00</p><p style=\"text-align: justify;\">Otro jugador de Fortnite más. En esta ocasión Rojo consiguió el segundo puesto en la categoría Duo de la Fortnite World Cup. Este puesto le valió una recompensa de $1,125,000.</p><p style=\"text-align: justify;\">Además de ello, ha conseguido muy buenas posiciones en otros campeonatos de Fortnite, lo que le ha permitido escalar hasta el sexto puesto de los jugadores de eSports con mayores ingresos de lo que llevamos de 2019.</p><p style=\"text-align: justify;\">7º Jaden \"Wolfiez\" Ashman - $1,136,800.00</p><p style=\"text-align: justify;\">Wolfiez fue el compañero de Rojo en los dúos del Fortnite World Cup Finals, por lo que esta séptima posición sólo podía ser para él. Gracias a los $1,125,000.00 que consiguió como premio, el jugador inglés no sólo se encuentra entre los 10 jugadores con más ingresos de 2019, si no que se coloca como el jugador con más ganancias de toda la historia de los eSports en Reino Unido.</p><p style=\"text-align: justify;\">8º Nate \"Kreo\" Kou - $1,066,100.00</p><p style=\"text-align: justify;\">Kreo se cuela en el octavo puesto de esta lista gracias a los $1,050,000 que obtuvo de su cuarto puesto en la Fortnite World Cup jugando en la categoría Solo. Además de ello, este jugador de Hong Kong ha ganado varios torneos más, lo que le hace elevar sus ganancias todavía más.</p><p style=\"text-align: justify;\">9º Thiago \"kinG\" Lapp - $973,900.00</p><p style=\"text-align: justify;\">El jugador argentino kinG se mete en la novena posición pero no logra romper la barrera del millón de dólares. Gracias a su quinta posición del Fortnite World Cup consiguió $900,000.00. Además de ello, consiguió $50,000.00 en la categoría de Duos del mismo torneo de Fortnite.</p><p style=\"text-align: justify;\">10º. Davis \"Ceice\" McClellan - $967,150.00</p><p style=\"text-align: justify;\">Algo parecido a lo de kinG le ocurrió a este jugador de Estados Unidos. Ceice consiguió la tercera posición en Duos del torneo mundial de Fortnite consiguiendo la cantidad de $900,000. Por otro lado, su gran actuación en la categoría de Solo le reportó la cantidad de $50.000.</p>', 10, '2019-08-20 18:31:57', 'articulos/19c562c2f0eb0102b9113635bf89950e/15661966312461.jpg', 1, 2, 10),
(3, 'Dónde encontrar los botes de spray perdidos: localizaciones y mapa', 'Esta Temporada X nos trae algunas misiones divertidas', '<p><span class=\"capital-letter\" style=\"background-color: initial;\">C</span>on la misión \'Dispara y pinta\' de esta Temporada X de Fortnite, los usuarios deberán encontrar 5 botes de spray que están perdidos por el mapa. Tienes que tener en cuenta que cada uno de ellos tiene como referencia un graffiti cercano.</p><p>Si bien los botes pueden encontrarse en diferentes lugares del mapa, aquí te dejaremos algunas de las localizaciones. Cabe recordar que solo son necesarios cinco de ellos para poder completar la misión, así que elige bien.</p><figure><img src=\"https://e00-marca.uecdn.es/assets/multimedia/imagenes/2019/08/08/15652831281436.jpg\"></figure><p>Chiringuito Chatarra</p><p>Este bote se puede encontrar al norte de este lugar, cerca de un montón de chatarra. El graffiti está en la colina, fuera del depósito de basura, pero el bote lo podrás encontrar dentro.</p><p>Sureste de El Bloque</p><p>Tendrás que caer al sur de la ubicación de El Paragüas. En la pared verás el graffiti y el bote de spray lo encontrarás junto a los barriles de madera.</p><p>Suroeste de la Planta de Presión</p><p>Al final de la lava de la Planta de Presión encontrarás este bote. El graffiti está en la parte superior del túnel y, tras el pilar que hay dentro del mismo, encontrarás el spray.</p><p>Sudeste de Soto Solitario</p><p>Podrás encontrar el bote en la casa que se encuentra al sudeste de esta ubicación, más concretamente debajo de las escaleras de metal que dirigen al sótano.</p><p>Sudeste de Oasis Ostentoso</p><p>En este lugar se encuentra un pequeño depósito de chatarra ubicado al sudeste. Al exterior de este depósito, en el lado este, encontrarás el bote de spray al lado de un árbol.</p><p>Noreste de Villorio Vivaracho</p><p>Encontrarás el bote en el lado sur del edificio, cerca de la montaña. Está ubicado exactamente al lado de la tienda de campaña.</p><p>Túneles Tortuosos</p><p>Este bote se encuentra donde se genera un cofre bajo tierra. Sabrás dónde está gracias al graffiti que verás pintado en la pared.</p><p>Sur de Ribera Repipi</p><p>Encontrarás este bote al sur de esta ubicación, concretamente al sur del Barco Vikingo. El aerosol está colocado en el árbol que está justo enfrente de la cascada congelada, de hecho, está en el hielo por lo que tendrás que tener cuidado porque se deslizará.</p>', 10, '2019-08-20 18:36:30', 'articulos/fd3a03b1baee5244d95e7a1948fa774e/a.jpg', 1, 2, 17),
(4, 'Compite cara a cara con los profesionales de la Superliga Orange', 'Vuelve La Copa, el único evento que enfrenta al mundo profesional con el amateur', '<p style=\"text-align: justify;\">Tras el enorme éxito de la pasada edición de Gamergy, la más exitosa de su historia, LVP prepara la vuelta de otro de los eventos de referencia de los eSports en España: La Copa. </p><p style=\"text-align: justify;\">Con permiso de la Superliga Orange de Clash Royale, La Copa es la cita más importante para los fans del apartado competitivo del título de Supercell. Y lo es por varias razones, pero principalmente porque es el único evento que permite a cualquier aficionado llegar a competir contra los jugadores de la Superliga Orange. En persona, en directo, en tiempo real. </p><p style=\"text-align: justify;\">Los doce equipos que forman la Superliga Orange de Clash Royale se verán las caras con cuatro clubes compuestos por aspirantes semiprofesionales en la que es la segunda edición del exitoso torneo, que cuenta también con presencia en otros juegos competitivos como Counter-Strike: Global Offensive. </p><p style=\"text-align: justify;\">En total serán 16 los conjuntos que competirán en La Copa, y aunque los clubes pertenecientes a la Superliga Orange tienen el pase garantizado, el resto tendrá que pelear por hacerse con una plaza. ¿Cómo? A través de ArenaGG. </p><p style=\"text-align: justify;\">La famosa plataforma de competición online de LVP vuelve a encargarse de realizar la criba entre los miles de participantes que se sumarán a la pugna por un puesto en la final.</p><p style=\"text-align: center;\"><a class=\"ytp-share-panel-link ytp-no-contextmenu\" target=\"_blank\" aria-label=\"Compartir enlace: https://youtu.be/4DGfBw8wDdg\" href=\"https://youtu.be/4DGfBw8wDdg\"><iframe frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" width=\"610.54\" height=\"343\" type=\"text/html\" src=\"https://www.youtube.com/embed/4DGfBw8wDdg?autoplay=0&amp;fs=0&amp;iv_load_policy=3&amp;showinfo=0&amp;rel=0&amp;cc_load_policy=0&amp;start=0&amp;end=0&amp;origin=https://youtubeembedcode.com\"></iframe><br></a></p><p style=\"text-align: justify;\">Todos los aspirantes pueden apuntarse desde ayer mismo a la competición para jugar en los clasificatorios online, que se disputarán semanalmente desde el día 10 de agosto. De esta fase obtendremos los cuatro equipos de la categoría semiprofesional. Los mismos que pelearán cara a cara con los clubes de la Superliga Orange en la fase de grupos, que dará comienzo el 7 de septiembre. </p><p style=\"text-align: justify;\">De cada uno de los grupos saldrán dos equipos seleccionados para pasar a la siguiente fase, que se jugará en un Bo5. Es decir, al mejor de 5 partidas. Solo cuatro de los equipos restantes podrán acceder a la siguiente etapa del torneo: la fase final.</p><h3>Final presencial por todo lo alto.</h3><p style=\"text-align: justify;\">Esta fase final, que incluye semifinales y final, se jugará en Madrid Games Week, tal y como se hizo el año pasado. Allí, en la feria del videojuego, la electrónica y el ocio que organizan IFEMA y la Asociación Española de VIdeojuegos, es donde los semiprofesionales clasificados podrán vivir la emoción de la competición profesional en vivo y en directo y ante miles de espectadores. </p><p style=\"text-align: justify;\">La feria se prolongará desde el 3 hasta el 6 de octubre, día elegido para hospedar la fase final del torneo en el Orange Stadium, con capacidad para 2000 personas. Más de 420.000 espectadores únicos (y se espera que este año sean aún más) vieron levantar a MAD Lions La Copa de 2018. ¿Quién lo hará este año?<o:p></o:p></p>', 8, '2019-08-20 19:01:37', 'articulos/4d100ebd8db4171b72910cf2ceb85b99/sd2.jpg', 1, 2, 7),
(5, 'Superliga Orange de LoL: Origen setencia a G2 Heretics y volará a Tenerife', 'Crónica de la primera semifinal', '<p style=\"text-align: justify;\">Arranca una semana decisiva en la Superliga Orange de League of Legends con unas semifinales que decidirán a los dos contendientes para la gran final de liga en Tenerife. <a href=\"https://www.marca.com/esports/league-of-legends/2019/08/15/5d555affe2704e87418b45c1.html\">G2 Heretics llegaba desde cuartos</a> para enfrentarse a Origen BCN en la primera eliminatoria de estas semifinales con una declaración de intenciones basando su estrategia en la estabilidad de su plantilla. Ocho meses juntos con el mismo roster y un objetivo por delante: la gran final.\r\n</p>\r\n<p style=\"text-align: justify;\">G2 Heretics apostaba por un estilo de la vieja escuela con las <em>sololíneas</em> de Irelia y Akali que marcaban un early muy descafeinado aunque dominado por los herejes. Cumplida la media hora de juego, la partida estuvo en torno a un nashor muy disputado que finalmente fue para G2H. Amenazaron con terminar aquí el mapa, pero Kennen salvó a Origen con una triple providencial.\r\n</p>\r\n<blockquote style=\"text-align: justify;\">Pero faltaba <a href=\"https://twitter.com/SzygendaLoL?ref_src=twsrc%5Etfw\">@SzygendaLoL</a> en la pelea de Nashor. Llega el top laner de <a href=\"https://twitter.com/OrigenBCN?ref_src=twsrc%5Etfw\">@OrigenBCN</a> con la ulti y triple que se lleva con Kennen. <a href=\"https://twitter.com/hashtag/SuperligaOrangeLoLSemis?src=hash&amp;ref_src=twsrc%5Etfw\">#SuperligaOrangeLoLSemis</a><a href=\"https://t.co/yz5P5pK3LS\">pic.twitter.com/yz5P5pK3LS</a><br>? Superliga Orange League of Legends (@LVPesLoL) <a href=\"https://www.marca.com/esports/league-of-legends/2019/08/20/5d5b972d46163fb0218b459f.html?ref_src=twsrc%5Etfw\">August 19, 2019</a>\r\n</blockquote>\r\n<p style=\"text-align: justify;\">Un segundo barón sin complicaciones cayó del lado de G2H. Origen quiso contestar con su segundo dragón anciano, pero pagó una mala teamfight con cuatro bajas que pusieron fin a la partida. Un mal mapa de Origen en el que G2 se complicó innecesariamente.\r\n</p>\r\n<p style=\"text-align: justify;\">Los set ups elegidos en la segunda partida dejaron un early muy tranquilocon una primera sangre perfecta que llegó a los ocho minutos sobre Xico, pero Wardain contestó con una muy buena jugada para ganar la toplane. Varias cazadas fuera de posición permitieron que Origen se pusiera por delante en el marcador de oro. Cuando todo parecía decantado para los de Homi, G2H sorprendió con un barón rapidísimo en el minuto 22 que volvía a meterles en la partida.\r\n</p>\r\n<p style=\"text-align: justify;\">Minutos después llegó el momento polémico de la partida entre Zanzarah y Lamabear, por un posible bug con el Fajín de Mercurio que los árbitros descartaron tras ver la repetición.\r\n</p>\r\n<blockquote class=\"twitter-tweet\" data-lang=\"es\">Pausa. Tenemos a <a href=\"https://twitter.com/AraujoMgl?ref_src=twsrc%5Etfw\">@AraujoMgl</a>, el VAR de la <a href=\"https://twitter.com/hashtag/SuperligaOrangeLoLSemis?src=hash&amp;ref_src=twsrc%5Etfw\">#SuperligaOrangeLoLSemis</a> analizando la jugada. Ahora volvemos. <a href=\"https://t.co/I6SRixEtQi\">pic.twitter.com/I6SRixEtQi</a><br>— Superliga Orange League of Legends (@LVPesLoL) <a href=\"https://twitter.com/LVPesLoL/status/1163507771284893696?ref_src=twsrc%5Etfw\">19 de agosto de 2019</a>\r\n</blockquote>\r\n<p style=\"text-align: justify;\">Reanudada la partida, Origen supo jugar bien una teamfight para asegurar el barón. Dos dragones de fuego y uno de montaña ayudaron a empujar las líneas de un G2 Heretics que forzó demasiado la defensa y acabó pagando con una torre de nexo, el cuarto dragón y un tercer barón para los jugadores de Origen que sentenciaban la partida. A punto estuvo el push a la desesperada de Nixerino de reventar un encuentro que se convirtió en una carrera de bases, pero Tristana no pudo conseguir la que hubiera sido una victoria épica.\r\n</p>\r\n<p style=\"text-align: justify;\">La tercera partida arrancó lenta e insípida, casi aburrida, con tan solo un poco de acción en un dragón infernal abandonado por Origen. La primera sangre tardó 17 minutos en llegar en una nueva pelea por otro infernal que terminó en un ace con una actuación formidable por parte de Szygenda que además se quedaba el dragón.\r\n</p>\r\n<p style=\"text-align: justify;\">Una nueva pelea por infernal dejó a G2H en inferioridad numérica para pelear el barón. Desde ese momento, Heretics, que había elegido lado rojo, se quedaba fuera de la partida. Xico no pudo salvar esta vez a su equipo y cometió algunos errores que permitieron a un Szygenda muy crecido liderar una partida que no llegó a la media hora.\r\n</p>\r\n<p style=\"text-align: justify;\">Con el 2-2 en el marcador, arrancaba una cuarta partida protagonizada por las iniciaciones del Nunu de Zanzarah que favorecieron el early de Origen con dos jugadas idénticas en la bot lane que pusieron a Sivir 3 con tres kills. Un Szygenda decisivo en el apoyo a sus compañeros también fue capaz de mantener la toplane con rotundidad.\r\n</p>\r\n<p style=\"text-align: justify;\">Por su parte, un Xico muy agresivo intentaba echarse el equipo a la espalda que solo sacaba ventaja en dragones, pero cuando llegó el infernal al foso, Zanzarah volvió a sacar petróleo con su especialidad: robar objetivos. Aún así, Zanzarah empezó a conceder varias muertes innecesarias y una de ellas regaló el barón a Heretics en el minuto 25 y un tercer dragón de océano.\r\n</p>\r\n<p style=\"text-align: justify;\">Una nueva muerte de Zanzarah, la séptima, cedçia el segundo barón a G2H que soñaba con la quinta partida. Y lo conseguían, sin desmerecer su actuación, gracias a los errores de un Origen que no era capaz de aprovechar el escalado del Gangplank de Szygenda.\r\n</p>\r\n<h3 style=\"text-align: justify;\">Una quinta partida decisiva</h3>\r\n<p style=\"text-align: justify;\">No había estado clara la quinta partida, pero era la mejor noticia para los espectadores de la Superliga Orange quienes, tarareando Silver Scrapes, esperaban a ver el enfrentamiento definitivo entre dos equipos que nunca han levantado un trofeo de campeones. Origen empezaba muy concentrado, con algunas concesiones, pero en las que siempre sacaba algo a cambio. Sin embargo, Heretics estaba haciendo una partida redonda prestando atención a los objetivos y con Xico sacando una ventaja muy destacada en oro.\r\n</p>\r\n<p style=\"text-align: justify;\">Al cuarto de hora, Roison definía un diveo en la bot lane con el que pedía el protagonismo, y es que minutos después era capaz de marcarse una quadra kill que dejaba sin palabras a Ibai en plena narración de la teamfight.\r\n</p>\r\n<blockquote class=\"twitter-tweet\" data-lang=\"es\"><p lang=\"ca\" dir=\"ltr\">Vladimir: una teamfight y a dormir. <a href=\"https://twitter.com/hashtag/SuperligaOrangeLoLSemis?src=hash&amp;ref_src=twsrc%5Etfw\">#SuperligaOrangeLoLSemis</a> <a href=\"https://t.co/f7Py2vnAPT\">pic.twitter.com/f7Py2vnAPT</a></p>&mdash; Superliga Orange League of Legends (@LVPesLoL) <a href=\"https://twitter.com/LVPesLoL/status/1163548527261290496?ref_src=twsrc%5Etfw\">19 de agosto de 2019</a></blockquote>\r\n<script async src=\"https://platform.twitter.com/widgets.js\" charset=\"utf-8\"></script>\r\n<p style=\"text-align: justify;\">Con Vladimir carrileando la partida y dos infernales, Origen no cesaba su asedio al carril central de Heretics. Un barón completaba la invasión de la base con un Nashor demoledor que acababa con los tres inhibidores y sentenciaba una eliminatoria espectacular.\r\n</p>\r\n<p style=\"text-align: justify;\">Origen cerraba así su segundo pase consecutivo a una final con una plantilla que apostaba todo a la estabilidad del roster. Habrá que esperar al miércoles para conocer al rival de los de Homi, un equipo que saldrá de la semifinal entre Giants y Riders.\r\n</p>', 11, '2019-08-20 19:11:15', 'articulos/366f86dc24094bdd5c800135f1b581f1/ae.jpg', 1, 2, 5),
(6, 'Counter-Strike, el eSport con las mejores jugadoras profesionales', 'El shooter de Valve continúa ayudando a visibilizar el sector femenino', '<p>Aunque todavía hay un largo camino por recorrer, los eSports y videojuegos cada vez hacen más por lograr que las mujeres se sientan iguales que los hombres dentro de la comunidad. Uno de los juegos que más ha favorecido la integración es Counter Strike.</p><p>El título de Valve es el que más ha luchado por ello, celebrando un montón de competiciones solo para chicas. Es precisamente uno de estos torneos -el Electronic Sports World Cup de 2014en París- el que inspiró a Emmalee \"EMUHLEET\" Garrido para fundar uno de los mejores equipos femeninos de CS:GO del mundo. Ese mismo año crearía el Team Karma, conocido después como Team Dignitas Fe.</p><h3>De cero a cien</h3><p>\"Éramos el único equipo del evento que no tenía patrocinadores ni financiación a la espalda\", contaba Emmalee Garrido a The Esports Observer. Las chicas se pagaban los vuelos y solo contaban con un poco de dinero que ganaron por Twitch. Todo el mundo creía que no llegarían a ningún sitio hasta que en 2016 quedaron segundas en su primera competición. Dignitas vio la oportunidad de oro y las fichó en enero del año siguiente.</p><p>El entrenador del equipo de CS:GO, David \"Xp3\" Garrido, también ha estado ahí desde el principio. \"CS:GO fue el primer videojuego en ofrecer un campeonato femenino para que pudieran competir y experimentar lo mismo que los hombres. -cuenta el entrenador- Cualquiera es aceptado en la comunidad desde el primer momento, por eso creo que es el mejor juego para las mujeres, y el mejor en general\".</p><h3>Cada vez más importantes</h3><p>Los Esports continúan siendo una industria destinada a triunfar: se estima que este 2019 lleguen a mover 1 billón de dólares, de lo que, según Newzoo, aproximadamente un 80% será derechos de emisión, publicidad y patrocinios.</p><p>Las marcas tienen claro que esta es la gallina de los huevos de oro y, para sorpresa de muchos, se preocupan por el papel de las mujeres dentro de la industria. Carolyn \"artStar\" Noquez, miembra original del Team Karma y todavía jugadora en Dignitas, cuenta que una de las preguntas que les hacen las marcas es qué pueden hacer para ayudar a las mujeres dentro del gaming.</p><p>La marca Intel es la que más ha apoyado a las mujeres en este terreno. Su Intel Challenge de IEM Katowice (que las chicas llevan dos años ganando) está considerado como el torneo femenino más prestigioso de todos los Esports.</p><p><iframe width=\"100%\" height=\"371\" src=\"https://www.youtube.com/embed/s2fU3WuFkng?enablejsapi=1\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\" id=\"player0\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border-width: 0px; border-style: initial; outline: 0px; vertical-align: baseline; background: transparent;\"></iframe></p><p>Heather \"SapphiRe\" Garozzo sabe mucho del tema; además de ser una de las miembras fundadoras del equipo, ahora es la vice presidenta de marketing. \"Nuestros partners HyperX y Mountain Dew han hecho mucho para apoyar los Esports femeninos. Ambos han ayudado a crear contenido de calidad que sirve como inspiración para otras mujeres\".</p><p><iframe width=\"100%\" height=\"371\" src=\"https://www.youtube.com/embed/V6aGrYabphE?enablejsapi=1\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\" id=\"player1\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border-width: 0px; border-style: initial; outline: 0px; vertical-align: baseline; background: transparent;\"></iframe></p><p>De hecho Mountain Dew sacó en abril tres de los cinco vídeos que compondrán un documental sobre el equipo. Además, las chicas han hecho colaboraciones con varios snowboarders y skaters olímpicos creando contenido para los fans.</p><h3>Ampliando horizontes</h3><p>Cada vez es más frecuente ver cómo marcas que no son endémicas (propias de los Esports y la tecnología) ponen su granito de arena. Sephora, por ejemplo, entró en los Esports en 2018 como patrocinador regional en la <a href=\"https://www.girlgamer.gg/\">Girlgamer Esports Festival</a> de Portugal. Benefit hizo lo mismo en la edición de Sydney de este pasado Junio.</p><p>La escena competitiva femenina dentro de los Esports está empezando a expandirse fuera de CS:GO. La iniciativa Divina de BenQ\'s lleva creando competiciones femeninas de Esports desde 2011, y además de CS:GO han incluido PUBG y Starcraft II. \"Creo que poner el foco en las gamers femeninas ayuda a que las chicas jóvenes tengan un modelo a seguir que les mueva a jugar. -comenta Garozzo- En otros juegos no ves a mujeres compitiendo en grandes escenarios. Creo que, cuando eres joven, no te sientes inspirada a no ser que veas a una persona que te sirva como ejemplo\".</p>', 12, '2019-08-20 19:13:39', 'articulos/25783d00f65be2e0eb3348cfdb45626c/fsd.jpg', 1, 2, 5),
(7, 'Messi y Cristiano Ronaldo cuelgan las botas: FIFA 20 los convierte en entrenadores', 'Se han filtrado imágenes de la beta del juego que saldrá a la venta el 27 de septiembre', '<p><span class=\"capital-letter\" style=\"background-color: initial;\">L</span>as noticias del modo Carrera de FIFA 20 están llegando rápidamente, especialmente con el comienzo de la Beta del juego. A pesar de que a los jugadores que tuvieron la suerte de poder probarla se les hizo firmar un acuerdo de confidencialidad, se han filtrado algunas capturas de pantalla.\r\n</p>\r\n<p>A través de las redes sociales Twitter y Reddit se han compartido algunas capturas de pantalla de menús, aperturas de paquetes y entrenadores del Modo Carrera. Entre ellas destacan unas en las que podemos ver a varias estrellas del fútbol mundial actuando como entrenadores.\r\n</p>\r\n<p>De este modo hemos podido comprobar cómo lucirían Cristiano Ronaldo y Lionel Messi como coaches de equipos como el Newcastle United o la Sampdoria.\r\n</p>\r\n<blockquote class=\"twitter-tweet\" data-lang=\"es\"><p lang=\"en\" dir=\"ltr\">I don&#39;t think Messi is talking being a manager too seriously. <a href=\"https://twitter.com/hashtag/FIFA20?src=hash&amp;ref_src=twsrc%5Etfw\">#FIFA20</a> <a href=\"https://twitter.com/hashtag/fifa20careermode?src=hash&amp;ref_src=twsrc%5Etfw\">#fifa20careermode</a> <a href=\"https://t.co/ltpypBPpnh\">pic.twitter.com/ltpypBPpnh</a></p>&mdash; Cieran (@cieranharper) <a href=\"https://twitter.com/cieranharper/status/1160077731373207553?ref_src=twsrc%5Etfw\">10 de agosto de 2019</a></blockquote>\r\n<script async src=\"https://platform.twitter.com/widgets.js\" charset=\"utf-8\"></script>\r\n\r\n<p>También han compartido imágenes de otros jugadores después de haber colgado las botas para convertirse en entrenadores como Wayne Rooney, Gigi Buffon, Phil Jones o Aaron Ramsey.\r\n</p><twitter-widget>\r\n<blockquote>\r\n	<blockquote class=\"twitter-tweet\" data-lang=\"es\">Ronaldo as a manager. <a href=\"https://twitter.com/hashtag/fifa20?src=hash&amp;ref_src=twsrc%5Etfw\">#fifa20</a> <a href=\"https://twitter.com/hashtag/fifa20careermode?src=hash&amp;ref_src=twsrc%5Etfw\">#fifa20careermode</a> <a href=\"https://t.co/pJtBd5uzoh\">pic.twitter.com/pJtBd5uzoh</a><br>— Cieran (@cieranharper) <a href=\"https://twitter.com/cieranharper/status/1159944787258171392?ref_src=twsrc%5Etfw\">9 de agosto de 2019</a>\r\n	</blockquote>\r\n</blockquote><a class=\"CallToAction\" title=\"Ver la conversación en Twitter\" href=\"https://twitter.com/cieranharper/status/1159944787258171392\" data-scribe=\"section:cta component:news\"></a></twitter-widget>\r\n<p>FIFA 20 saldrá a la venta el próximo 27 de septiembre para PlayStation 4, Xbox One y PC. Contará con Edan Hazard en la portada principal y tendrá <a href=\"https://www.marca.com/esports/fifa/2019/08/07/5d4b10d7ca4741852d8b4604.html\" target=\"_blank\">grandes novedades en el Modo Carrera</a>, así como el modo VOLTA, muy parecido al antiguo FIFA Street.\r\n</p>', 9, '2019-08-20 19:16:14', 'articulos/4e88b832b1d9736409d2ed73780c5636/cr.png', 1, 2, 10),
(8, 'El competitivo de Call of Duty cambiará radicalmente en 2020', 'Franquicias, ciudades y precios desorbitados', '<p>Activision Blizzard Esports anunció por fin sus nuevos planes para la próxima temporada de Call of Duty. La compañía está apostando fuerte por el modelo de las ciudades, por lo que va a duplicarlo tomando como referencia la exitosa Overwatch League.\r\n</p>\r\n<p>Esto significa que a partir de 2020, los equipos de esta liga tendrán el nombre de ciudades y no de equipos de eSports. De hecho, en el anuncio ya nombró a siete equipos que participarán seguro en la próxima liga. Estos serán Atlanta, Dallas, Los Angeles, Minnesota, New York, Paris y Toronto. Sin embargo, desde SportsBusiness Journal, comentan que Activision Blizzard espera llevar por lo menos 12 equipos a la liga.\r\n</p>\r\n<p>Debido a este cambio, los fans tendrán que esperar hasta 2020 para poder empezar a disfrutar de la temporada, ya que Activision quiere dar a los equipos tiempo para organizarse y hacer crecer su base de fans dentro de las ciudades que representan respectivamente cada uno.\r\n</p>\r\n<p>La nueva comisionada de Call of Duty Esports, Johanna Faries, dijo en un comunicado:\r\n</p>\r\n<p>\"Estamos encantados de el futuro de Call of Duty traiga más eventos competitivos a los fans en ciudades de todo el mundo. Con siete equipos ya inscritos, anticipamos una sólida lista de eventos en todos los mercados\".\r\n</p>\r\n<h3>25 millones de dólares por plaza</h3>\r\n<p>La cantidad que Activision está pidiendo a los equipos para unirse a la liga es de 25 millones de dólares, una enorme suma que ya adelantó hace un tiempo Jacob Wolf, famoso periodista de ESPN, y que <a href=\"https://www.marca.com/esports/call-of-duty/2019/04/17/5cb6d822ca4741273d8b457f.html\">os contamos aquí.</a>\r\n</p>\r\n<blockquote class=\"twitter-tweet\" data-lang=\"es\"><p lang=\"en\" dir=\"ltr\"><a href=\"https://twitter.com/search?q=%24ATVI&amp;src=ctag&amp;ref_src=twsrc%5Etfw\">$ATVI</a> have begun the sales process for <a href=\"https://twitter.com/CODWorldLeague?ref_src=twsrc%5Etfw\">@CODWorldLeague</a> franchise slots, priced at $25 million, sources told ESPN. <a href=\"https://t.co/7Z8uJYaONY\">https://t.co/7Z8uJYaONY</a></p>&mdash; Jacob Wolf (@JacobWolf) <a href=\"https://twitter.com/JacobWolf/status/1105900450400870401?ref_src=twsrc%5Etfw\">13 de marzo de 2019</a></blockquote>\r\n<script async src=\"https://platform.twitter.com/widgets.js\" charset=\"utf-8\"></script>\r\n\r\n<p>Los 25 millones han levantado un gran debate en las redes, ya que parece exagerada teniendo en cuenta el número de visitas que tiene la liga actualmente. Sin embargo, ya hay muchos equipos que han pagado esa cantidad para tener su plaza dentro de la Liga Call of Duty.\r\n</p>\r\n<h3>Evil Geniuses abandona el barco</h3>\r\n<p>Por otro lado, el equipo de eSports Evil Geniuses anunció su salida de Call of Duty después de cinco años dentro del competitivo del juego. El equipo no quería formar parte en la franquicia de Activision Blizzard, por lo que separarán sus caminos con la llegada de la nueva liga. Una de las posibles razones del abandono (no confirmada), podría ser la exigencia por parte de Activision de que los equipos compitan bajo el nombre de ciudades y no de equipos.\r\n</p>\r\n<p>A pesar de todo, la expectativa por la nueva liga de Call of Duty es palpabledentro de la industria de los eSports. Activision Blizzard está construyendo un imperio de eventos y competiciones a golpe de talonario que cada vez resulta más impresionante.\r\n</p>\r\n<p>Esperemos que consiga la suficiente base de seguidores para obtener unos cimientos sólidos que sostengan la gran inversión que están realizando los equipos para formar parte de esta liga.\r\n</p>', 1, '2019-08-20 19:21:58', 'articulos/9ff3a482bc6090af7b8e811b29abd1a8/15657655184646.jpg', 1, 2, 3),
(10, 'Sony presenta cuatro nuevos diseños del DualShock 4 de PlayStation 4', 'Electric Purple, Red Camouflage, Titanium Blue y Rose Gold', '<p style=\"text-align: justify;\">Sony ha anunciado el lanzamiento de cuatro nuevos colores para su mando DualShock 4 el próximo mes de septiembre: Electric Purple, Red Camouflage, Titanium Blue y Rose Gold (este último estará disponible a partir de noviembre). Con este anuncio ya son más de 25 diseños disponibles para los controladores de la PlayStation 4.</p><p style=\"text-align: justify;\">Los cuatro controladores presentan un esquema de color con tonos sutiles. El modelo Electric Purple en particular, cuenta además con un nuevo sistema de colores en los clásicos botones. Por lo que en lugar de encontrarse en rojo, azul, rosa y verde, los símbolos del triángulo, el cuadrado, el círculo y la X serán blancos.</p><p style=\"text-align: justify;\">El precio de estos nuevos diseños del DualShock 4 será de 64,99 dólares, es decir, 5 dólares más caros que el mando estándar, la cual cuesta 59,99 dólares.</p><p style=\"text-align: justify;\">Además, la versión Rose Gold contará además con un juego de auriculares inalámbricos para la PlayStation 4 a juego con el diseño del controlador por un precio de 99,99 dólares.<br></p>', 13, '2019-08-20 19:31:16', 'articulos/fdf776468360e07289ac025b333a3b17/15658965979253.png', 1, 2, 3),
(11, 'Stats Royale, la herramienta definitiva para triunfar en Clash Royale', 'Al día con el meta, las estrategias más usadas y los mazos top', '<p style=\"text-align: justify;\">Stats Royale es una herramienta indispensable para cualquier jugador de Clash Royale que desee mejorar y que tenga un poco de curiosidad. Tiene una gran cantidad de funciones que nos ayudarán a superarnos como jugador y como constructor de mazos, y es precisamente ahí donde tenemos la característica más importante. Stats Royale nos muestra los mazos con mayor <em>win-rate</em> (ratio de victorias) del momento, lo que automáticamente nos da una idea de qué triunfa en el <em>meta</em> que se juega actualmente.</p><h3 style=\"text-align: justify;\">Los mazos \'top\'</h3><p style=\"text-align: justify;\">Conocer los mejores mazos de cada momento nos ayudará de varias maneras. En primer lugar a aquellos jugadores que quieran llegar a lo más alto y deseen jugar con las barajas más potentes, pues tendrán un acceso inmediato a la construcción de las mismas, pero también servirá a aquellos jugadores que no acaban de decidir entre sus 2 o 3 mazos \"estrella\". Con Stats Royale podrán por fin compararlos en tiempo real, sin olvidarnos de esos jugadores que construyen sus propios mazos y que no comprenden por qué su baraja de ciclo de Montapuercos con Gólem no acaba de funcionar como ellos querrían.</p><h3 style=\"text-align: justify;\">Guías para todo</h3><p style=\"text-align: justify;\">Otra de las magníficas caraterísticas de esta página son las guías. En muchos casos no nos servirá de nada tener un gran mazo en nuestras manos si no sabemos cómo utilizarlo, sería como estar a los mandos de un Ferrari y no saber conducir. Pues bien, aquí tendremos acceso a guías con enlaces a vídeos explicativos que nos ayudarán a controlar las barajas de la mejor manera posible.</p><p style=\"text-align: justify;\">Por si fuera poca ayuda, conocer los mazos dominantes del meta es importante si lo que buscamos es confeccionar las barajas <em>counter</em>, es decir, aquellas que puedan contrarrestar fácilmente a los mazos y estrategias dominantes. Así podríamos elegir una <em>logbait</em> para combatir a Gólem, o una <em>miner-control</em> si la baraja predominante es precisamente la antes mencionada logbait, por ejemplo.</p><h3 style=\"text-align: justify;\">Simulador de nivel</h3><p style=\"text-align: justify;\">Desgraciadamente, hay muchos mazos top que no podremos utilizar en el juego hasta que consigamos subir determinadas cartas de nivel, pero justo para esto existe la sección del constructor de mazos, esta herramienta analiza el nivel de nuestras cartas y nos construye mazos que ya haya jugado alguien con nuestro nivel de cartas o inferior, y por supuesto alguien que haya llegado muy alto en la clasificación. Eso nos descubrirá el potencial oculto que puede encerrar una baraja que podamos construir y que no hayamos descubierto todavía.</p><h3 style=\"text-align: justify;\"></h3><h3 class=\"list-header\" style=\"box-sizing: inherit; margin-bottom: 0px; padding-top: 10px; padding-bottom: 10px; border: 0px; outline: 0px; font-size: 20px; vertical-align: baseline; background-position: initial; line-height: 24px; font-family: robotoBold, Arial, helvetica; width: 572.438px; text-align: justify;\">Adivinando el cofre</h3><p style=\"text-align: justify;\">Y por último no podemos olvidar uno de los apartados más excitantes del juego: abrir cofres, y cuanto más gordos mejor. De todos es conocido que hay una rotación fija para los cofres que nos tocan en cada momento, y con Stats Royale podremos ver cuántos nos faltan para conseguir el deseado cofre megarelámpago, por ejemplo. Tan solo hará falta introducir nuestro nombre de usuario y voilá.<br></p><div><small><a href=\"\"></a></small></div>', 8, '2019-08-20 19:36:45', 'articulos/be2a5fb8610db89f40fe674515788a1f/15573908351751.png', 1, 2, 2),
(12, 'Así ha sido el split de verano de la Superliga Orange de LoL', '', '<p style=\"text-align: justify;\">Una temporada más, la Superliga Orange de League of Legends pone el broche final a una fase regular que ha terminado decidiéndose en el último partido liguero. Ya conocemos a los seis equipos que se enfrentarán en unos playoffs que mantendrán la emoción durante el mes de agosto hasta la final del 1 de septiembre en Tenerife.\r\n</p><p style=\"text-align: justify;\">En este vídeo, hacemos un repaso por lo mejor del split de veranopara que te pongas al día de cara a los playoffs de la Superliga Orange de League of Legends.\r\n</p><p style=\"text-align: justify;\">Seis equipos y solo un campeón de liga. La emoción está garantizada en la última oportunidad que tienen los clubes para luchar por el título de campeones de España. También está en juego la segunda plaza para representar al país en la European Masters, el torneo de Riot Games que reunirá a los mejores equipos de las ligas regionales.\r\n</p><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/jpF1m8mFr_M\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe>', 11, '2019-08-20 19:42:00', 'articulos/2a673490a26fa92b6364ea56e3c45ad9/15656194447364.jpg', 1, 2, 4),
(13, 'DreamHack Valencia celebrará un torneo CS:GO solo para mujeres', 'El famoso certamen dará visibilidad al talento femenino con DreamHack Showdown', '<p>El prestigioso torneo DreamHack, que en España lleva años celebrándose en la capital de la Comunidad Valenciana, presenta este año una novedad que seguro hará las delicias de las y los fans de Counter-Strike.<br>Se trata de DreamHack Showdown, un nuevo torneo competitivo de Counter-Strike: Global Offensive en el que participarán únicamente equipos femeninos y que se celebrará durante los días 5, 6 y 7 de julio dentro del marco de DreamHack Valencia.<br>Una iniciativa en la que participan de manera conjunta la propia DreamHack, Esports Management y ZOWIE, y que repartirá 100.000 dólares en premios.<br>Un proyecto inclusivo<br>El DreamHack Showdown es, según sus responsables, una muestra más del compromiso de DreamHack con la inclusión social, que, aseguran, \"siempre ha sido una parte importante de DreamHack\". Marcus Lindmark, CEO de la firma, lo defiende así:\r\n</p><p>Dreamhack Showdown supone un paso más para lograr inspirar y alentar a todas aquellas aspirantes a jugadoras profesionales de eSports alrededor del mundo\".<br>\r\n</p><blockquote class=\"summary-cite\">Dreamhack Showdown supone un paso más para lograr inspirar y alentar a todas aquellas aspirantes a jugadoras profesionales de eSports alrededor del mundo\"\r\n</blockquote><p style=\"text-align: justify;\">Por boca de su VP de Márketing Global Katherine Amoukhteh, Esports Management también ha querido amparar el proyecto añadiendo que su objetivo es el de \"apoyar los eSports desde los cimientos\", así como \"crear diversidad en los eSports mediante su colaboración con iniciativas con capacidad de cambiar la industria como el DreamHack Showdown\":\r\n</p><p style=\"text-align: justify;\">La DreamHack Showdown, dicen, \"es una oportunidad para demostrarlo\" de las siguientes maneras:\r\n</p><p style=\"text-align: justify;\"><br>\r\n</p><blockquote class=\"summary-cite\">Celebrando el papel actual de la mujer en la industria del videojuego, inspirando a las que quieren formar parte de ello y -a través de nuestra plataforma-, equiparlas con las herramientas necesarias para conseguir convertirse en las próximas campeonas\".</blockquote><h3 style=\"text-align: justify;\">¿Quién participa?</h3><p style=\"text-align: justify;\">Esports Management será quien se encargue de realizar la criba pertinente para que solo las mejores jugadoras de las regiones norteamericana y europea lleguen a Valencia. Será durante los días 8 y 9 de julio y se jugará de manera online.\r\n</p><p style=\"text-align: justify;\">En lo concerniente a las aspirantes del continente asiático, será ZOWIE quien tome el relevo para organizar una serie de eliminatorios que, estos sí, serán presenciales. ZOWIE DIVINA Women\'s Asian CS:GO Championship es el nombre oficial del evento, que tendrá lugar en Shanghai durante los días 20, 21 y 23 de junio.</p><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/QRUyqe5WN60\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe><p style=\"text-align: justify;\">OWIE, que lleva desde 2012 apoyando el gaming femenino con su iniciativa DIVINA, se muestra emocionada \"por poder trabajar con DreamHack para presentar el torneo de CS:GO para mujeres más profesional hasta el momento\", y están encantados de poder proveer a las mujeres con oportunidades para demostrar su talento y facilitarles el acceso a una carrera profesional\".</p><p style=\"text-align: justify;\">De este doble proceso de selección saldrán los 8 equipos que competirán en DreamHack Valencia.</p>', 12, '2019-08-20 19:46:32', 'articulos/4bea3f29c0fc16cb155cb11b1d4a5255/15585194929665.png', 1, 2, 19),
(14, 'EA desvela grandes cambios para el Modo Carrera de FIFA 20', 'Más hincapié en las ruedas de prensa y en la interacción con los jugadores', '<p style=\"text-align: justify;\"><span class=\"capital-letter\" style=\"background-color: initial;\">E</span>A ha desvelado las novedades del modo Carrera de FIFA 20 para PS4, Xbox One y PC. Este modo, que se ha mantenido prácticamente sin cambios durante dos años, modificará las conferencias de prensa haciéndolas más dinámicas y actualizará el potencial del jugador.\r\n</p>\r\n<p style=\"text-align: justify;\">\"Nuestra visión era dar una nueva vida a la experiencia del manager en el modo Carrera creando una variación de historias que siempre cambian y que emergerían a nuestros jugadores a través de conferencias de prensa y conversaciones de jugadores antes y después del partido\", explicó EA en la publicación del blog.\r\n</p>\r\n<p style=\"text-align: justify;\">Todo eso se traduce en entrevistas dinámicas con periodistas antes y después de los grandes partidos. Además, los profesionales de la comunicación harán diferentes preguntas \"dependiendo en gran medida del resultado, de los goles marcados, del oponente, el tiempo de la temporada o la etapa de la competición\". De hecho, podremos incluso acudir a programas tipo \'late nights\' para comentar los resultados de nuestros partidos.\r\n</p>\r\n<p style=\"text-align: justify;\"><br>\r\n</p>\r\n<blockquote class=\"twitter-tweet\" data-lang=\"es\"><p lang=\"es\" dir=\"ltr\" style=\"text-align: center;\">Conoce más sobre las novedades del Modo Carrera de <a href=\"https://twitter.com/hashtag/FIFA20?src=hash&amp;ref_src=twsrc%5Etfw\">#FIFA20</a> con nuestras notas a pie de campo ➡️ <a href=\"https://t.co/NtEoKYApoM\">https://t.co/NtEoKYApoM</a> <a href=\"https://t.co/y9Y0sr3GtV\">pic.twitter.com/y9Y0sr3GtV</a></p>&mdash; EA SPORTS FIFA ESP (@EASPORTSEsp) <a href=\"https://twitter.com/EASPORTSEsp/status/1159102141547438082?ref_src=twsrc%5Etfw\">7 de agosto de 2019</a></blockquote>\r\n<script async src=\"https://platform.twitter.com/widgets.js\" charset=\"utf-8\"></script>\r\n\r\n<p>Además, los managers tendrán que interactuar con los jugadores a través de una aplicación de mensajería. \"El manager tendrá que lidiar con una variedad de solicitudes de los jugadores, así como con jugadores felices o descontentos que tratan de expresas sus ideas. El manager tendrá que encontrar formas, ya sea a través de acciones directas o comunicando su postura para mitigar y resolver estas situaciones\", explican desde EA.\r\n</p>\r\n<p>FIFA 20 llegará para PlayStation 4, Xbox One y PC el próximo 27 de septiembre y contará entre otras novedades con el modo VOLTA, parecido al exitoso FIFA Street.\r\n</p>\r\n<blockquote class=\"twitter-tweet twitter-tweet-error\" data-lang=\"es\" data-twitter-extracted-i1566325099831773796=\"true\">\r\n</blockquote>', 9, '2019-08-20 20:19:54', 'articulos/814635dd9b2cd8ed80388fe3adda7157/15652005589593.jpg', 1, 2, 5),
(15, 'Primer gameplay del modo multijugador del nuevo CoD', 'Se trata de una retransmisión en directo de una partida Gunfight', '<p style=\"text-align: justify;\"><span class=\"capital-letter\" style=\"background-color: initial;\">E</span>l lanzamiento de su tráiler creó expectación en las redes sociales y se ha convertido en uno de los videojuegos más esperados de este año. Ahora, Activision nos nuestra un adelanto del modo multijugador de Call of Duty: Mordern Warfare a través de un gameplay de alrededor de 10 minutos.\r\n</p>\r\n<p style=\"text-align: justify;\">Aunque el modo en cuestión se dará a conocer oficialmente el 1 de agosto, la compañía ha querido contentar a los fans con un vídeo en el que se pueden ver 10 minutos de una partida en el modo Gunfight.\r\n</p>\r\n<blockquote class=\"twitter-tweet\" data-lang=\"es\"><p lang=\"en\" dir=\"ltr\">A new generation of Call of Duty multiplayer is coming.<br><br>Mark your calendar for the global reveal of the <a href=\"https://twitter.com/hashtag/ModernWarfare?src=hash&amp;ref_src=twsrc%5Etfw\">#ModernWarfare</a> Multiplayer Universe on August 1st. <a href=\"https://t.co/cT2di8pesC\">pic.twitter.com/cT2di8pesC</a></p>&mdash; Call of Duty (@CallofDuty) <a href=\"https://twitter.com/CallofDuty/status/1149365401962156033?ref_src=twsrc%5Etfw\">11 de julio de 2019</a></blockquote>\r\n<script async src=\"https://platform.twitter.com/widgets.js\" charset=\"utf-8\"></script>\r\n\r\n<p style=\"text-align: justify;\">Además, Activision ya informó de que el nuevo Call of Duty contará con una nueva generación de multijugador. Todavía se desconoce a qué se refieren exactamente pero muchos de los seguidores de la saga apuestan por un modo battle royale, tan de moda ahora con el auge de Fortnite, PUBG y Apex Legends.\r\n</p>\r\n<p style=\"text-align: justify;\">No obstante, el modo Gunfight que se ha revelado en este gameplay se trata de un 2V2. Además, las imágenes provienen de una retransmisión en directo, pero se puede apreciar el movimiento del jugador, las animaciones y la mecánica de las armas.\r\n</p>\r\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/DX9oJlBym_0\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\">\r\n</iframe>\r\n\r\n<p style=\"text-align: justify;\">El lanzamiento de este nuevo Modern Warfare está previsto para el próximo 25 de octubre. Contará con varias ediciones: la Standard Edition, la Operator Edition y la Operator Enhanced Edition.<br>\r\n</p>', 1, '2019-08-20 20:31:56', 'articulos/8f1ec7c977803a1718ee37a54813a705/15629612595832.jpg', 1, 2, 5);
INSERT INTO `articulos` (`id`, `titular`, `subtitulo`, `cuerpo`, `categoria_id`, `fecha_publicacion`, `imagen`, `visible`, `crea_usuario_id`, `visitas`) VALUES
(16, 'ROG presenta un ratón con joystick para el pulgar', 'También presenta monitores de hasta 43\" con 1.000 nits ', '<p style=\"text-align: justify;\">Asus se ha plantado en la Gamescom 2019 con todo un camión de novedades. La firma taiwanesa rara vez acude a un evento si no es para lanzar como mínimo media docena de productos, y en esta ocasión ha querido ampliar el catálogo de ROG con un buen puñado de primicias. Su conferencia dio para presentar hasta placas base y bloques de refrigeración, aunque sin duda toda la atención se ha centrado en los periféricos. <br><br>Comenzando por el más pequeño y al mismo tiempo el más singular de todos ellos, el ROG Chakram es un ratón para juegos que tiene el curioso detalle de integrar un joystick para el pulgar. Según Asus, la idea es evitar el uso de un mando separado además del teclado y el ratón en juegos que, como GTAV y numerosos MOBA, utilizan las teclas W y A o D para realizar desplazamientos diagonales en ocasiones incómodos o imprecisos.\r\n</p>\r\n<p style=\"text-align: justify;\">Desde Asus también se asegura que el control analógico puede ser interesante para simular inclinaciones en juegos de primera persona o manejar inventarios de forma más intuitiva. También se puede configurar en modo digital, en cuyo caso simula cuatro botones en los ejes X e Y. Asimismo, la \"seta\" es configurable en tamaño (la caja incluye dos mástiles distintos) y la cubierta del ratón se puede retirar para realizar modificaciones.<br><br>Por lo demás, el ROG Chakram integra un sensor de 1.600 DPI y muestreo a 1.000 Hz, ofreciendo conectividad con o sin cables. El precio y la fecha de lanzamiento aún se desconocen.<br>\r\n</p>\r\n<p><img src=\"https://images.elotrolado.net/news3/2/d/d/200819175121_0.jpg\" width=\"447\" height=\"250\" alt=\"\" style=\"width: 447px; height: 250px; display: block; margin: auto;\">\r\n</p>\r\n<p><img src=\"https://images.elotrolado.net/news3/2/6/a/200819175121_2.jpg\" width=\"447\" height=\"251\" alt=\"\" style=\"width: 447px; height: 251px; display: block; margin: auto;\">\r\n</p>\r\n<p style=\"text-align: justify;\"><b>Nuevos monitores, incluyendo un modelo 4K a 144 Hz de 43 pulgadas</b><br><br>En lo tocante a los monitores, ROG tenía dos novedades. La primera y más grande de ellas es el ROG Strix XG43UQ, una pantalla con panel VA de 43 pulgadas que se describe como un posible sustituto para los televisores clásicos. Como tal, viene con un mando a distancia para apagarlo o cambiar la señal de entrada y ofrece prestaciones como FreeSync 2 con HDR a 144 Hz, pudiendo plasmar picos de brillo hasta 1.000 nits.<br>\r\n</p>\r\n<p><img src=\"https://images.elotrolado.net/news3/9/d/8/200819175229_0.jpg\" alt=\"Imagen\" width=\"492\" height=\"277\" style=\"width: 492px; height: 277px; display: block; margin: auto;\">\r\n</p>\r\n<p style=\"text-align: justify;\">Un detalle interesante de este monitor es que es capaz de mostrar imagen a 4K con un refresco elevado sin utilizar <i>chroma subsampling</i>, que deteriora la calidad de imagen, ni dos cables DisplayPort. Para ello implementa la especificación VESA <a href=\"https://vesa.org/vesa-display-compression-codecs/\" class=\"postlink\">Display Stream Compression</a> (DSC) sobre DisplayPort 1.4, que mantiene la calidad de imagen intacta al realizar una operación de compresión y descompresión casi al vuelo. Oficialmente la latencia solo aumenta 0,1 ms.<br><br>Según ROG, DSC es una solución hasta que salgan al mercado los primeros monitores compatibles con <a href=\"https://www.elotrolado.net/noticia_anunciado-displayport-2-0-con-ancho-de-banda-suficiente-para-servir-a-los-monitores-de-hasta-16k_40694\" class=\"postlink\">DisplayPort 2.0</a>, que ya tendrá el ancho de banda necesario para mover 4K y 8K a velocidades mucho más elevadas que las actuales sin necesidad de compresión.<br>\r\n</p>\r\n<p><img src=\"https://images.elotrolado.net/news3/3/6/4/200819175312_0_thumb.jpg\" alt=\"Imagen\" style=\"display: block; margin: auto;\">\r\n</p>\r\n<p><img src=\"https://images.elotrolado.net/news3/8/5/8/200819175312_1_thumb.jpg\" alt=\"Imagen\" style=\"display: block; margin: auto;\">\r\n</p>\r\n<p style=\"text-align: justify;\">El ROG Strix XG43UQ saldrá a la venta en el último trimestre de 2019 a un precio de 1.499 euros. <br><br>Aproximadamente al mismo tiempo aparecerá el ROG XG27UQ, un modelo 4K a 144 Hz con panel IPS <i>quantum dot</i> también compatible con la tecnología DSC. En este caso el brillo máximo es de 400 nits (Display HDR400). Su precio será de 899 euros.<br><br><b>Y además, auriculares USB-C e inalámbricos para Switch</b><br>\r\n</p>\r\n<p><img src=\"https://images.elotrolado.net/news3/a/2/0/200819175343_0.jpg\" alt=\"Imagen\" width=\"460\" height=\"259\" style=\"width: 460px; height: 259px; display: block; margin: auto;\">\r\n</p>\r\n<p style=\"text-align: justify;\">Por último, Asus ha dado a conocer unos auriculares inalámbricos y USB compatibles tanto con teléfonos móviles como con Nintendo Switch. De diseño plegable, los Strix Go 2.4 se conectan sin cables a la consola híbrida usando el adaptador wifi suministrado, mientras que con smartphones utiliza un cable USB-C. Se pueden plegar para transportarlos fácilmente y su autonomía oficial es de 25 horas.<br><br>Asus no ha facilitado el precio ni la fecha de lanzamiento de estos nuevos auriculares.<br>\r\n</p>\r\n<p style=\"text-align: justify;\"><br>\r\n</p>\r\n<iframe frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\"width=\"610.54\" height=\"343\" type=\"text/html\" src=\"https://www.youtube.com/embed/VqPO3CE7C-0?autoplay=0&fs=0&iv_load_policy=3&showinfo=0&rel=0&cc_load_policy=0&start=0&end=0&origin=https://youtubeembedcode.com\"><div><small><a href=\"https://youtubeembedcode.com/en/\">https://youtubeembedcode.com/en/</a></small></div><div><small><a href=\"https://misshowtostartablog.com/best-wordpress-themes-for-your-food-blog/\">https://misshowtostartablog.com/best-wordpress-themes-for-your-food-blog/</a></small></div></iframe>', 13, '2019-08-20 20:43:04', 'articulos/8c51821530bb1913c86e96564efbe5c6/200819175159_0.jpg', 1, 2, 1),
(17, 'Estos son los mejores jugadores de basket según NBA 2K20', 'Los desarrolladores del juego tienen claro quiénes son los mejores del mundo', '<p style=\"text-align: justify;\">Quedan apenas un par de meses para que arranque la 74ª temporada de la NBA y los mejores equipos de baloncesto del mundo ya tienen sus plantillas prácticamente cerradas. Un momento ideal para que echemos un vistazo a la mejor saga actual de simulación deportiva basada en la liga norteamericana de baloncesto. La primera hornada de valoraciones ha salido la luz y ya conocemos a los deportistas mejor evaluados según sus estadísticas en NBA 2K20.</p><p style=\"text-align: justify;\">LeBron James, el alero de los Lakers, empata en la primera posición con el reciente fichaje de los Clippers Kawhi Leonard. El Rey y La Garra comparten el top 1 con un valoración de 97 puntos. Dos jugadores que comparten posición y que nos ofrecerán la versión más completa para cubrir el rol de alero.</p><p style=\"text-align: justify;\">Por debajo de ellos y con tan solo un punto menos tenemos un triple empate entre Giannis Antetokounmpo, Kevin Durant y James Harden, tres jugadores soberbios que tendrán su reflejo en el videojuego de la mejor manera posible. De cerca les sigue el triplista de los Golden State Warriors Stephen Curry, quien con sus 1,91 metros de altura es un pick seguro para mover la bola por la pista.</p><p style=\"text-align: justify;\">Anthony Davis, Paul George, Damian Lillard y Joel Embiid completan el top 10 de jugadores mejor valorados en NBA 2K20, todos ellos por encima de los 90 puntos de valoración. El primero de ellos será además portada de la edición estándar del juego, un lugar en el que ya ha debutado, aunque no tras su sonado fichaje por Los Ángeles Lakers. También superan los 90 puntos de valoración los jugadores Kyrie Irving, Nikola Jokic y Russell Westbrook, quien dejará de vestir la camiseta de Oklahoma City para ponerse la elástica de los Houston Rockets en el que es uno de los movimientos más llamativos del verano.</p><h3 style=\"text-align: justify;\">El mejor triplista del juego</h3><p style=\"text-align: justify;\">Las valoraciones mencionadas responden a la puntuación total de las estadísticas en general, pero si lo que buscas es a tu jugador ideal para un estilo de juego concreto, atento a las valoraciones parciales. El base de los Warriors Stephen Curry tiene 99 de valoración en lanzamiento de triples, la máxima puntuación en el juego, mientras que Anthony Davis es el pívot mejor valorado de NBA 2K20. Si lo que buscas es un rookie para sorprender, no pierdas de vista a Zion Williamson, Ja Morant o R. J. Barret.</p><figure><img src=\"https://e00-marca.uecdn.es/assets/multimedia/imagenes/2019/08/20/15663088283523.jpg\" style=\"display: block; margin: auto; width: 577px; height: 326px;\" alt=\"\" width=\"577\" height=\"326\"></figure><h3 style=\"text-align: justify;\">Las mejores parejas</h3><p style=\"text-align: justify;\">Y si lo que quieres es exprimir al máximo la sinergia entre dúos, 2K ha anunciado tus mejores opciones. LeBron James y Anthony Davis, Kawhi Leonard y Paul George, Kevin Durant y Kyrie Irving o James Harden y Russel Westbrook son las cuatro parejas mejor valoradas.</p><p style=\"text-align: justify;\">El juego no llegará al mercado hasta el próximo 6 de septiembre, pero de momento ya sabemos quiénes son los jugadores con mejores números en el título de 2K, un adelanto esencial para ir componiendo nuestras plantillas de ensueño.</p>', NULL, '2019-08-20 20:46:33', 'articulos/b948c9a2f3c01b459673e79c60998a8c/15663088921580.jpg', 1, 2, 10),
(18, 'El juego de moda que no es apto para epilépticos', 'Utilizado por los mejores jugadores de eSports para entrenar reflejos', '<p style=\"text-align: justify;\">Lo llaman \"la zona\". Es otra forma de hablar de una especie de trance donde todos tus músculos se mueven a un ritmo preciso y todos tus sentidos sirven al mismo fin: lograr la máxima puntuación.</p><p style=\"text-align: justify;\">Muchos de los mejores jugadores de eSports del planeta no entrenan con DOTA2, Counter Strike o League of Legends. Su banco de pesas se llama <a href=\"https://osu.ppy.sh/home\">osu!</a> y es un juego musical para trabajar los reflejos, para lograr que la danza sinestésica aumente la capacidad de reacción. Con 15 millones de usuarios registrados podemos decir que la voz ha corrido como la pólvora.</p><h3 style=\"text-align: justify;\">Qué es osu!</h3><p style=\"text-align: justify;\">Un rompemuñecas, un juego que exige precisión de reacción y reflejos extraterrestres a lo largo de cada canción. Este free to play fue creado en 2007 por Dean Herbert y se inspira en otros juegos de carácter rítmico como Beatmania o Taiko no Tatsujin. Pese a la antigüedad de la idea, el juego ha ido actualizándose y corrigiéndose hasta esta misma semana.</p><p style=\"text-align: justify;\">Existen cinco tipos de dificultad: Kantan (Fácil), Futsuu (Normal), Muzukashii (Difícil), Oni (Demonio) e Inner Oni / Ura Oni (Demonio oculto). Y cuatro tipos de onomatopeyas: Don, el círculo rojo que se activa pulsando las teclas X o C. Katsu, el círculo azul que se activa pulsando las teclas Z o V. Don!, el círculo rojo que exige pulsar a la vez X y C. Y Katsu!, que difiere del \"don\" normal en el tamaño del círculo azul, y se activa pulsando Z y V a la vez. Si solo pulsas uno obtendrás la mitad de puntos.</p><p style=\"text-align: justify;\">A esta mecánica básica debemos sumar el slide o deslizamiento que habrá que seguir en determinados momentos y a cierto ritmo, dependiendo de la velocidad de cada canción. Los jugadores expertos usan la combinación de un teclado mecánico -usualmente, de switch Red- más una tableta con lápiz táctil o un mouse láser. Con la mano izquierda tocan teclas a la velocidad de Rajmáninov y con la derecha trazan erráticos círculos que conectan puntos e intersecciones, con rigurosa precisión en tempo y forma.</p><p style=\"text-align: justify;\">Hasta la fecha, todos los \"<a href=\"https://www.youtube.com/watch?v=LrtUBxMO9bs\">mapas</a>\" son creados por la comunidad, como los skins y las modalidades. Nadie paga nada. Y a la modalidad básica le siguen osu!taiko, osu!catch y la que actualmente ha despertado una especie de fiebre, llamada <a href=\"https://en.wikipedia.org/wiki/Osu!\">osu!mania</a>, donde las teclas aparecen dispuestas como las teclas de un piano (a, s, d, f, j, k, l y barra espaciadora por defecto). También existe una versión para iOS, osu!Stream, muy popular para seguir entrenando lejos del PC.</p><h3 style=\"text-align: justify;\">Nuevos récords para un nuevo mundo</h3><p style=\"text-align: justify;\"><iframe width=\"100%\" height=\"371\" src=\"https://www.youtube.com/embed/jPPp6HQRHI8?enablejsapi=1\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\" id=\"player0\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border-width: 0px; border-style: initial; outline: 0px; vertical-align: baseline; background: transparent;\"></iframe></p><p style=\"text-align: justify;\">Bajo estas reglas, el puntaje va de 50 a 1000 puntos. Y creedme, nadie suele llegar a los 1000 puntos. Acaso a los 300-400. Durante años, la dichosa puntuación de los 1000pp era poco menos que un meme, un santo grial desconocido, el finisterre.</p><p style=\"text-align: justify;\">Aunque los récords están para batirlos. No en vano el nivel experto de Guitar Hero no fue suficiente y algunos jugadores han ido pidiendo cada vez canciones más largas y enrevesadas.</p><p style=\"text-align: justify;\">Aunque osu! no cuenta con presencia en los eSports, desde el verano de 2018 existen torneos nacionales e internacionales, con 4v4 y premios en metálico. Y el nivel dios en osu! se alcanzó hace unos días. Dos veces. Es decir, dos jugadores llegaron a este puntaje máximo y lo superaron. ¿Qué se hace ahora?</p><p style=\"text-align: justify;\"><iframe src=\"https://gfycat.com/ifr/SelfishMeanEland\" frameborder=\"0\" scrolling=\"no\" width=\"640\" height=\"404\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border-width: 0px; border-style: initial; outline: 0px; vertical-align: baseline; background: transparent;\"></iframe></p><p style=\"text-align: justify;\"><a href=\"https://gfycat.com/selfishmeaneland\">via Gfycat</a></p><p style=\"text-align: justify;\">Primero fue el estadounidense <a href=\"https://osu.ppy.sh/users/4787150\">Vaxei</a>, un quinceañero de Estados Unidos. 24 horas después, Caleb \"<a href=\"https://osu.ppy.sh/users/4650315\">idke</a>\" Yin, residente de EEUU de 18 años, arrasó su récord. Y <a href=\"https://www.reddit.com/r/osugame/comments/coqrwj/idke_actually_overshot_the_last_circle_in_his/\">no piensa parar</a>.</p><p style=\"text-align: justify;\">Para que tengamos un poco de contexto, alcanzar este nivel sobresaliente no impone jugar de forma perfecta durante un par de minutos. Debes acertar sin fallar ni una sola nota, con un porcentaje de precisión del 99%, durante canciones que van de los tres a los siete minutos. A más precisión, más puntos. Las clasificaciones van de SS para el 100% de aciertos, S para el 95%, A para aquellos con un 90% de acierto, B, C, D para los patosos de precisión 75% o inferior, y así. Los dos citados rara vez bajan del 94,15%.</p><p style=\"text-align: justify;\">Tal hazaña no es resultado del azar. Vaxei lleva desde los 10 años especializándose en juegos de ritmo y velocidad, y hasta usa mod como DoubleTime, que multiplica por dos la velocidad de las canciones y Hard Rock, otro mod que disminuye el tamaño de cada círculo y, por tanto, las posibilidades de acertar. Así afina la precisión con entrenamientos que ascienden hasta las 4 horas.</p><h3 style=\"text-align: justify;\">Más allá de los mil</h3><p style=\"text-align: justify;\"><iframe width=\"100%\" height=\"371\" src=\"https://www.youtube.com/embed/7AYkfX2KZfs?enablejsapi=1\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\" id=\"player1\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border-width: 0px; border-style: initial; outline: 0px; vertical-align: baseline; background: transparent;\"></iframe></p><p style=\"text-align: justify;\">El pique entre Vaxei e idke no tiene nada de personal. Ambos juegan con herramientas distintas y utilizan estilos distintos. Son el Cristiano Ronaldo y el Messi de osu!. Pero es evidente que ambos quieren mantener su podio y que la barrera de los 1000pp sea apenas una piedra en el camino.</p><p style=\"text-align: justify;\">La revelación final, la moraleja de todo esto, reside en los récords. ¿Por qué en diez años nadie había tocado techo y en apenas 24 horas dos jugadores han batido la meta? Un cambio atribuido, en cierta medida, a las nuevas formas de jugar -tablets con mejores resoluciones- de chavales que apenas pasan de los 14 años. Una generación Z que barre y reescribe las propias reglas de la comunidad. ¿Cuál será el nuevo objetivo, los 1500pp?</p>', NULL, '2019-08-20 20:49:29', 'articulos/e9c8e704634dca989375d805324b592c/15656180125087.jpg', 1, 2, 4);

-- --------------------------------------------------------


--
-- Estructura de tabla para la tabla `articulos_comentarios`
--

CREATE TABLE `articulos_comentarios` (
  `id` int(12) UNSIGNED NOT NULL,
  `articulo_id` int(12) UNSIGNED NOT NULL COMMENT 'Artículo relacionado',
  `texto` varchar(240) CHARACTER SET utf8 NOT NULL COMMENT 'Texto del comentario',
  `num_denuncias` int(9) NOT NULL DEFAULT 0 COMMENT 'Contador de denuncias del comentario, o 0 si no ha tenido.',
  `fecha_denuncia1` datetime DEFAULT NULL COMMENT 'Fecha y hora de la primera denuncia, debería estar a NULL si no hay denuncias contador a 0, o si el contador se reinicia).',
  `bloqueado` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Indicador de comentario bloqueado (0=1, 1=si (bloqueado por denuncias), 2 = si (bloqueado por el administrador).',
  `fecha_bloqueo` datetime DEFAULT NULL COMMENT 'Fecha y hora del bloqueo del comentario. Debería estar a null si no está bloqueado o si se desbloquea',
  `notas_bloqueo` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Notas visibles sobre el motivo del bloqueo del comentario, o NULL si no hay.',
  `crea_usuario_id` int(12) UNSIGNED DEFAULT 0 COMMENT 'Usuario que ha creado el comentario, o 0 si no existe o se hizo por un administrador de sistema.',
  `crea_fecha` datetime DEFAULT NULL COMMENT 'Fecha y hora de creación del comentario, o null si no se conoce por algún motivo.',
  `visible` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Visibilidad del comentario. (0 no visible, 1 visible)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci COMMENT='	';


--
-- Volcado de datos para la tabla `articulos_comentarios`
--

INSERT INTO `articulos_comentarios` (`id`, `articulo_id`, `texto`, `num_denuncias`, `fecha_denuncia1`, `bloqueado`, `fecha_bloqueo`, `notas_bloqueo`, `crea_usuario_id`, `crea_fecha`, `visible`) VALUES
(1, 3, '¡Muchas gracias!', 0, NULL, 0, NULL, NULL, 1, '2019-08-20 18:55:45', 1),
(2, 3, 'Me parece un artículo muy ineresante.', 0, NULL, 0, NULL, NULL, 1, '2019-08-20 18:55:57', 1),
(3, 1, 'Wow, y yo estudiando informática...', 0, NULL, 0, NULL, NULL, 1, '2019-08-20 18:56:14', 1),
(4, 3, 'Gracias por la aportación ;)', 0, NULL, 0, NULL, NULL, 4, '2019-08-20 21:05:04', 1),
(5, 17, 'Hola! Gran articulo.', 0, NULL, 0, NULL, NULL, 1, '2019-08-20 23:41:06', 1),
(6, 6, 'Me ha gustado este artículo!', 1, '2019-08-21 06:41:32', 0, NULL, NULL, 2, '2019-08-21 06:41:11', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos_likes`
--

CREATE TABLE `articulos_likes` (
  `id` int(12) UNSIGNED NOT NULL,
  `articulo_id` int(12) UNSIGNED NOT NULL,
  `usuario_id` int(12) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `articulos_likes`
--

INSERT INTO `articulos_likes` (`id`, `articulo_id`, `usuario_id`) VALUES
(1, 3, 1),
(2, 1, 1),
(5, 13, 2),
(6, 14, 2),
(7, 12, 2),
(8, 11, 2),
(9, 10, 2),
(10, 8, 2),
(11, 7, 2),
(12, 6, 2),
(13, 5, 2),
(14, 1, 2),
(15, 18, 4),
(16, 17, 4),
(17, 15, 4),
(18, 14, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `user_id` int(12) UNSIGNED NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('sysadmin', '1', 1566317356),
('sysadmin', '2', 1566317628),
('usuario', '4', 1566327842);

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;


--
-- Volcado de datos para la tabla `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, NULL, NULL, 1564980203, 1564980203),
('administrar', 2, 'Permisos de administración', NULL, NULL, 1564980201, 1564980201),
('adminsistema', 2, 'Permisos de administración del sistema', NULL, NULL, 1566181517, 1566181517),
('comentar', 2, 'Crear comentario', NULL, NULL, 1564980200, 1564980200),
('crearCategoria', 2, 'Crear categoria', NULL, NULL, 1565678888, 1565678888),
('eliminar', 2, 'Eliminar artículos', NULL, NULL, 1564980200, 1564980200),
('eliminarComentario', 2, 'Eliminar comentario', NULL, NULL, 1564980200, 1564980200),
('modificar', 2, 'Modificar articulos', NULL, NULL, 1564980200, 1564980200),
('modificarComentario', 2, 'Modificar comentario', NULL, NULL, 1564980200, 1564980200),
('publicar', 2, 'Publicar artículos', NULL, NULL, 1564980200, 1564980200),
('redactor', 1, NULL, NULL, NULL, 1564980202, 1564980202),
('sysadmin', 1, NULL, NULL, NULL, 1564980203, 1564980203),
('usuario', 1, NULL, NULL, NULL, 1564980201, 1564980201),
('votar', 2, 'Permitir votar el articulo', NULL, NULL, 1564980200, 1564980200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `child` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'administrar'),
('admin', 'redactor'),
('redactor', 'crearCategoria'),
('redactor', 'eliminar'),
('redactor', 'modificar'),
('redactor', 'publicar'),
('redactor', 'usuario'),
('sysadmin', 'admin'),
('sysadmin', 'adminsistema'),
('usuario', 'comentar'),
('usuario', 'eliminarComentario'),
('usuario', 'modificarComentario'),
('usuario', 'votar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(12) UNSIGNED NOT NULL,
  `nombre` varchar(25) CHARACTER SET utf8 NOT NULL COMMENT 'Nombre de la categoría/videojuego',
  `descripcion` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Texto adicional que describe la categoría o videojuego.',
  `imagen` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Logotipo de la categoría',
  `stream` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Enlace para ver el juego en streaming',
  `biblioteca` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Establece si la categoría puede ser visible en la biblioteca de juegos ( 0 = no visible, 1 = visible)\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `imagen`, `stream`, `biblioteca`) VALUES
(1, 'Call of Duty', '<p style=\"text-align: justify;\">Call of Duty es una serie de videojuegos de disparos en primera persona (FPS), de estilo bélico, creada por Ben Chichoski, desarrollada principal e inicialmente por Infinity Ward, y distribuida por Activision. La franquicia comenzó para computadora personal y posteriormente fue expandiéndose hacia videoconsolas de sexta y séptima generación, tanto de sobremesa como portátiles, llegando así, a lanzar varios juegos derivados de forma paulatina con la serie principal. La serie inicialmente se ambientaba en la Segunda Guerra Mundial, relatando personajes y combates acaecidos durante dicho conflicto bélico. Esto fue cambiando hasta la actualidad, donde los argumentos suceden en ambientes contemporáneos y ficticios, como se puede ver en Call of Duty: Black Ops, en la Guerra Fría, como se ve en Call of Duty 4: Modern Warfare, Call of Duty: Modern Warfare 2, y Call of Duty: Modern Warfare 3 en la Tercera Guerra Mundial, y en los futuros tecnológicos en Call of Duty: Black Ops 2, Call of Duty: Advanced Warfare, Call of Duty: Black Ops 3 y Call of Duty: Infinite Warfare. Los DLC son lanzados antes en las consolas Xbox desde el Call of Duty 4: Modern Warfare hasta el Call of Duty: Advanced Warfare, hasta Black Ops 3 donde cambio a PlayStation 4.</p><p style=\"text-align: justify;\">La saga ha gozado de un gran éxito comercial y crítico el cual ha ido aumentando desde su creación hasta la actualidad. Call of Duty ha logrado grandes ganancias en la industria de los videojuegos, vendiendo 55 millones de copias totales de sus juegos, recaudando más de 3 mil millones de dólares, creando además otros productos de la franquicia, incluyendo figuras de acción, juego de naipes y una mini-serie de comic books. De igual forma, la serie ha sido objeto de críticas y controversias desde su creación, hasta la actualidad.</p><p style=\"text-align: justify;\">El juego llamado Call of Duty posee distintos modos de juego, el principal es Zombies que se encuentra principalmente en World At War y los juegos Black Ops 1, 2, 3, 4, Advanced Warfare e Infinite Warfare. Estos juegos se puede jugar en PlayStation , Xbox y PC por lo que se puede jugar en modo online.</p>', 'biblioteca/c4ca4238a0b923820dcc509a6f75849b/450_1000.jpg', 'https://www.twitch.tv/callofduty', 1),
(8, 'Clash Royale', '<p style=\"text-align: justify;\">Clash Royale es un videojuego gratuito, con compras integradas de 2016. El juego combina elementos de los juegos de cartas coleccionables, defender a la torre y estrategia de acción en tiempo real. El juego fue producido a finales del 2015 para que finalmente su lanzamiento se realice el 4 de enero de 2016 en fase Beta en la plataforma iOS solo para unos pocos países, para luego dar paso a su lanzamiento mundial de forma oficial el 2 de marzo de 2016. Normalmente Supercell crea desafíos temporales o torneos globales cada cierto tiempo.<o:p></o:p><br></p>', 'biblioteca/c9f0f895fb98ab9159f51fd0297e236d/Clash_royale_front.jpg', 'https://www.twitch.tv/directory/game/Clash%20Royale', 1),
(9, 'FIFA', '<p style=\"text-align: justify;\">FIFA es una saga de videojuegos de fútbol publicados anualmente por Electronic Arts bajo el sello de EA Sports.</p><p style=\"text-align: justify;\">Cuando la saga comenzó a finales de 1993 se destacó por ser el primero en tener una licencia oficial de la FIFA. Las últimas ediciones de la saga contienen muchas licencias exclusivas y los equipos de ligas de todo el mundo, como la Premier League y la Football League inglesa, Serie A italiana, Bundesliga alemana, La Liga Primera División de España, Selecciones Nacionales, entre otras ligas más que han ido agregando a lo largo de estos últimos años, lo que permite el uso real de los estadios, cánticos del público, nombres reales de los jugadores y sus semejanzas en cómo juegan dentro del campo, etc.</p>', 'biblioteca/45c48cce2e2d7fbdea1afc51c7c6ad26/1549866770_395456_1549866856_noticia_normal.jpg', 'https://www.twitch.tv/directory/game/FIFA%2019', 1),
(10, 'Fortnite', '<p style=\"text-align: justify;\">Fortnite es un videojuego del año 2017 desarrollado por la empresa Epic Games, lanzado como diferentes paquetes de software que presentan diferentes modos de juego, pero que comparten el mismo motor general de juego y las mecánicas. Fue anunciado en los Spike Video Game Awards en 2011.</p><p style=\"text-align: justify;\">Los modos de juego publicados incluyen Fortnite Battle Royale, un juego gratuito donde hasta cien jugadores luchan en una isla, en espacios cada vez más pequeños debido a la tormenta, para ser la última persona en pie, y Fortnite: Salvar el mundo, un juego cooperativo de hasta cuatro jugadores que consiste en luchar contra carcasas, criaturas parecidas a zombis, utilizando objetos y fortificaciones.</p><p style=\"text-align: justify;\">Ambos modos de juego se lanzaron en 2017 como títulos de acceso anticipado. Salvar el Mundo está disponible solo para Windows, macOS, PlayStation 4 y Xbox One, mientras que Battle Royale ha sido publicado también para Nintendo Switch, dispositivos iOS y para Android.</p>', 'biblioteca/d3d9446802a44259755d38e6d163e820/450_1000 (1).jpg', 'https://www.twitch.tv/directory/game/Fortnite', 1),
(11, 'League of Legends', '<p style=\"text-align: justify;\">League of Legends (también conocido por sus siglas LoL) es un videojuego del género multijugador de arena de batalla en línea (MOBA) y deporte electrónico el cual fue desarrollado por Riot Games para Microsoft Windows y OS X. En un principio los servidores estaban alojados en la empresa GOA y fue vendida a la empresa china Tencent Holdings Limited.</p><p style=\"text-align: justify;\">El juego fue diseñado para el sistema operativo Microsoft Windows y lanzaron una beta para OS X dejando al poco tiempo el proyecto de lado.1 Esta beta ha sido mejorada por parte de usuarios del juego, haciendo posible jugar a una versión actualizada de League of Legends.</p><p style=\"text-align: justify;\">En octubre de 2012, contaba con 70 millones de jugadores registrados.2 Para marzo de 2013 se registró 5 millones de jugadores conectados al mismo tiempo en todo el mundo.3 Es un juego de alta competitividad siendo uno de los juegos más populares de los deportes electrónicos (e-sports).4</p><p style=\"text-align: justify;\">El juego está inspirado en el popular mapa personalizado del Warcraft III, Defense of the Ancients: Allstars diseñado por Steve «Guinsoo» Feak el cual a su vez está basado en el escenario de StarCraft «Aeon of Strife».5</p>', 'biblioteca/6512bd43d9caa6e02c990b0a82652dca/450_1000 (2).jpg', 'https://www.twitch.tv/directory/game/League%20of%20Legends', 1),
(12, 'CSGO', '<p style=\"text-align: justify;\">Counter-Strike: Global Offensive (CS:GO) es un videojuego de disparos en primera persona desarrollado por Valve Corporation en cooperación con Hidden Path Entertainment, y es el cuarto juego de la saga Counter-Strike, sin contar Counter-Strike: Online. Fue lanzado al mercado el 21 de agosto de 2012 para las plataformas de Microsoft Windows, Mac OS X y Xbox 360, mientras que sufrió un retraso en PlayStation 3. Posteriormente, la versión para Linux estuvo disponible al público el 22 de septiembre de 2014.</p><p style=\"text-align: justify;\">Global Offensive dispuso de una beta accesible únicamente mediante invitación en Steam, en su momento la revista PC Gamer anunció que el videojuego sería lanzado oficialmente el 21 de agosto de 2012 a un precio de € 10,9912, aunque ahora es gratuito. Gracias a esto, su base de jugadores aumentó de 20 a 45 millones, haciendo que retomara su lugar dentro de los juegos más jugados de los últimos años.</p><p style=\"text-align: justify;\">Según los desarrolladores, el juego cuenta con la misma mecánica que sus antecesores, aunque con algunos nuevos modos de juego, y no permite la evolución de los personajes gracias a horas de juego (como sucede en los juegos Call of Duty o Battlefield), solamente es necesario ser hábil. Está disponible para Windows, Mac, Linux, SteamOS, Xbox360 y PlayStation 3, Xbox One. La versión para PlayStation 3 soporta DualShock 3, PlayStation Move o teclado y ratón USB.</p><p style=\"text-align: justify;\">El 26 de agosto de 2011 fueron mostrados un tráiler y un vídeo en el que se demostraban algunas de las novedades.</p><p style=\"text-align: justify;\">El 30 de noviembre de 2011 se lanzó la beta cerrada para sus pruebas, con dos mapas disponibles Dust y Dust2 junto con ocho modelos de armas.3 Esta beta cerrada estaba solo disponible para 10.000 personas que obtuvieron una clave en convenciones de videojuegos donde Valve las repartió.</p><p style=\"text-align: justify;\">El 23 de agosto de 2012 se lanzó la noticia de Steam de que ya se podía adquirir el juego por medio de Internet para PC, PlayStation 3 y Xbox 360. El juego está centrado sobre todo en el modo competitivo. Los torneos más importantes de videojuegos de acción en primera persona como la ESWC y la Copenhaguen Games aceptaron a CS:GO como nuevo juego y retiraron a Counter-Strike: Source y, finalmente, también a Counter-Strike 1.6, después de participar por más de diez años en los torneos. Estos torneos recompensan a los ganadores con premios de más de 20000€.</p><p style=\"text-align: justify;\">En la presentación del juego en China en 2017 se anunció que el juego tendría el nuevo motor gráfico de Valve, Source 2. Que por ahora solo está implementado en Panorama (la interfaz gráfica actual del juego).</p>', 'biblioteca/c20ad4d76fe97759aa27a0c99bff6710/15537190644260.png', 'https://www.twitch.tv/directory/game/Counter-Strike%3A%20Global%20Offensive', 1),
(13, 'Hardware', '', NULL, '', 0);

-- --------------------------------------------------------


--
-- Estructura de tabla para la tabla `categorias_likes`
--

CREATE TABLE `categorias_likes` (
  `id` int(12) UNSIGNED NOT NULL,
  `categoria_id` int(12) UNSIGNED NOT NULL,
  `usuario_id` int(12) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias_likes`
--

INSERT INTO `categorias_likes` (`id`, `categoria_id`, `usuario_id`) VALUES
(1, 10, 1),
(2, 9, 1),
(3, 8, 1),
(4, 1, 1),
(5, 11, 1),
(6, 12, 1),
(7, 12, 2),
(8, 11, 2),
(9, 10, 2),
(10, 1, 2),
(11, 9, 4),
(12, 8, 2);

-- --------------------------------------------------------


--
-- Estructura de tabla para la tabla `categorias_notas`
--

CREATE TABLE `categorias_notas` (
  `id` int(12) UNSIGNED NOT NULL,
  `categoria_id` int(12) UNSIGNED NOT NULL,
  `usuario_id` int(12) UNSIGNED NOT NULL,
  `nota` int(12) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias_notas`
--

INSERT INTO `categorias_notas` (`id`, `categoria_id`, `usuario_id`, `nota`) VALUES
(1, 12, 1, 9),
(2, 8, 1, 9),
(3, 11, 2, 10),
(4, 9, 2, 1),
(5, 9, 1, 6),
(6, 9, 4, 3),
(7, 10, 1, 9);

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `configuraciones`
--

CREATE TABLE `configuraciones` (
  `variable` varchar(50) NOT NULL,
  `valor` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `configuraciones`
--

INSERT INTO `configuraciones` (`variable`, `valor`) VALUES
('autobloquear', '5'),
('max_accesos', '5'),
('tiempo_bloqueo', '30'),
('primer_arranque','1'),
('email','icmtfg@gmail.com')
;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `id` int(12) UNSIGNED NOT NULL,
  `fecha_registro` datetime NOT NULL COMMENT 'Fecha y Hora del registro de acceso.',
  `clase_log_id` char(1) NOT NULL COMMENT 'código de clase de log: E=Error, A=Aviso, S=Seguimiento, I=Información, D=Depuración, ...',
  `modulo` varchar(50) DEFAULT 'app' COMMENT 'Modulo o Sección de la aplicación que ha generado el mensaje de registro.',
  `texto` text DEFAULT NULL COMMENT 'Texto con el mensaje de registro.',
  `ip` varchar(40) DEFAULT NULL COMMENT 'Dirección IP desde donde accede el usuario (vale para IPv4 e IPv6.',
  `browser` text DEFAULT NULL COMMENT 'Texto con información del navegador utilizado en el acceso.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Volcado de datos para la tabla `registros`
--

INSERT INTO `registros` (`id`, `fecha_registro`, `clase_log_id`, `modulo`, `texto`, `ip`, `browser`) VALUES
(297, '2019-08-20 23:40:53', 'S', 'articulos', 'Usuario 1 visita articulo 17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(298, '2019-08-20 23:41:06', 'S', 'articulos-comentarios', 'Usuario 1 comenta articulo 17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(299, '2019-08-20 23:41:06', 'S', 'articulos', 'Usuario 1 visita articulo 17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(300, '2019-08-20 23:42:22', 'S', 'perfil', 'Usuario 1 ve sus juegos favoritos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(301, '2019-08-20 23:42:23', 'S', 'perfil', 'Usuario 1 ve sus articulos favoritos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(302, '2019-08-20 23:42:28', 'S', 'perfil', 'Usuario 1 ve sus juegos favoritos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(303, '2019-08-20 23:42:31', 'S', 'categorias', 'Usuario 1 visita juego 12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(304, '2019-08-20 23:42:31', 'S', 'categorias', 'Usuario 1 visita juego 12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(305, '2019-08-20 23:42:34', 'S', 'categorias', 'Usuario 1 visita juego 12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(306, '2019-08-20 23:42:37', 'S', 'categorias', 'Usuario 1 visita juego 12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(307, '2019-08-20 23:42:57', 'S', 'articulos', 'Usuario 1 visita articulo 18', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(308, '2019-08-21 06:13:41', 'I', 'usuarios', 'Usuario 1 se ha conectado', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(309, '2019-08-21 06:16:53', 'I', 'usuarios', 'Usuario 1 se ha desconectado', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(310, '2019-08-21 06:20:32', 'I', 'usuarios', 'Usuario 1 se ha conectado', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(311, '2019-08-21 06:20:56', 'I', 'usuarios', 'Usuario 1 se ha desconectado', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(312, '2019-08-21 06:21:10', 'I', 'usuarios', 'Usuario 1 se ha conectado', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(313, '2019-08-21 06:36:13', 'S', 'perfil', 'Usuario 2 ve sus articulos favoritos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(314, '2019-08-21 06:36:14', 'S', 'perfil', 'Usuario 2 ve sus juegos favoritos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(315, '2019-08-21 06:36:15', 'S', 'perfil', 'Usuario 2 ve sus articulos favoritos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(316, '2019-08-21 06:36:17', 'S', 'perfil', 'Usuario 2 ve sus articulos favoritos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(317, '2019-08-21 06:36:20', 'S', 'perfil', 'Usuario 2 ve sus juegos favoritos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(318, '2019-08-21 06:36:28', 'S', 'categorias', 'Usuario 2 le gusta juego 8', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(319, '2019-08-21 06:37:06', 'S', 'perfil', 'Usuario 2 ve sus articulos favoritos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(320, '2019-08-21 06:37:07', 'S', 'perfil', 'Usuario 2 ve sus juegos favoritos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(321, '2019-08-21 06:40:23', 'S', 'articulos', 'Usuario 2 visita articulo 6', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(322, '2019-08-21 06:41:11', 'S', 'articulos-comentarios', 'Usuario 2 comenta articulo 6', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(323, '2019-08-21 06:41:11', 'S', 'articulos', 'Usuario 2 visita articulo 6', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(324, '2019-08-21 06:41:32', 'A', 'articulos-comentarios', 'Usuario 2 reporta el comentario 6', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(325, '2019-08-21 06:41:32', 'S', 'articulos', 'Usuario 2 visita articulo 6', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(326, '2019-08-21 06:42:46', 'S', 'categorias', 'Usuario 2 visita juego 11', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(327, '2019-08-21 06:43:47', 'I', 'usuarios', 'Usuario 2 se ha desconectado', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(328, '2019-08-21 06:47:56', 'I', 'usuarios', 'Usuario 1 se ha conectado', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(329, '2019-08-21 07:23:42', 'S', 'categorias', 'Usuario 1 visita juego 12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(330, '2019-08-21 07:23:49', 'S', 'categorias', 'Usuario 1 visita juego 10', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(331, '2019-08-21 07:23:57', 'S', 'categorias', 'Usuario 1 visita juego 10', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(332, '2019-08-21 07:23:59', 'S', 'categorias', 'Usuario 1 visita juego 10', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),
(333, '2019-08-21 07:52:20', 'I', 'usuarios', 'Usuario 1 se ha desconectado', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(12) UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Correo electrónico y login del usuario.',
  `password` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT 'Contraseña de acceso del usuario-',
  `nick` varchar(25) CHARACTER SET utf8 NOT NULL COMMENT 'Nombre identificativo del usuario.',
  `nombre` varchar(50) CHARACTER SET utf8 NOT NULL,
  `apellidos` varchar(100) CHARACTER SET utf8 NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL COMMENT 'Fecha de nacimiento del usuario o NULL si no quiere informar de ello.',
  `fecha_registro` datetime DEFAULT NULL COMMENT 'Fecha y hora de registro del usuario.',
  `confirmado` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Indicador de que el usuario a confirmado su registro.(0 no confirmado, 1 confirmado).',
  `fecha_acceso` datetime DEFAULT NULL COMMENT 'Fecha y hora del ultimo acceso del usuario. Debería estar a null si no se accedió nunca.',
  `num_accesos` int(9) NOT NULL DEFAULT 0 COMMENT 'Contador de accesos fallidos del usuario. 0 si no ha tenido o se reinició por un acceso válido.',
  `bloqueado` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Indicador de usuario bloqueado: 0 = no, 1 = si (bloqueado por accesos), 2 = si (bloqueado por administrador)',
  `fecha_bloqueo` datetime DEFAULT NULL COMMENT 'Fecha y hora del bloqueo del usuario. Debería ser NULL si no esta bloqueada, o si ha sido desbloqueada.',
  `notas_bloqueo` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Notas visibles sobre el motivo del bloqueo del usuario, o NULL si no hay. Se muestra por defecto según indique (bloqueado).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `password`, `nick`, `nombre`, `apellidos`, `fecha_nacimiento`, `fecha_registro`, `confirmado`, `fecha_acceso`, `num_accesos`, `bloqueado`, `fecha_bloqueo`, `notas_bloqueo`) VALUES
(1, 'israelcm@usal.es', 'e10adc3949ba59abbe56e057f20f883e', 'Admin', 'Israel', 'Cáceres Marcos', '1991-09-17', '2019-08-20 18:09:16', 1, '2019-08-21 06:47:56', 0, 0, NULL, NULL),
(2, 'paulajimenez.7@hotmail.com', '8c416c2812ed806acb66520086da8972', 'Shena7', 'Paula', 'Jimenez', '1995-11-17', '2019-08-20 18:13:48', 1, '2019-08-20 19:54:40', 0, 0, NULL, NULL),
(4, 'paulajm@usal.es', '81dc9bdb52d04dc20036dbd8313ed055', 'LaLore', 'Lorena', 'Mateos', '1999-12-05', '2019-08-20 21:04:02', 1, '2019-08-20 23:36:03', 0, 0, NULL, NULL);



--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `articulos_comentarios`
--
ALTER TABLE `articulos_comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_articulos_comentarios` (`articulo_id`),
  ADD KEY `fk_comentarios_usuarios` (`crea_usuario_id`);

--
-- Indices de la tabla `articulos_likes`
--
ALTER TABLE `articulos_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_articulos_likes` (`articulo_id`);

--
-- Indices de la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_idx` (`user_id`);

--
-- Indices de la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Indices de la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indices de la tabla `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias_likes`
--
ALTER TABLE `categorias_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_categorias_likes` (`categoria_id`),
  ADD KEY `FK_categorias_likes_usuarios` (`usuario_id`);

--
-- Indices de la tabla `categorias_notas`
--
ALTER TABLE `categorias_notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_categorias_likes` (`categoria_id`),
  ADD KEY `FK_categorias_usuarios` (`usuario_id`);

--
-- Indices de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  ADD PRIMARY KEY (`variable`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nick_UNIQUE` (`nick`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `articulos_comentarios`
--
ALTER TABLE `articulos_comentarios`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;;

--
-- AUTO_INCREMENT de la tabla `articulos_likes`
--
ALTER TABLE `articulos_likes`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;;

--
-- AUTO_INCREMENT de la tabla `categorias_likes`
--
ALTER TABLE `categorias_likes`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;;

--
-- AUTO_INCREMENT de la tabla `categorias_notas`
--
ALTER TABLE `categorias_notas`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;;

--
-- AUTO_INCREMENT de la tabla `registros`
--
ALTER TABLE `registros`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos_comentarios`
--
ALTER TABLE `articulos_comentarios`
  ADD CONSTRAINT `FK_articulos_comentarios` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comentarios_usuarios` FOREIGN KEY (`crea_usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_assignment_usfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `categorias_likes`
--
ALTER TABLE `categorias_likes`
  ADD CONSTRAINT `FK_categorias_likes` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_categorias_likes_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `categorias_notas`
--
ALTER TABLE `categorias_notas`
  ADD CONSTRAINT `FK_categorias_notas` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_categorias_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

--
-- Filtros para la tabla `categorias_likes`
--
ALTER TABLE `articulos_likes`
  ADD CONSTRAINT `FK_articulos_likes` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_articulos_likes_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
