//
//  MockService.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 29/10/24.
//

import Foundation

struct MockData {
    static func getMockUser() -> GithubUser {
        let repositoriesJson = jsonData.data(using: .utf8) ?? Data()
        let decodedRepositories = try? JSONDecoder().decode([RepositoryInfoDTO].self, from: repositoriesJson)
        return GithubUser(dto: decodedRepositories ?? [])
    }
}


let jsonData = """
[
  {
    "id": 380278148,
    "node_id": "MDEwOlJlcG9zaXRvcnkzODAyNzgxNDg=",
    "name": "Africa",
    "full_name": "oskarko/Africa",
    "private": false,
    "owner": {
      "login": "oskarko",
      "id": 4367779,
      "node_id": "MDQ6VXNlcjQzNjc3Nzk=",
      "avatar_url": "https://avatars.githubusercontent.com/u/4367779?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/oskarko",
      "html_url": "https://github.com/oskarko",
      "followers_url": "https://api.github.com/users/oskarko/followers",
      "following_url": "https://api.github.com/users/oskarko/following{/other_user}",
      "gists_url": "https://api.github.com/users/oskarko/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/oskarko/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/oskarko/subscriptions",
      "organizations_url": "https://api.github.com/users/oskarko/orgs",
      "repos_url": "https://api.github.com/users/oskarko/repos",
      "events_url": "https://api.github.com/users/oskarko/events{/privacy}",
      "received_events_url": "https://api.github.com/users/oskarko/received_events",
      "type": "User",
      "user_view_type": "public",
      "site_admin": false
    },
    "html_url": "https://github.com/oskarko/Africa",
    "description": "Project developed with SwiftUI 2.0 + iOS 14 + Swift 5 + Generics",
    "fork": false,
    "url": "https://api.github.com/repos/oskarko/Africa",
    "forks_url": "https://api.github.com/repos/oskarko/Africa/forks",
    "keys_url": "https://api.github.com/repos/oskarko/Africa/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/oskarko/Africa/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/oskarko/Africa/teams",
    "hooks_url": "https://api.github.com/repos/oskarko/Africa/hooks",
    "issue_events_url": "https://api.github.com/repos/oskarko/Africa/issues/events{/number}",
    "events_url": "https://api.github.com/repos/oskarko/Africa/events",
    "assignees_url": "https://api.github.com/repos/oskarko/Africa/assignees{/user}",
    "branches_url": "https://api.github.com/repos/oskarko/Africa/branches{/branch}",
    "tags_url": "https://api.github.com/repos/oskarko/Africa/tags",
    "blobs_url": "https://api.github.com/repos/oskarko/Africa/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/oskarko/Africa/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/oskarko/Africa/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/oskarko/Africa/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/oskarko/Africa/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/oskarko/Africa/languages",
    "stargazers_url": "https://api.github.com/repos/oskarko/Africa/stargazers",
    "contributors_url": "https://api.github.com/repos/oskarko/Africa/contributors",
    "subscribers_url": "https://api.github.com/repos/oskarko/Africa/subscribers",
    "subscription_url": "https://api.github.com/repos/oskarko/Africa/subscription",
    "commits_url": "https://api.github.com/repos/oskarko/Africa/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/oskarko/Africa/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/oskarko/Africa/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/oskarko/Africa/issues/comments{/number}",
    "contents_url": "https://api.github.com/repos/oskarko/Africa/contents/{+path}",
    "compare_url": "https://api.github.com/repos/oskarko/Africa/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/oskarko/Africa/merges",
    "archive_url": "https://api.github.com/repos/oskarko/Africa/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/oskarko/Africa/downloads",
    "issues_url": "https://api.github.com/repos/oskarko/Africa/issues{/number}",
    "pulls_url": "https://api.github.com/repos/oskarko/Africa/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/oskarko/Africa/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/oskarko/Africa/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/oskarko/Africa/labels{/name}",
    "releases_url": "https://api.github.com/repos/oskarko/Africa/releases{/id}",
    "deployments_url": "https://api.github.com/repos/oskarko/Africa/deployments",
    "created_at": "2021-06-25T15:21:06Z",
    "updated_at": "2022-08-22T05:59:30Z",
    "pushed_at": "2021-06-28T05:50:11Z",
    "git_url": "git://github.com/oskarko/Africa.git",
    "ssh_url": "git@github.com:oskarko/Africa.git",
    "clone_url": "https://github.com/oskarko/Africa.git",
    "svn_url": "https://github.com/oskarko/Africa",
    "homepage": "",
    "size": 115110,
    "stargazers_count": 1,
    "watchers_count": 1,
    "language": "Swift",
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": false,
    "has_discussions": false,
    "forks_count": 0,
    "mirror_url": null,
    "archived": false,
    "disabled": false,
    "open_issues_count": 0,
    "license": null,
    "allow_forking": true,
    "is_template": false,
    "web_commit_signoff_required": false,
    "topics": [
      "development",
      "generics",
      "ios",
      "swift5",
      "swiftui2",
      "xcode"
    ],
    "visibility": "public",
    "forks": 0,
    "open_issues": 0,
    "watchers": 1,
    "default_branch": "main"
  },
  {
    "id": 880182584,
    "node_id": "R_kgDONHaFOA",
    "name": "AgileContent",
    "full_name": "oskarko/AgileContent",
    "private": false,
    "owner": {
      "login": "oskarko",
      "id": 4367779,
      "node_id": "MDQ6VXNlcjQzNjc3Nzk=",
      "avatar_url": "https://avatars.githubusercontent.com/u/4367779?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/oskarko",
      "html_url": "https://github.com/oskarko",
      "followers_url": "https://api.github.com/users/oskarko/followers",
      "following_url": "https://api.github.com/users/oskarko/following{/other_user}",
      "gists_url": "https://api.github.com/users/oskarko/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/oskarko/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/oskarko/subscriptions",
      "organizations_url": "https://api.github.com/users/oskarko/orgs",
      "repos_url": "https://api.github.com/users/oskarko/repos",
      "events_url": "https://api.github.com/users/oskarko/events{/privacy}",
      "received_events_url": "https://api.github.com/users/oskarko/received_events",
      "type": "User",
      "user_view_type": "public",
      "site_admin": false
    },
    "html_url": "https://github.com/oskarko/AgileContent",
    "description": "Technical test developed in UIKit",
    "fork": false,
    "url": "https://api.github.com/repos/oskarko/AgileContent",
    "forks_url": "https://api.github.com/repos/oskarko/AgileContent/forks",
    "keys_url": "https://api.github.com/repos/oskarko/AgileContent/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/oskarko/AgileContent/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/oskarko/AgileContent/teams",
    "hooks_url": "https://api.github.com/repos/oskarko/AgileContent/hooks",
    "issue_events_url": "https://api.github.com/repos/oskarko/AgileContent/issues/events{/number}",
    "events_url": "https://api.github.com/repos/oskarko/AgileContent/events",
    "assignees_url": "https://api.github.com/repos/oskarko/AgileContent/assignees{/user}",
    "branches_url": "https://api.github.com/repos/oskarko/AgileContent/branches{/branch}",
    "tags_url": "https://api.github.com/repos/oskarko/AgileContent/tags",
    "blobs_url": "https://api.github.com/repos/oskarko/AgileContent/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/oskarko/AgileContent/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/oskarko/AgileContent/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/oskarko/AgileContent/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/oskarko/AgileContent/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/oskarko/AgileContent/languages",
    "stargazers_url": "https://api.github.com/repos/oskarko/AgileContent/stargazers",
    "contributors_url": "https://api.github.com/repos/oskarko/AgileContent/contributors",
    "subscribers_url": "https://api.github.com/repos/oskarko/AgileContent/subscribers",
    "subscription_url": "https://api.github.com/repos/oskarko/AgileContent/subscription",
    "commits_url": "https://api.github.com/repos/oskarko/AgileContent/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/oskarko/AgileContent/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/oskarko/AgileContent/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/oskarko/AgileContent/issues/comments{/number}",
    "contents_url": "https://api.github.com/repos/oskarko/AgileContent/contents/{+path}",
    "compare_url": "https://api.github.com/repos/oskarko/AgileContent/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/oskarko/AgileContent/merges",
    "archive_url": "https://api.github.com/repos/oskarko/AgileContent/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/oskarko/AgileContent/downloads",
    "issues_url": "https://api.github.com/repos/oskarko/AgileContent/issues{/number}",
    "pulls_url": "https://api.github.com/repos/oskarko/AgileContent/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/oskarko/AgileContent/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/oskarko/AgileContent/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/oskarko/AgileContent/labels{/name}",
    "releases_url": "https://api.github.com/repos/oskarko/AgileContent/releases{/id}",
    "deployments_url": "https://api.github.com/repos/oskarko/AgileContent/deployments",
    "created_at": "2024-10-29T09:16:44Z",
    "updated_at": "2024-10-29T14:45:01Z",
    "pushed_at": "2024-10-29T14:44:40Z",
    "git_url": "git://github.com/oskarko/AgileContent.git",
    "ssh_url": "git@github.com:oskarko/AgileContent.git",
    "clone_url": "https://github.com/oskarko/AgileContent.git",
    "svn_url": "https://github.com/oskarko/AgileContent",
    "homepage": null,
    "size": 297,
    "stargazers_count": 0,
    "watchers_count": 0,
    "language": "Swift",
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": false,
    "has_discussions": false,
    "forks_count": 0,
    "mirror_url": null,
    "archived": false,
    "disabled": false,
    "open_issues_count": 0,
    "license": null,
    "allow_forking": true,
    "is_template": false,
    "web_commit_signoff_required": false,
    "topics": [

    ],
    "visibility": "public",
    "forks": 0,
    "open_issues": 0,
    "watchers": 0,
    "default_branch": "main"
  }
]
"""