add_dockerfile(
  path = "DESCRIPTION",
  output = "Dockerfile",
  pkg = get_golem_wd(),
  from = paste0("rocker/shiny:", R.Version()$major, ".", R.Version()$minor),
  as = NULL,
  port = 8081,
  host = "0.0.0.0",
  sysreqs = TRUE,
  repos = c(CRAN = "https://cran.rstudio.com/"),
  expand = FALSE,
  open = TRUE,
  update_tar_gz = TRUE,
  build_golem_from_source = TRUE,
  extra_sysreqs = NULL
)


add_dockerfile_with_renv(
  source_folder = ".",
  lockfile = NULL,
  output_dir = fs::path(".", "deploy"),
  distro = "focal",
  from = "rocker/shiny",
  as = NULL,
  sysreqs = TRUE,
  port = 8081,
  host = "0.0.0.0",
  repos = c(CRAN = "https://cran.rstudio.com/"),
  expand = FALSE,
  open = TRUE,
  document = TRUE,
  extra_sysreqs = NULL,
  update_tar_gz = TRUE,
  dockerfile_cmd = NULL,
  )






