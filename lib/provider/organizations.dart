import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/Organization.dart';

class Organizations with ChangeNotifier {
  String? uid;

  Organizations({this.uid});

  final CollectionReference organizationsCollection =
      FirebaseFirestore.instance.collection('organizations');

  List<Organization> _orgListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Organization(
        id: doc.id,
        userId: doc['userId'] ?? ' ',
        name: doc['name'] ?? ' ',
        email: doc['email'] ?? ' ',
        cnpj: doc['cnpj'] ?? ' ',
        description: doc['description'] ?? ' ',
        sector: doc['sector'] ?? ' ',
        avatarUrl: doc['avatarUrl'] ?? ' ',
        method: doc['method'] ?? ' ',
        hasExperienceWithAgile: doc['hasExperienceWithAgile'] ?? false,
        hasLeadershipSupport: doc['hasLeadershipSupport'] ?? false,
        hasStakeholderMembership: doc['hasStakeholderMembership'] ?? false,
        hasFlexibleBudget: doc['hasFlexibleBudget'] ?? false,
        hasAgileFluidTeamStructure: doc['hasAgileFluidTeamStructure'] ?? false,
        hasWellPreparedPlanning: doc['hasWellPreparedPlanning'] ?? false,
        hasDedicatedFullTimeTeam: doc['hasDedicatedFullTimeTeam'] ?? false,
        hasEffectiveImprovementMechanism:
            doc['hasEffectiveImprovementMechanism'] ?? false,
        hasProximityAgileTeams: doc['hasProximityAgileTeams'] ?? false,
        hasDifferentArenasCoordination:
            doc['hasDifferentArenasCoordination'] ?? false,
        hasPrinciplesAheadMetrics: doc['hasPrinciplesAheadMetrics'] ?? false,
        hasBalanceAutonomyNeedSupervision:
            doc['hasBalanceAutonomyNeedSupervision'] ?? false,
        hasMaintenanceTransparency: doc['hasMaintenanceTransparency'] ?? false,
        hasElementCustomization: doc['hasElementCustomization'] ?? false,
        hasArchitecturalGuidelines: doc['hasArchitecturalGuidelines'] ?? false,
        hasBalancedUseDocumentation:
            doc['hasBalancedUseDocumentation'] ?? false,
        hasRaiseAwarenessDependenciesBetweenTeams:
            doc['hasRaiseAwarenessDependenciesBetweenTeams'] ?? false,
        hasWellStructuredAdoptionApproach:
            doc['hasWellStructuredAdoptionApproach'] ?? false,
        hasStandardizationAgilePracticesAmongTeams:
            doc['hasStandardizationAgilePracticesAmongTeams'] ?? false,
        hasTrainingCoachingEveryoneAgileAdoption:
            doc['hasTrainingCoachingEveryoneAgileAdoption'] ?? false,
        hasExternalCoachSupportMethodAdoption:
            doc['hasExternalCoachSupportMethodAdoption'] ?? false,
        hasCommunityPractice: doc['hasCommunityPractice'] ?? false,
        hasShareCommonVision: doc['hasShareCommonVision'] ?? false,
        hasPeopleInvolvementAdoption:
            doc['hasPeopleInvolvementAdoption'] ?? false,
        hasTrustBetweenTeams: doc['hasTrustBetweenTeams'] ?? false,
        hasInformationSharingSystemsWellStructured:
            doc['hasInformationSharingSystemsWellStructured'] ?? false,
        hasCommonInfrastructure: doc['hasCommonInfrastructure'] ?? false,
      );
    }).toList();
  }

  Stream<List<Organization>> get organizations {
    return organizationsCollection
        .where('userId', isEqualTo: uid)
        .snapshots()
        .map(_orgListFromSnapshot);
  }

  Future put(Organization org) async {
    if (org == null) {
      return;
    }

    if (org.id == ' ') {
      return await organizationsCollection.doc().set({
        'userId': org.userId,
        'name': org.name,
        'email': org.email,
        'cnpj': org.cnpj,
        'description': org.description,
        'sector': org.sector,
        'avatarUrl': org.avatarUrl,
        'method': org.method,
        'hasExperienceWithAgile': org.hasExperienceWithAgile,
        'hasLeadershipSupport': org.hasLeadershipSupport,
        'hasStakeholderMembership': org.hasStakeholderMembership,
        'hasFlexibleBudget': org.hasFlexibleBudget,
        'hasAgileFluidTeamStructure': org.hasAgileFluidTeamStructure,
        'hasWellPreparedPlanning': org.hasWellPreparedPlanning,
        'hasDedicatedFullTimeTeam': org.hasDedicatedFullTimeTeam,
        'hasEffectiveImprovementMechanism':
            org.hasEffectiveImprovementMechanism,
        'hasProximityAgileTeams': org.hasProximityAgileTeams,
        'hasDifferentArenasCoordination': org.hasDifferentArenasCoordination,
        'hasPrinciplesAheadMetrics': org.hasPrinciplesAheadMetrics,
        'hasBalanceAutonomyNeedSupervision':
            org.hasBalanceAutonomyNeedSupervision,
        'hasMaintenanceTransparency': org.hasMaintenanceTransparency,
        'hasElementCustomization': org.hasElementCustomization,
        'hasArchitecturalGuidelines': org.hasArchitecturalGuidelines,
        'hasBalancedUseDocumentation': org.hasBalancedUseDocumentation,
        'hasRaiseAwarenessDependenciesBetweenTeams':
            org.hasRaiseAwarenessDependenciesBetweenTeams,
        'hasWellStructuredAdoptionApproach':
            org.hasWellStructuredAdoptionApproach,
        'hasStandardizationAgilePracticesAmongTeams':
            org.hasStandardizationAgilePracticesAmongTeams,
        'hasTrainingCoachingEveryoneAgileAdoption':
            org.hasTrainingCoachingEveryoneAgileAdoption,
        'hasExternalCoachSupportMethodAdoption': org.hasExternalCoachSupportMethodAdoption,
        'hasCommunityPractice': org.hasCommunityPractice,
        'hasShareCommonVision': org.hasShareCommonVision,
        'hasPeopleInvolvementAdoption': org.hasPeopleInvolvementAdoption,
        'hasTrustBetweenTeams': org.hasTrustBetweenTeams,
        'hasInformationSharingSystemsWellStructured':
            org.hasInformationSharingSystemsWellStructured,
        'hasCommonInfrastructure': org.hasCommonInfrastructure,
      });
    } else {
      return await organizationsCollection.doc(org.id).set({
        'userId': org.userId,
        'name': org.name,
        'email': org.email,
        'cnpj': org.cnpj,
        'description': org.description,
        'sector': org.sector,
        'avatarUrl': org.avatarUrl,
        'method': org.method,
        'hasExperienceWithAgile': org.hasExperienceWithAgile,
        'hasLeadershipSupport': org.hasLeadershipSupport,
        'hasStakeholderMembership': org.hasStakeholderMembership,
        'hasFlexibleBudget': org.hasFlexibleBudget,
        'hasAgileFluidTeamStructure': org.hasAgileFluidTeamStructure,
        'hasWellPreparedPlanning': org.hasWellPreparedPlanning,
        'hasDedicatedFullTimeTeam': org.hasDedicatedFullTimeTeam,
        'hasEffectiveImprovementMechanism':
            org.hasEffectiveImprovementMechanism,
        'hasProximityAgileTeams': org.hasProximityAgileTeams,
        'hasDifferentArenasCoordination': org.hasDifferentArenasCoordination,
        'hasPrinciplesAheadMetrics': org.hasPrinciplesAheadMetrics,
        'hasBalanceAutonomyNeedSupervision':
            org.hasBalanceAutonomyNeedSupervision,
        'hasMaintenanceTransparency': org.hasMaintenanceTransparency,
        'hasElementCustomization': org.hasElementCustomization,
        'hasArchitecturalGuidelines': org.hasArchitecturalGuidelines,
        'hasBalancedUseDocumentation': org.hasBalancedUseDocumentation,
        'hasRaiseAwarenessDependenciesBetweenTeams':
            org.hasRaiseAwarenessDependenciesBetweenTeams,
        'hasWellStructuredAdoptionApproach':
            org.hasWellStructuredAdoptionApproach,
        'hasStandardizationAgilePracticesAmongTeams':
            org.hasStandardizationAgilePracticesAmongTeams,
        'hasTrainingCoachingEveryoneAgileAdoption':
            org.hasTrainingCoachingEveryoneAgileAdoption,
        'hasExternalCoachSupportMethodAdoption': org.hasExternalCoachSupportMethodAdoption,
        'hasCommunityPractice': org.hasCommunityPractice,
        'hasShareCommonVision': org.hasShareCommonVision,
        'hasPeopleInvolvementAdoption': org.hasPeopleInvolvementAdoption,
        'hasTrustBetweenTeams': org.hasTrustBetweenTeams,
        'hasInformationSharingSystemsWellStructured':
            org.hasInformationSharingSystemsWellStructured,
        'hasCommonInfrastructure': org.hasCommonInfrastructure,
      });
    }
  }

  void remove(Organization org) async {
    if (org != null && org.id != null) {
      return await organizationsCollection.doc(org.id).delete();
    }
  }
}
