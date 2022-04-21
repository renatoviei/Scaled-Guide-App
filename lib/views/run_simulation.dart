import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/UserApp.dart';
import '../provider/organizations.dart';

import '../models/Organization.dart';

class RunSimulationForm extends StatefulWidget {
  var organization;

  RunSimulationForm(this.organization, {Key? key}) : super(key: key);

  @override
  State<RunSimulationForm> createState() => _FormState();
}

class _FormState extends State<RunSimulationForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  String method = 'Not simulated';
  String sector = '';
  bool hasExperienceWithAgile = false;
  bool hasLeadershipSupport = false;
  bool hasStakeholderMembership = false;
  bool hasFlexibleBudget = false;
  bool hasAgileFluidTeamStructure = false;
  bool hasWellPreparedPlanning = false;
  bool hasDedicatedFullTimeTeam = false;
  bool hasEffectiveImprovementMechanism = false;
  bool hasProximityAgileTeams = false;
  bool hasDifferentArenasCoordination = false;
  bool hasPrinciplesAheadMetrics = false;
  bool hasBalanceAutonomyNeedSupervision = false;
  bool hasMaintenanceTransparency = false;
  bool hasElementCustomization = false;
  bool hasArchitecturalGuidelines = false;
  bool hasBalancedUseDocumentation = false;
  bool hasRaiseAwarenessDependenciesBetweenTeams = false;
  bool hasWellStructuredAdoptionApproach = false;
  bool hasStandardizationAgilePracticesAmongTeams = false;
  bool hasTrainingCoachingEveryoneAgileAdoption = false;
  bool hasExternalCoachSupportMethodAdoption = false;
  bool hasCommunityPractice = false;
  bool hasShareCommonVision = false;
  bool hasPeopleInvolvementAdoption = false;
  bool hasTrustBetweenTeams = false;
  bool hasInformationSharingSystemsWellStructured = false;
  bool hasCommonInfrastructure = false;

  void _loadFormData(Organization organization) {
    if (organization != null) {
      _formData['id'] = organization.id;
      _formData['name'] = organization.name;
      _formData['email'] = organization.email;
      _formData['cnpj'] = organization.cnpj;
      _formData['description'] = organization.description;
      _formData['avatarUrl'] = organization.avatarUrl;
      _formData['method'] = organization.method;
      sector = organization.sector;
      hasExperienceWithAgile = organization.hasExperienceWithAgile;
      hasLeadershipSupport = organization.hasLeadershipSupport;
      hasStakeholderMembership = organization.hasStakeholderMembership;
      hasFlexibleBudget = organization.hasFlexibleBudget;
      hasAgileFluidTeamStructure = organization.hasAgileFluidTeamStructure;
      hasWellPreparedPlanning = organization.hasWellPreparedPlanning;
      hasDedicatedFullTimeTeam = organization.hasDedicatedFullTimeTeam;
      hasEffectiveImprovementMechanism =
          organization.hasEffectiveImprovementMechanism;
      hasProximityAgileTeams = organization.hasProximityAgileTeams;
      hasDifferentArenasCoordination =
          organization.hasDifferentArenasCoordination;
      hasPrinciplesAheadMetrics = organization.hasPrinciplesAheadMetrics;
      hasBalanceAutonomyNeedSupervision =
          organization.hasBalanceAutonomyNeedSupervision;
      hasMaintenanceTransparency = organization.hasMaintenanceTransparency;
      hasElementCustomization = organization.hasElementCustomization;
      hasArchitecturalGuidelines = organization.hasArchitecturalGuidelines;
      hasBalancedUseDocumentation = organization.hasBalancedUseDocumentation;
      hasRaiseAwarenessDependenciesBetweenTeams =
          organization.hasRaiseAwarenessDependenciesBetweenTeams;
      hasWellStructuredAdoptionApproach =
          organization.hasWellStructuredAdoptionApproach;
      hasStandardizationAgilePracticesAmongTeams =
          organization.hasStandardizationAgilePracticesAmongTeams;
      hasTrainingCoachingEveryoneAgileAdoption =
          organization.hasTrainingCoachingEveryoneAgileAdoption;
      hasExternalCoachSupportMethodAdoption =
          organization.hasExternalCoachSupportMethodAdoption;
      hasCommunityPractice = organization.hasCommunityPractice;
      hasShareCommonVision = organization.hasShareCommonVision;
      hasPeopleInvolvementAdoption = organization.hasPeopleInvolvementAdoption;
      hasTrustBetweenTeams = organization.hasTrustBetweenTeams;
      hasInformationSharingSystemsWellStructured =
          organization.hasInformationSharingSystemsWellStructured;
      hasCommonInfrastructure = organization.hasCommonInfrastructure;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserApp?>(context);
    final Organization organization = widget.organization;

    if (_formData.isEmpty) {
      _loadFormData(organization);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: const Text(
          'Scaled Guide',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Run Agile Framework simulation for your organization?",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _form,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 55.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        initialValue: _formData['name'],
                        decoration: const InputDecoration(labelText: 'Name'),
                        showCursor: true,
                        enabled: false,
                      ),
                      TextFormField(
                        initialValue: _formData['email'],
                        decoration: const InputDecoration(labelText: 'Email'),
                        showCursor: true,
                        enabled: false,
                      ),
                      TextFormField(
                        initialValue: _formData['cnpj'],
                        decoration: const InputDecoration(labelText: 'CNPJ'),
                        showCursor: true,
                        enabled: false,
                      ),
                      TextFormField(
                        initialValue: _formData['description'],
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                        showCursor: true,
                        enabled: false,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Text(
                            "Sector",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        value: sector,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.blue),
                        underline: Container(
                          height: 0.5,
                          color: Colors.grey,
                        ),
                        onChanged: null,
                        items: <String>[
                          'IT',
                          'Energy',
                          'Food',
                          'Civil Construction',
                          'Warfare',
                          'Agribusiness',
                          'Consumer Things',
                          'Retail',
                          'Financial Services',
                          'Automotive'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      TextFormField(
                        initialValue: _formData['avatarUrl'],
                        decoration:
                            const InputDecoration(labelText: 'Your avatar URL (logo)'),
                        showCursor: true,
                        enabled: false,
                      ),
                      TextFormField(
                        initialValue: _formData['method'],
                        decoration: const InputDecoration(
                            labelText: 'Agile Framework/Method in use'),
                        showCursor: true,
                        enabled: false,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'The organization has experience with agile?'),
                        value: hasExperienceWithAgile,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      Text("Agile Goals",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be strong leadership support and commitment to agile adoption and deployment?'),
                        value: hasLeadershipSupport,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be buy-in from all stakeholders?'),
                        value: hasStakeholderMembership,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will the budget be flexible?'),
                        value: hasFlexibleBudget,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be an agile and fluid team structure?'),
                        value: hasAgileFluidTeamStructure,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Should the planning event be well prepared?'),
                        value: hasWellPreparedPlanning,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will the team be dedicated all the time?'),
                        value: hasDedicatedFullTimeTeam,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be an effective mechanism for the continuous improvement process?'),
                        value: hasEffectiveImprovementMechanism,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be physical proximity of agile teams?'),
                        value: hasProximityAgileTeams,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be different arenas for coordination over time?'),
                        value: hasDifferentArenasCoordination,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will principles be ahead of metrics?'),
                        value: hasPrinciplesAheadMetrics,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be a balance of agile autonomy with the need for supervision?'),
                        value: hasBalanceAutonomyNeedSupervision,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will the process maintain transparency across a large number of fast, adaptable teams and projects?'),
                        value: hasMaintenanceTransparency,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be custom ceremonies, practices, agile tools, support and support?'),
                        value: hasElementCustomization,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be architectural guidelines and a dedicated architect for the group?'),
                        value: hasArchitecturalGuidelines,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be balanced use of the software' + "'" + 's internal documentation?'),
                        value: hasBalancedUseDocumentation,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will it be important to raise awareness of dependencies between teams through joint meetings?'),
                        value: hasRaiseAwarenessDependenciesBetweenTeams,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be a well-structured adoption approach?'),
                        value: hasWellStructuredAdoptionApproach,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be standardization of agile practices among teams?'),
                        value: hasStandardizationAgilePracticesAmongTeams,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be training and coaching for everyone on agile adoption?'),
                        value: hasTrainingCoachingEveryoneAgileAdoption,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be an external coach to support the adoption of the method?'),
                        value: hasExternalCoachSupportMethodAdoption,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be a Community of Practice for continuous improvement?'),
                        value: hasCommunityPractice,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be a shared vision?'),
                        value: hasShareCommonVision,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be involvement and engagement of people in the adoption?'),
                        value: hasPeopleInvolvementAdoption,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be trust between the teams?'),
                        value: hasTrustBetweenTeams,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will information and knowledge sharing systems be well structured?'),
                        value: hasInformationSharingSystemsWellStructured,
                        onChanged: null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be joint/common infrastructure?'),
                        value: hasCommonInfrastructure,
                        onChanged: null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor: Colors.orange,
                  primary: Colors.white,
                ),
                onPressed: () async {
                  _form.currentState!.save();

                  method = 'Scrum-at-Scale';

                  Provider.of<Organizations>(context, listen: false).put(
                    Organization(
                      id: _formData['id']!,
                      userId: user!.id,
                      name: _formData['name']!,
                      email: _formData['email']!,
                      cnpj: _formData['cnpj']!,
                      description: _formData['description']!,
                      sector: sector,
                      avatarUrl: _formData['avatarUrl']!,
                      method: method,
                      hasExperienceWithAgile: hasExperienceWithAgile,
                      hasLeadershipSupport: hasLeadershipSupport,
                      hasStakeholderMembership: hasStakeholderMembership,
                      hasFlexibleBudget: hasFlexibleBudget,
                      hasAgileFluidTeamStructure: hasAgileFluidTeamStructure,
                      hasWellPreparedPlanning: hasWellPreparedPlanning,
                      hasDedicatedFullTimeTeam: hasDedicatedFullTimeTeam,
                      hasEffectiveImprovementMechanism:
                      hasEffectiveImprovementMechanism,
                      hasProximityAgileTeams: hasProximityAgileTeams,
                      hasDifferentArenasCoordination:
                      hasDifferentArenasCoordination,
                      hasPrinciplesAheadMetrics: hasPrinciplesAheadMetrics,
                      hasBalanceAutonomyNeedSupervision:
                      hasBalanceAutonomyNeedSupervision,
                      hasMaintenanceTransparency: hasMaintenanceTransparency,
                      hasElementCustomization: hasElementCustomization,
                      hasArchitecturalGuidelines: hasArchitecturalGuidelines,
                      hasBalancedUseDocumentation:
                      hasBalancedUseDocumentation,
                      hasRaiseAwarenessDependenciesBetweenTeams:
                      hasRaiseAwarenessDependenciesBetweenTeams,
                      hasWellStructuredAdoptionApproach:
                      hasWellStructuredAdoptionApproach,
                      hasStandardizationAgilePracticesAmongTeams:
                      hasStandardizationAgilePracticesAmongTeams,
                      hasTrainingCoachingEveryoneAgileAdoption:
                      hasTrainingCoachingEveryoneAgileAdoption,
                      hasExternalCoachSupportMethodAdoption:
                      hasExternalCoachSupportMethodAdoption,
                      hasCommunityPractice: hasCommunityPractice,
                      hasShareCommonVision: hasShareCommonVision,
                      hasPeopleInvolvementAdoption:
                      hasPeopleInvolvementAdoption,
                      hasTrustBetweenTeams: hasTrustBetweenTeams,
                      hasInformationSharingSystemsWellStructured:
                      hasInformationSharingSystemsWellStructured,
                      hasCommonInfrastructure: hasCommonInfrastructure,
                    ),
                  );

                  await showDialog(
                    context: context,
                    builder: (cxt) => AlertDialog(
                      backgroundColor: Colors.grey[50],
                      title: const Text(
                        'Done!',
                        style: TextStyle(
                          color: Colors.orange,
                        ),
                      ),
                      content: Text(
                        'The suggested Agile Framework at scale for you to use in your organization is the ' +
                            method +
                            '!\n\n' +
                            'To know more information about Frameworks, see "Frameworks" tab.',
                        textAlign: TextAlign.justify,
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.of(cxt).pop();
                          },
                        ),
                      ],
                    ),
                  );

                  Navigator.of(context).pop();
                },
                child: const Text('Run'),
              ),
            ],
        ),
      ),
    );
  }
}
