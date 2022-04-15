import '../models/Organization.dart';

const DUMMY_ORGANIZATIONS = {
  '1': Organization(
      id: '1',
      userId: '',
      name: 'Take Blip',
      email: 'take@take.net',
      cnpj: '38.828.358/0001-80',
      description: 'Contatos Iteligentes',
      sector: 'Food',
      avatarUrl: 'https://www.take.net/files/themes/blank_theme/assets/img/take-og-image.png',
      method: 'SAFe',
      hasExperienceWithAgile: true
  ),
  '2': Organization(
      id: '2',
      userId: '',
      name: 'CI&T',
      email: 'ci&t@CI&T.net',
      cnpj: '38.828.123/4567-80',
      description: 'Consultoria',
      sector: 'IT',
      avatarUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbWkVM4Of1-StTTAqIy4SiYoeOAtu-LVwjZw&usqp=CAU',
      method: 'LeSS',
      hasExperienceWithAgile: true
  ),
  '3': Organization(
      id: '3',
      userId: '',
      name: 'Thought Works',
      email: 'tw@tw.net',
      cnpj: '38.789.358/5555-80',
      description: 'Consultoria',
      sector: 'IT',
      avatarUrl: 'https://www.nikhil.eu/thoughtworks.jpeg',
      method: 'DAD',
      hasExperienceWithAgile: true
  ),
  '4': Organization(
      id: '4',
      userId: '',
      name: 'Avanade',
      email: 'avanade@avanade.net',
      cnpj: '55.423.358/5551-80',
      description: 'Consultoria',
      sector: 'IT',
      avatarUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9VTF_hrxUnJ0c9XfEpwmG3zkhGwk5CPXRTw&usqp=CAU',
      method: 'Not Simulated',
      hasExperienceWithAgile: true
  ),
};