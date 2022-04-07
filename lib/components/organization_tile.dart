import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/organizations.dart';
import '../models/Organization.dart';
import '../routes/app_routes.dart';
import '../views/organization_edit_form.dart';

class OrganizationTile extends StatelessWidget {
  final Organization organization;

  const OrganizationTile(this.organization);

  @override
  Widget build(BuildContext context) {
    final avatar = organization.avatarUrl == null ||
            organization.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(organization.avatarUrl));

    return ListTile(
      leading: avatar,
      title: Text(
        organization.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
        ),
      ),
      subtitle: Text(organization.description),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrganizationEditForm(organization),
                  ),
                  ModalRoute.withName(AppRoutes.HOME),
                );
              },
              icon: const Icon(Icons.edit),
              color: Colors.orange,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (cxt) => AlertDialog(
                    title: const Text('Delete organization'),
                    content: const Text('Are you sure?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.of(cxt).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Yes'),
                        onPressed: () {
                          Provider.of<Organizations>(context, listen: false)
                              .remove(organization);
                          Navigator.of(cxt).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
