local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-orbit') {
  settings+: {
    blog: "https://eclipse.dev/orbit",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Provides infrastructure for redistributing third-party libraries as OSGi bundles via p2 repositories.",
    discussion_source_repository: "eclipse-orbit/orbit-simrel",
    email: "orbit-dev@eclipse.org",
    has_discussions: true,
    name: "Eclipse Orbit",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      description: "Global configurations for the eclipse-orbit GitHub organization",
    },
    orgs.newRepo('ebr') {
      archived: true,
      description: "Eclipse Bundle Recipe infrastructure.",
      has_projects: false,
      has_wiki: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('orbit') {
      archived: true,
      description: "Third-party libraries bundled using Eclipse Bundle Recipes.",
      has_discussions: true,
      has_wiki: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('orbit-legacy') {
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Third-party libraries not available with source code elsewhere.",
      has_discussions: true,
      has_wiki: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('orbit-simrel') {
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Third-party libraries bundled using Maven target locations.",
      has_discussions: true,
      has_wiki: false,
      web_commit_signoff_required: false,
    },
  ],
}
