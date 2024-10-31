# Add external Resources to the Application

golem_add_external_resources <- function(){
  add_resource_path(
    'www', app_sys('app/www')
  )
}
