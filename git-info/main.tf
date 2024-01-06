locals {
  git_config_content = file("${path.root}/.git/config")
  remotes            = regexall("\\[remote (?:\"(?P<name>.*)\"\\]\\n.*url.*=.*(?P<url>https.*))", local.git_config_content)
}

output "remotes" {
  value = { for remote in local.remotes : replace(remote.name, "azure", "az") => remote.url }
}
