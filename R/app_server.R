
app_server <- function(input, output, session) {
  
  callModule(mod_intro_server, "intro_ui_1")
  
  rv <- reactiveValues(
    comparison_summary_object = list(),
    diff_percentage = NA_real_
    
  )
  
  data_comparator_result <- callModule(mod_load_data_server, "load_data_ui_1")
  
  observeEvent(data_comparator_result$click_on_run, {
    req( data_comparator_result$click_on_run > 0 )
    rv$comparison_summary_object$frame_summary_table <- data_comparator_result$comparison_summary_object$frame.summary.table
    rv$comparison_summary_object$comparison_summary_table <- data_comparator_result$comparison_summary_object$comparison.summary.table
    rv$comparison_summary_object$vars_ns_table <- data_comparator_result$comparison_summary_object$vars.ns.table
    rv$comparison_summary_object$vars_nc_table <- data_comparator_result$comparison_summary_object$vars.nc.table
    rv$comparison_summary_object$obs_table <- data_comparator_result$comparison_summary_object$obs.table
    rv$comparison_summary_object$diffs_byvar_table <- data_comparator_result$comparison_summary_object$diffs.byvar.table
    rv$comparison_summary_object$diffs_table <- data_comparator_result$comparison_summary_object$diffs.table
    rv$comparison_summary_object$attrs_table <- data_comparator_result$comparison_summary_object$attrs.table
    rv$comparison_summary_object$diff_percentage <- data_comparator_result$comparison_summary_object$diff_percentage
    rv$click_on_run <- data_comparator_result$click_on_run
  })
  
  callModule(mod_comp_desc_server, "comp_desc_ui_1", RV = reactive(rv))
  
  callModule(mod_comp_details_server, "comp_details_ui_1", RV = reactive(rv))
}
