import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Organization.dart';
import '../models/UserApp.dart';
import '../provider/organizations.dart';

class OrganizationForm extends StatefulWidget {
  @override
  State<OrganizationForm> createState() => _FormState();
}

class _FormState extends State<OrganizationForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  String sector = 'IT';
  String method = 'Not simulated';
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
  bool hasDisciplinedTeams = false;
  bool hasTrustBetweenTeams = false;
  bool hasInformationSharingSystemsWellStructured = false;
  bool hasCommonInfrastructure = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserApp?>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: const Text('Scaled Guide'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Provide the information about the present and agile goals for your organization",
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
                        decoration: const InputDecoration(labelText: 'Name'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty)
                            return 'Inform the name';
                        },
                        onSaved: (value) => _formData['name'] = value!,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty)
                            return 'Inform the email';
                        },
                        onSaved: (value) => _formData['email'] = value!,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'CNPJ'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty)
                            return 'Inform CNPJ of the organization';
                          if (value
                                  .replaceAll('.', '')
                                  .replaceAll('/', '')
                                  .replaceAll('-', '')
                                  .length !=
                              14) return 'CNPJ is invalid';
                        },
                        onSaved: (value) => _formData['cnpj'] = value!,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty)
                            return 'Inform the description';
                          if (value.length > 280)
                            return 'Your description must be less than 280 characters';
                        },
                        onSaved: (value) => _formData['description'] = value!,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Text(
                            "Sector",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
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
                          height: 2,
                          color: Colors.blue,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            sector = newValue!;
                          });
                        },
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
                        decoration:
                            const InputDecoration(labelText: 'Your avatar URL (logo)'),
                        onSaved: (value) => _formData['avatarUrl'] = value!,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Any Agile Framework/Method in use?'),
                        onSaved: (value) => _formData['method'] = value!,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'The organization has experience with agile?'),
                        value: hasExperienceWithAgile,
                        onChanged: (bool? value) {
                          setState(() {
                            hasExperienceWithAgile = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      Text("Agile Goals",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be strong leadership support and commitment to agile adoption and deployment?'),
                        value: hasLeadershipSupport,
                        onChanged: (bool? value) {
                          setState(() {
                            hasLeadershipSupport = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be buy-in from all stakeholders?'),
                        value: hasStakeholderMembership,
                        onChanged: (bool? value) {
                          setState(() {
                            hasStakeholderMembership = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will the budget be flexible?'),
                        value: hasFlexibleBudget,
                        onChanged: (bool? value) {
                          setState(() {
                            hasFlexibleBudget = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be an agile and fluid team structure?'),
                        value: hasAgileFluidTeamStructure,
                        onChanged: (bool? value) {
                          setState(() {
                            hasAgileFluidTeamStructure = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Should the planning event be well prepared?'),
                        value: hasWellPreparedPlanning,
                        onChanged: (bool? value) {
                          setState(() {
                            hasWellPreparedPlanning = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will the team be dedicated all the time?'),
                        value: hasDedicatedFullTimeTeam,
                        onChanged: (bool? value) {
                          setState(() {
                            hasDedicatedFullTimeTeam = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be an effective mechanism for the continuous improvement process?'),
                        value: hasEffectiveImprovementMechanism,
                        onChanged: (bool? value) {
                          setState(() {
                            hasEffectiveImprovementMechanism = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be physical proximity of agile teams?'),
                        value: hasProximityAgileTeams,
                        onChanged: (bool? value) {
                          setState(() {
                            hasProximityAgileTeams = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be different arenas for coordination over time?'),
                        value: hasDifferentArenasCoordination,
                        onChanged: (bool? value) {
                          setState(() {
                            hasDifferentArenasCoordination = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will principles be ahead of metrics?'),
                        value: hasPrinciplesAheadMetrics,
                        onChanged: (bool? value) {
                          setState(() {
                            hasPrinciplesAheadMetrics = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be a balance of agile autonomy with the need for supervision?'),
                        value: hasBalanceAutonomyNeedSupervision,
                        onChanged: (bool? value) {
                          setState(() {
                            hasBalanceAutonomyNeedSupervision = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will the process maintain transparency across a large number of fast, adaptable teams and projects?'),
                        value: hasMaintenanceTransparency,
                        onChanged: (bool? value) {
                          setState(() {
                            hasMaintenanceTransparency = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be custom ceremonies, practices, agile tools, support and support?'),
                        value: hasElementCustomization,
                        onChanged: (bool? value) {
                          setState(() {
                            hasElementCustomization = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be architectural guidelines and a dedicated architect for the group?'),
                        value: hasArchitecturalGuidelines,
                        onChanged: (bool? value) {
                          setState(() {
                            hasArchitecturalGuidelines = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be balanced use of the software' + "'" + 's internal documentation?'),
                        value: hasBalancedUseDocumentation,
                        onChanged: (bool? value) {
                          setState(() {
                            hasBalancedUseDocumentation = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will it be important to raise awareness of dependencies between teams through joint meetings?'),
                        value: hasRaiseAwarenessDependenciesBetweenTeams,
                        onChanged: (bool? value) {
                          setState(() {
                            hasRaiseAwarenessDependenciesBetweenTeams = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be a well-structured adoption approach?'),
                        value: hasWellStructuredAdoptionApproach,
                        onChanged: (bool? value) {
                          setState(() {
                            hasWellStructuredAdoptionApproach = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be standardization of agile practices among teams?'),
                        value: hasStandardizationAgilePracticesAmongTeams,
                        onChanged: (bool? value) {
                          setState(() {
                            hasStandardizationAgilePracticesAmongTeams = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be training and coaching for everyone on agile adoption?'),
                        value: hasTrainingCoachingEveryoneAgileAdoption,
                        onChanged: (bool? value) {
                          setState(() {
                            hasTrainingCoachingEveryoneAgileAdoption = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be an external coach to support the adoption of the method?'),
                        value: hasExternalCoachSupportMethodAdoption,
                        onChanged: (bool? value) {
                          setState(() {
                            hasExternalCoachSupportMethodAdoption = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be a Community of Practice for continuous improvement?'),
                        value: hasCommunityPractice,
                        onChanged: (bool? value) {
                          setState(() {
                            hasCommunityPractice = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be a shared vision?'),
                        value: hasShareCommonVision,
                        onChanged: (bool? value) {
                          setState(() {
                            hasShareCommonVision = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be involvement and engagement of people in the adoption?'),
                        value: hasPeopleInvolvementAdoption,
                        onChanged: (bool? value) {
                          setState(() {
                            hasPeopleInvolvementAdoption = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be disciplined teams?'),
                        value: hasDisciplinedTeams,
                        onChanged: (bool? value) {
                          setState(() {
                            hasDisciplinedTeams = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be trust between the teams?'),
                        value: hasTrustBetweenTeams,
                        onChanged: (bool? value) {
                          setState(() {
                            hasTrustBetweenTeams = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will information and knowledge sharing systems be well structured?'),
                        value: hasInformationSharingSystemsWellStructured,
                        onChanged: (bool? value) {
                          setState(() {
                            hasInformationSharingSystemsWellStructured = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'Will there be joint/common infrastructure?'),
                        value: hasCommonInfrastructure,
                        onChanged: (bool? value) {
                          setState(() {
                            hasCommonInfrastructure = value!;
                          });
                        },
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
                onPressed: () {
                  final isValid = _form.currentState!.validate();

                  if (isValid) {
                    _form.currentState!.save();

                    if (_formData['method'] != '') {
                      method = _formData['method']!;
                    }

                    Provider.of<Organizations>(context, listen: false).put(
                      Organization(
                        id: ' ',
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
                        hasDisciplinedTeams: hasDisciplinedTeams,
                        hasTrustBetweenTeams: hasTrustBetweenTeams,
                        hasInformationSharingSystemsWellStructured:
                            hasInformationSharingSystemsWellStructured,
                        hasCommonInfrastructure: hasCommonInfrastructure,
                      ),
                    );

                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Create'),
              ),
            ]),
      ),
    );
  }
}
