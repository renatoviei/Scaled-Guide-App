import 'package:ScaledGuideApp/shared/loading.dart';
import 'package:flutter/material.dart';

import '../components/organization_tile.dart';
import '../models/Organization.dart';
import '../provider/organizations.dart';

class OrganizationsList {
  Widget buildListOrganizations(List<Organization> organizations) {
    return StreamBuilder<List<Organization>>(
        stream: Organizations().organizations,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Organization>? orgs = snapshot.data;

            return Container(
              margin: const EdgeInsets.only(bottom: 55.0),
              child: ListView.builder(
                itemCount: orgs?.length,
                itemBuilder: (ctx, i) => OrganizationTile(orgs!.elementAt(i)),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
