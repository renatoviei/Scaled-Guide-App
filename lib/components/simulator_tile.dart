import 'package:flutter/material.dart';
import '../models/Organization.dart';
import '../routes/app_routes.dart';
import '../views/run_simulation.dart';

class SimulatorTile extends StatelessWidget {
  final Organization organization;

  const SimulatorTile(this.organization);

  @override
  Widget build(BuildContext context) {
    final avatar = organization.avatarUrl == null ||
            organization.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(organization.avatarUrl));

    return ListTile(
      leading: avatar,
      title: Text(organization.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
        ),),
      subtitle: Text(
        organization.method,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.orange,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
        ),
      ),
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => RunSimulationForm(organization),
          ),
          ModalRoute.withName(AppRoutes.HOME_TAB),
        );
      },
    );
  }
}
