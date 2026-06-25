class Character {
  final String name;
  final String heroName;
  final String rank;
  final String abilities;
  final String description;
  final String imageAsset;

  const Character({
    required this.name,
    required this.heroName,
    required this.rank,
    required this.abilities,
    required this.description,
    required this.imageAsset,
  });
}

class Momento {
  final String title;
  final String description;
  final String imageAsset;
  final String videoUrl;

  const Momento({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.videoUrl,
  });
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

const List<Character> characters = [
  Character(
    name: 'Saitama',
    heroName: 'Calvo con Capa',
    rank: 'Clase B - Rango 7',
    abilities: 'Fuerza sobrehumana, velocidad infinita, puño serio, puño normal consecutivo',
    description:
        'Un joven que se convirtió en héroe por diversión. Después de tres años de entrenamiento '
        'extremo (100 flexiones, 100 abdominales, 100 sentadillas y 10 km de carrera diaria), '
        'obtuvo un poder tan abrumador que derrota a cualquier enemigo de un solo golpe. '
        'Su mayor problema ya no son los monstruos, sino la monotonía de ganar siempre.',
    imageAsset: 'assets/images/saitama.jpg',
  ),
  Character(
    name: 'Genos',
    heroName: 'Cyborg Demonio',
    rank: 'Clase S - Rango 14',
    abilities: 'Cañones de plasma, propulsores, sensores avanzados, auto-reparación',
    description:
        'Un joven cyborg que busca venganza contra el monstruo que destruyó su ciudad natal. '
        'Se convirtió en discípulo de Saitama para aprender el secreto de su fuerza, '
        'aunque constantemente subestima su simplicidad. Extremadamente serio y dedicado, '
        'documenta todo lo que Saitama hace en un cuaderno.',
    imageAsset: 'assets/images/Genos.jpg',
  ),
  Character(
    name: 'King',
    heroName: 'King',
    rank: 'Clase S - Rango 7',
    abilities: 'Intimidación, "Suerte del Rey"',
    description:
        'Considerado el hombre más fuerte del mundo, King es en realidad un otaku '
        'que accidentalmente recibió crédito por las hazañas de Saitama. Su corazón late '
        'tan fuerte que se escucha como un motor, lo que todos interpretan como preparación '
        'para la batalla. Su verdadero talento son los videojuegos.',
    imageAsset: 'assets/images/king.jpg',
  ),
  Character(
    name: 'Silver Fang',
    heroName: 'Bang',
    rank: 'Clase S - Rango 3',
    abilities: 'Puño del Agua Fluida, artes marciales supremas',
    description:
        'Maestro de artes marciales y antiguo líder del dojo Puño del Agua Fluida. '
        'A sus 81 años, sigue siendo uno de los héroes más respetados. '
        'Su técnica se basa en redirigir la fuerza del oponente. '
        'Quiere que Saitama sea su sucesor, aunque Genos compite por ese puesto.',
    imageAsset: 'assets/images/Silver.jpg',
  ),
  Character(
    name: 'Tatsumaki',
    heroName: 'Tornado del Terror',
    rank: 'Clase S - Rango 2',
    abilities: 'Telequinesis nivel dios, vuelo, barreras psíquicas',
    description:
        'La esper más poderosa del mundo con apariencia de niña pequeña. '
        'Su poder telequinético puede levantar ciudades enteras y lanzar meteoritos. '
        'Tiene una personalidad explosiva y orgullosa, y una relación complicada '
        'con su hermana menor Fubuki. Solo respeta a los verdaderamente fuertes.',
    imageAsset: 'assets/images/terrible tornado.jpg',
  ),
  Character(
    name: 'Fubuki',
    heroName: 'Ventisca Infernal',
    rank: 'Clase B - Rango 1',
    abilities: 'Telequinesis, vuelo, curación psíquica',
    description:
        'Líder del Grupo Fubuki y hermana menor de Tatsumaki. Aunque su poder es '
        'inmenso comparado con la mayoría, vive a la sombra de su hermana. '
        'Intenta reclutar héroes de bajo rango para su grupo, y ve a Saitama '
        'como una amenaza y una oportunidad al mismo tiempo.',
    imageAsset: 'assets/images/Hellish.jpg',
  ),
];

const List<Momento> momentos = [
  Momento(
    title: 'La Batalla Épica contra Boros',
    description:
        'Saitama finalmente encuentra a un oponente que puede resistir más de un golpe. '
        'Boros, el Dominador del Universo, viajó 20 años para encontrar un rival digno. '
        'La batalla es espectacular: Boros libera todo su poder en una secuencia de '
        'combate que empuja a Saitama a usar su "Puño Serio". Es el momento que define '
        'la serie: incluso el ser más poderoso del universo no puede igualar a Saitama.',
    imageAsset: 'assets/images/intro.jpg',
    videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  ),
  Momento(
    title: 'El Entrenamiento que lo Cambió Todo',
    description:
        'El momento más revelador de la serie: Saitama explica cómo obtuvo su poder. '
        '"100 flexiones, 100 abdominales, 100 sentadillas y correr 10 kilómetros. '
        'Todos los días. Sin aire acondicionado." Mientras otros héroes tienen orígenes '
        'épicos, la rutina de Saitama es absurdamente mundana, y sin embargo, nadie puede '
        'replicarla. Esta escena captura la esencia de One Punch Man: '
        'lo simple vence lo complejo.',
    imageAsset: 'assets/images/saitama.jpg',
    videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
  ),
  Momento(
    title: 'La Reunión de los Héroes Clase S',
    description:
        'La Asociación de Héroes convoca a todos los héroes Clase S para discutir '
        'la profecía de la Gran Catástrofe. Es la primera vez que vemos reunidos a los '
        'héroes más poderosos del mundo: Tatsumaki, Bang, Atomic Samurai, Child Emperor '
        'y más. Sus personalidades chocan de manera hilarante mientras Saitama, aburrido, '
        'se pregunta por qué todos son tan serios. La tensión entre clase y poder real '
        'nunca fue tan evidente.',
    imageAsset: 'assets/images/king.jpg',
    videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
  ),
];

const List<QuizQuestion> quizQuestions = [
  QuizQuestion(
    question: '¿Cuál es el nombre de héroe de Saitama?',
    options: ['Caped Baldy', 'Cape Man', 'Bald Hero', 'One Punch'],
    correctIndex: 0,
  ),
  QuizQuestion(
    question: '¿Quién es el discípulo cyborg de Saitama?',
    options: ['Metal Knight', 'Drive Knight', 'Genos', 'Child Emperor'],
    correctIndex: 2,
  ),
  QuizQuestion(
    question: '¿Cuál es el rango más alto en la Asociación de Héroes?',
    options: ['Clase A', 'Clase S', 'Clase X', 'Clase 1'],
    correctIndex: 1,
  ),
  QuizQuestion(
    question: '¿Cuántos km corría Saitama diariamente en su entrenamiento?',
    options: ['5 km', '10 km', '20 km', '50 km'],
    correctIndex: 1,
  ),
  QuizQuestion(
    question: '¿Quién escribe el webcómic original de One Punch Man?',
    options: ['Yusuke Murata', 'Akira Toriyama', 'ONE', 'Eiichiro Oda'],
    correctIndex: 2,
  ),
  QuizQuestion(
    question: '¿De qué clase es el héroe King?',
    options: ['Clase A', 'Clase B', 'Clase C', 'Clase S'],
    correctIndex: 3,
  ),
  QuizQuestion(
    question: '¿Cómo se llama la hermana de Tatsumaki?',
    options: ['Mizuki', 'Fubuki', 'Shizuka', 'Akame'],
    correctIndex: 1,
  ),
  QuizQuestion(
    question: '¿Qué monstruo le dio a Saitama su "pelea soñada"?',
    options: ['Orochi', 'Garou', 'Boros', 'Cienpiés Anciano'],
    correctIndex: 2,
  ),
  QuizQuestion(
    question: '¿Cuál es el nombre de héroe de Genos?',
    options: ['Metal Cyborg', 'Demon Cyborg', 'Iron Demon', 'Cyber Warrior'],
    correctIndex: 1,
  ),
  QuizQuestion(
    question: '¿En qué clase empieza Saitama en la Asociación?',
    options: ['Clase S', 'Clase A', 'Clase B', 'Clase C'],
    correctIndex: 3,
  ),
];
