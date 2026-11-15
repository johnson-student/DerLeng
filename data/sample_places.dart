import '../models/tourist_place.dart';

/// Preloaded Cambodian attractions (no external API needed).
const List<TouristPlace> sampleTouristPlaces = [
  // Phnom Penh
  TouristPlace(
    placeId: 'p01',
    name: 'Royal Palace',
    province: 'Phnom Penh',
    category: 'Historical Site',
    description:
        'Official residence of the King of Cambodia, famous for its Silver Pagoda and golden spires.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p02',
    name: 'National Museum of Cambodia',
    province: 'Phnom Penh',
    category: 'Museum',
    description:
        'The largest collection of Khmer art and sculpture, housed in a red-roofed building by the riverside.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p03',
    name: 'Tuol Sleng Genocide Museum',
    province: 'Phnom Penh',
    category: 'Museum',
    description:
        'A former school turned prison during the Khmer Rouge era, now a memorial museum.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p04',
    name: 'Wat Phnom',
    province: 'Phnom Penh',
    category: 'Temple',
    description:
        'The hilltop temple that gave Phnom Penh its name, set in a peaceful city park.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p05',
    name: 'Russian Market',
    province: 'Phnom Penh',
    category: 'Market',
    description:
        'A busy market for souvenirs, clothing, antiques and street food.',
    images: [],
  ),
  // Siem Reap
  TouristPlace(
    placeId: 'p06',
    name: 'Angkor Wat',
    province: 'Siem Reap',
    category: 'Temple',
    description:
        'The largest religious monument in the world and the symbol of Cambodia. Best at sunrise.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p07',
    name: 'Bayon Temple',
    province: 'Siem Reap',
    category: 'Temple',
    description:
        'Angkor Thom temple known for its many giant smiling stone faces.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p08',
    name: 'Ta Prohm',
    province: 'Siem Reap',
    category: 'Temple',
    description:
        'A temple left partly wrapped in giant tree roots, popular for photography.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p09',
    name: 'Banteay Srei',
    province: 'Siem Reap',
    category: 'Temple',
    description:
        'A small temple with very detailed pink sandstone carvings.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p10',
    name: 'Kampong Phluk Floating Village',
    province: 'Siem Reap',
    category: 'Nature',
    description:
        'Stilted houses and flooded forest on the edge of the Tonle Sap Lake, visited by boat.',
    images: [],
  ),
  // Kampot
  TouristPlace(
    placeId: 'p11',
    name: 'Bokor National Park',
    province: 'Kampot',
    category: 'Nature',
    description:
        'A mountain park with cool weather, waterfalls and an abandoned hill station.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p12',
    name: 'Kampot Pepper Farms',
    province: 'Kampot',
    category: 'Cultural',
    description:
        'Visit farms that grow the world-famous Kampot pepper and learn how it is harvested.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p13',
    name: 'Kampot Old Town',
    province: 'Kampot',
    category: 'Cultural',
    description:
        'A relaxed riverside town with French colonial buildings and cafes.',
    images: [],
  ),
  // Sihanoukville
  TouristPlace(
    placeId: 'p14',
    name: 'Otres Beach',
    province: 'Sihanoukville',
    category: 'Beach',
    description:
        'A quieter long beach with soft sand, beach bars and sunset views.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p15',
    name: 'Koh Rong Island',
    province: 'Sihanoukville',
    category: 'Island',
    description:
        'A tropical island with white sand beaches, snorkeling and glowing plankton at night.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p16',
    name: 'Koh Rong Sanloem',
    province: 'Sihanoukville',
    category: 'Island',
    description:
        'A calmer island with clear water, Saracen Bay and relaxed bungalows.',
    images: [],
  ),
  // Kep
  TouristPlace(
    placeId: 'p17',
    name: 'Kep Crab Market',
    province: 'Kep',
    category: 'Market',
    description:
        'A seaside market where fresh crab is cooked with Kampot pepper.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p18',
    name: 'Kep National Park',
    province: 'Kep',
    category: 'Nature',
    description:
        'Forest walking trails with sea views on the Kep peninsula.',
    images: [],
  ),
  // Battambang
  TouristPlace(
    placeId: 'p19',
    name: 'Battambang Bamboo Train',
    province: 'Battambang',
    category: 'Cultural',
    description:
        'A short ride on a light bamboo platform that runs along old railway tracks.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p20',
    name: 'Phnom Sampov',
    province: 'Battambang',
    category: 'Historical Site',
    description:
        'A hilltop temple with caves and a famous evening bat flight.',
    images: [],
  ),
  // Other provinces
  TouristPlace(
    placeId: 'p21',
    name: 'Bou Sra Waterfall',
    province: 'Mondulkiri',
    category: 'Nature',
    description:
        'One of the largest waterfalls in Cambodia, surrounded by green hills.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p22',
    name: 'Yeak Laom Lake',
    province: 'Ratanakiri',
    category: 'Nature',
    description:
        'A clear volcanic crater lake in the forest, good for swimming.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p23',
    name: 'Preah Vihear Temple',
    province: 'Preah Vihear',
    category: 'Temple',
    description:
        'A mountain-top Khmer temple on the Dangrek cliffs, a UNESCO World Heritage Site.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p24',
    name: 'Koh Ker',
    province: 'Preah Vihear',
    category: 'Temple',
    description:
        'A remote ancient capital with a seven-tier pyramid temple.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p25',
    name: 'Kratie Irrawaddy Dolphins',
    province: 'Kratie',
    category: 'Wildlife',
    description:
        'Watch rare freshwater Irrawaddy dolphins from a boat on the Mekong River.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p26',
    name: 'Sambor Prei Kuk',
    province: 'Kampong Thom',
    category: 'Historical Site',
    description:
        'Pre-Angkorian temples in the forest, a UNESCO World Heritage Site.',
    images: [],
  ),
  TouristPlace(
    placeId: 'p27',
    name: 'Tatai Waterfall',
    province: 'Koh Kong',
    category: 'Nature',
    description:
        'A wide waterfall and river in the Cardamom mountains, good for kayaking and swimming.',
    images: [],
  ),
];
