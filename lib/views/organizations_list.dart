import 'package:flutter/material.dart';

import '../components/organization_tile.dart';
import '../provider/organizations.dart';

class OrganizationsList {
  Widget buildListOrganizations(Organizations organizations) {
    return Container(
      margin: const EdgeInsets.only(bottom: 55.0),
      child: ListView.builder(
        itemCount: organizations.count,
        itemBuilder: (ctx, i) => OrganizationTile(organizations.byIndex(i)),
      ),
    );
  }
}
