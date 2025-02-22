--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-12-09 22:59:59

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 234 (class 1259 OID 18132)
-- Name: dataSet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."dataSet" (
    "id_dataSet" integer NOT NULL,
    nombre character varying,
    definicion character varying,
    familia character varying,
    tratamiento character varying,
    amenaza boolean
);


ALTER TABLE public."dataSet" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18131)
-- Name: dataSet_id_dataSet_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."dataSet_id_dataSet_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."dataSet_id_dataSet_seq" OWNER TO postgres;

--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 233
-- Name: dataSet_id_dataSet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."dataSet_id_dataSet_seq" OWNED BY public."dataSet"."id_dataSet";


--
-- TOC entry 4750 (class 2604 OID 18135)
-- Name: dataSet id_dataSet; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."dataSet" ALTER COLUMN "id_dataSet" SET DEFAULT nextval('public."dataSet_id_dataSet_seq"'::regclass);


--
-- TOC entry 4897 (class 0 OID 18132)
-- Dependencies: 234
-- Data for Name: dataSet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (37, 'Necrosis Apical', 'La necrosis apical del mango (NAM) es una enfermedad bacteriana causada por la bacteria Pseudomonas syringae pv. syringae. Esta enfermedad afecta principalmente a los árboles de mango en climas mediterráneos y subtropicales.

- Síntomas
Manchas necróticas: Aparición de manchas necróticas en las yemas vegetativas y florales. Estas manchas pueden extenderse hacia el tallo y las hojas.

Exudado: En algunas ocasiones, se pueden observar gotas de exudado blanco lechoso en las yemas o panículas florales, que más tarde oscurecen y toman aspecto de resina.

Secado y muerte: Las yemas afectadas se secan y mueren, lo que puede llevar a la muerte de la rama o incluso del árbol en casos extremos', 'La necrosis apical del mango es causada por la bacteria Pseudomonas syringae pv. syringae, que pertenece a la familia Pseudomonadaceae', 'Tratamiento de la Enfermedad:

- Eliminación de partes afectadas: Cortar y eliminar las partes del árbol que presenten síntomas de la enfermedad, como las yemas y ramas afectadas.

- Aplicación de bactericidas:
Tratar las plantas afectadas con bactericidas específicos para controlar la bacteria', true);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (87, 'Hoja de Guayaba', 'La hoja de guayaba es la hoja del árbol de guayabo (Psidium guajava), una planta tropical nativa de América Central y del Sur, conocida por sus frutos comestibles, las guayabas. Estas hojas tienen varias características y usos importantes:

Características de la Hoja de Guayaba
Forma y Tamaño: Las hojas de guayaba son generalmente ovadas, con un tamaño que varía entre los 7 y 15 cm de largo y los 3 a 5 cm de ancho.

Textura: Son gruesas, coriáceas, y tienen una superficie superior brillante y una superficie inferior algo más pálida y aterciopelada debido a la presencia de tricomas.

Color: Son de color verde brillante.

Olor: Tienen un aroma distintivo, algo similar al de la fruta pero menos pronunciado.', 'El guayabo (Psidium guajava) pertenece a la familia Myrtaceae. Esta es una familia de plantas dicotiledóneas que incluye numerosos árboles y arbustos, muchos de los cuales son de importancia económica y ecológica. Otras plantas conocidas de esta familia incluyen el eucalipto, el mirto, y el clavo de olor.', 'No Aplica', false);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (33, 'Hoja de Mango', 'El mango (Mangifera indica) es un árbol frutal tropical originario del sur de Asia, concretamente de la región entre India y Birmania', 'Este árbol pertenece a la familia de las Anacardiáceas', 'No Aplica', false);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (95, 'Candida Guillermondii', 'Candida guilliermondii no es una planta. Es una levadura, un tipo de hongo unicelular. Aunque el término "Candida" puede sonar similar a nombres de plantas, se refiere específicamente a un grupo de levaduras que pueden estar presentes en el medio ambiente, en alimentos, y también pueden causar infecciones en seres humanos y animales.

Las levaduras, incluyendo Candida guilliermondii, son organismos importantes tanto en aplicaciones industriales (como la fermentación) como en investigaciones médicas y biotecnológicas. También tienen aplicaciones en el control biológico en la agricultura, como mencioné antes, pero no son plantas.', 'Candida guilliermondii pertenece a la familia Debaryomycetaceae. Esta familia incluye varias especies de levaduras del género Candida, que son importantes tanto en contextos médicos debido a su capacidad para causar infecciones, como en aplicaciones industriales y biotecnológicas.', 'El tratamiento para Candida guilliermondii generalmente implica el uso de medicamentos antifúngicos. Aquí hay algunas opciones comunes:

Fluconazol: Un medicamento antifúngico comúnmente utilizado, aunque algunas cepas de Candida guilliermondii pueden mostrar resistencia.

Anfotericina B: Este medicamento es efectivo contra muchas cepas de Candida, incluyendo Candida guilliermondii.

Caso de resistencia: En casos donde hay resistencia a los tratamientos anteriores, se pueden considerar otros antifúngicos como el anidulafungina.

Es importante que el tratamiento sea supervisado por un profesional de la salud para asegurar su efectividad y evitar complicaciones.', true);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (88, 'Hongo de Suelo', 'los hongos del suelo pueden afectar a la planta Zamioculcas zamiifolia (también conocida como Zamioculca). Aquí tienes una explicación más detallada:

Pudrición de raíces: Los hongos del suelo pueden infectar las raíces de la planta, causando que se pudran y se deterioren. Esto afecta la capacidad de la planta para absorber agua y nutrientes.

Hojas caídas y amarillentas: A medida que las raíces se pudren, la planta no puede mantenerse saludable, lo que lleva a que las hojas se vuelvan amarillas y caigan.

Muerte de la planta: Si la infección no se trata, la planta puede llegar a morir debido a la falta de nutrientes y agua adecuados.

Condiciones favorables: Los hongos prosperan en suelos húmedos y mal drenados, lo que crea un ambiente ideal para su crecimiento.

Mancha oscura: Esta es una enfermedad fúngica que causa manchas oscuras e irregulares en las hojas y tallos de la planta. La enfermedad se propaga en condiciones de alta humedad y puede ser altamente infecciosa.', 'Los hongos del suelo pertenecen a varias familias dentro del reino Fungi. Los principales grupos de hongos del suelo incluyen:

Ascomicetos (Ascomycota): Esta es la familia más grande del reino Fungi y contiene muchas especies que desempeñan un papel importante en la descomposición de materia orgánica.

Basidiomicetos (Basidiomycota): Estos hongos también son importantes descomponedores y pueden formar relaciones simbióticas con las raíces de las plantas (micorrizas).

Zigomicetos (Zygomycota): Estos hongos son conocidos por su capacidad para descomponer materia orgánica y pueden encontrarse en suelos ricos en materia orgánica.

Quitridiomicetos (Chytridiomycota): Aunque muchos de estos hongos son acuáticos, algunos pueden encontrarse en suelos húmedos y desempeñan un papel en la descomposición de materia orgánica.', 'Para tratar los hongos del suelo que afectan a tu Zamioculcas, puedes seguir estos pasos:

Mejorar el Drenaje del Suelo: Asegúrate de que el suelo tenga un buen drenaje para evitar el encharcamiento, que favorece el crecimiento de hongos. Puedes modificar la mezcla para macetas para aumentar la aireación y el drenaje1.

Ajustar los Hábitos de Riego: Reduce la frecuencia de riego y asegúrate de que el suelo se seque entre sesiones de riego. Esto ayuda a prevenir condiciones húmedas que favorecen los hongos2.

Aplicar Fungicidas: Utiliza un fungicida adecuado para controlar la propagación del hongo. Sigue las instrucciones del fabricante para aplicarlo correctamente2.

Mejorar la Ventilación: Aumenta la circulación de aire alrededor de la planta para reducir la retención de humedad. Esto puede ayudar a desalentar el crecimiento fúngico2.

Eliminar las Hojas Afectadas: Retira cualquier hoja afectada para evitar que el hongo se propague a otras partes de la planta.

Es importante actuar rápidamente para controlar la infestación y minimizar el daño a tu planta.', true);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (92, 'Hoja de Tuatua', 'La hoja de tuatua, también conocida como Jatropha gossypiifolia o tua tua, es una planta herbácea silvestre originaria de Latinoamérica. Esta planta es conocida por sus múltiples propiedades medicinales.

Características de la Hoja de Tuatua
Hojas: Son grandes, de color verde oscuro y brillante, y pueden tener un tono violeta en algunas ocasiones.

Tallo: Es cilíndrico, muy ramificado y puede alcanzar hasta 2.5 metros de altura.

Flores: Son de color purpúreo y se agrupan en inflorescencias llamativas.

Frutos: Son pequeñas cápsulas triloculares que van oscureciéndose a medida que maduran.

Usos y Beneficios
Antibiótico Natural: Las hojas y el látex del tallo se utilizan para tratar infecciones cutáneas, bucales y oculares.

Cicatrizante: El látex del tallo se usa para preparar infusiones que actúan como cicatrizantes y restauradores de tejidos.

Diurético y Purgante: Se utiliza para tratar problemas urinarios y como purgante.

Antinflamatorio: Ayuda a reducir la inflamación en diversas partes del cuerpo.

Es importante tener en cuenta que, aunque la tua tua tiene muchas propiedades beneficiosas, también puede ser tóxica si se consume en grandes cantidades', 'La Jatropha gossypiifolia, comúnmente conocida como tua tua, pertenece a la familia Euphorbiaceae. Esta familia incluye muchas plantas que son conocidas por sus propiedades medicinales y también por sus toxinas, por lo que se deben manejar con cuidado. Algunos otros miembros notables de esta familia incluyen la poinsettia (Euphorbia pulcherrima) y el árbol de ricino (Ricinus communis).', 'No Aplica', false);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (94, 'Tithonia Diversifolia', 'Tithonia diversifolia, también conocida como girasol mexicano, girasol japonés o acahual. Es originaria de México y Centroamérica, pero se ha naturalizado en muchas regiones tropicales y subtropicales del mundo debido a su crecimiento vigoroso y su capacidad para adaptarse a diferentes condiciones ambientales.

Características de Tithonia diversifolia
Hojas: Son grandes, lobuladas y de color verde oscuro. Las hojas pueden tener entre 10 a 40 cm de largo.

Flores: Produce flores grandes y llamativas de color amarillo anaranjado, similares a las de los girasoles. Las flores atraen a polinizadores como abejas y mariposas.

Altura: Puede crecer entre 2 y 3 metros de altura, formando arbustos densos.

Tallo: Los tallos son gruesos, leñosos y a menudo ramificados.', 'Tithonia diversifolia, conocida comúnmente como girasol mexicano, pertenece a la familia Asteraceae. Esta familia, también conocida como la familia de las compuestas, incluye una amplia variedad de plantas que son populares tanto por su valor ornamental como por sus propiedades medicinales y ecológicas. Algunos miembros notables de esta familia incluyen el girasol (Helianthus annuus), la margarita (Bellis perennis) y el diente de león (Taraxacum officinale).', 'No Aplica', false);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (89, 'Zamioculca', 'La Zamioculca (Zamioculcas zamiifolia), también conocida comúnmente como "planta ZZ" o "planta de la eternidad", es una planta tropical nativa de África oriental, específicamente de regiones como Kenia y Tanzania. Es muy apreciada como planta de interior debido a su resistencia y fácil mantenimiento.

Características de la Zamioculca
Hojas: Tiene hojas pinnadas, brillantes y de color verde oscuro que crecen en pecíolos gruesos.

Tamaño: Puede alcanzar una altura de entre 45 cm a 60 cm, aunque en condiciones ideales puede crecer más.

Rizomas: Crece a partir de rizomas gruesos y subterráneos que almacenan agua, lo que permite a la planta sobrevivir en condiciones de sequía.

Floración: Las flores son raras y poco vistosas, generalmente ocultas entre las hojas.', 'La Zamioculcas zamiifolia, comúnmente conocida como Zamioculca o planta ZZ, pertenece a la familia Araceae. Esta familia, también conocida como la familia de los aroides, incluye muchas otras plantas ornamentales populares como los anturios, las alocasia y las dieffenbachias.', 'No Aplica', false);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (93, 'Roya', 'La roya es una enfermedad fúngica que puede afectar a muchas plantas, incluyendo la tua tua (Jatropha gossypiifolia). Esta enfermedad se caracteriza por la aparición de manchas de color amarillo, naranja o marrón en las hojas, tallos y frutos de la planta. Las manchas suelen estar acompañadas por un polvo de esporas característico del hongo que causa la roya.

Síntomas de la Roya en la Planta Tuatua
Manchas en las hojas: Manchas de color amarillo, naranja o marrón.

Pústulas polvorientas: Pequeñas protuberancias polvorientas en el envés de las hojas.

Decoloración y marchitamiento: Las hojas pueden decolorarse y marchitarse.

Caída prematura de las hojas: En casos severos, las hojas pueden caer antes de tiempo', 'La plaga de roya, que afecta a la planta tuatua, es causada por diversos hongos que pertenecen a diferentes familias fúngicas. En general, las royas son causadas por hongos de las familias Pucciniaceae y Uropyxidaceae. Estos hongos son altamente especializados y pueden afectar a una amplia variedad de plantas, incluidos cultivos importantes.', 'Para tratar la plaga de roya en plantas como la tuatua, puedes seguir estos pasos:

Eliminación de Plantas Afectadas: Retira y destruye las hojas infectadas para reducir la cantidad de esporas en el ambiente.

Fungicidas: Aplica fungicidas específicos para roya, como aquellos que contienen azufre o cobre. Es importante seguir las instrucciones del fabricante para la aplicación adecuada.

Rotación de Cultivos: Evita plantar especies susceptibles en el mismo lugar de cultivo durante varios años para reducir la acumulación de esporas en el suelo.

Mejora de la Circulación de Aire: Asegúrate de que las plantas tengan suficiente espacio para una buena circulación de aire, lo cual ayuda a reducir la humedad y la propagación de hongos.

Riego Adecuado: Evita el riego por aspersión y opta por sistemas de riego que mantengan las hojas secas, como el riego por goteo.

Estos métodos pueden ayudar a controlar y prevenir la roya en las plantas de tuatua.', true);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (86, 'Phyllosticta psidiicola', 'Phyllosticta psidiicola es un hongo patógeno. Este hongo causa manchas rojizas en las hojas y frutos de la guayaba, lo que puede disminuir su valor comercial2. Las manchas suelen ser visibles como áreas hundidas de diversos tamaños en los frutos y hojas', 'Phyllosticta psidiicola pertenece a la familia Botryosphaeriaceae. Esta familia incluye muchos hongos que son patógenos de plantas y pueden causar diversas enfermedades, como manchas foliares, cancro y pudriciones.', 'Para tratar la infección por Phyllosticta psidiicola en las plantas de guayaba, puedes seguir estos pasos:

Control Cultural: Mantén el área de cultivo limpia eliminando restos de plantas infectadas y desechos de cultivo. Esto ayuda a reducir la cantidad de esporas en el suelo.

Riego Adecuado: Evita el riego excesivo y asegúrate de que el suelo tenga un buen drenaje para evitar condiciones de humedad que favorecen el crecimiento del hongo.

Uso de Fungicidas: Aplica fungicidas adecuados, como aquellos que contienen hexaconazol (0.1%), propiconazol (0.1%) o carbendazim + mancozeb. Pulveriza las plantas cuando se observe la enfermedad por primera vez y repite la aplicación dos veces con un intervalo de 20 días.

Manejo de pH del Suelo: Aumenta el pH del suelo aplicando cal, lo que puede ayudar a reducir la incidencia de la enfermedad.

Control Biológico: Si está disponible, utiliza métodos de control biológico para reducir la población del hongo.', true);


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 233
-- Name: dataSet_id_dataSet_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."dataSet_id_dataSet_seq"', 95, true);


--
-- TOC entry 4752 (class 2606 OID 18139)
-- Name: dataSet dataSet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."dataSet"
    ADD CONSTRAINT "dataSet_pkey" PRIMARY KEY ("id_dataSet");


-- Completed on 2024-12-09 22:59:59

--
-- PostgreSQL database dump complete
--

