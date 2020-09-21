connection: "mysql-server"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
datagroup: demo_sql_new_default_datagroup {
  sql_trigger: SELECT DISTINCT username,orderid,category FROM report_1;;
#    max_cache_age: "1 second"
}
# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore:  sql_runner_query{
  view_name: sql_runner_query
#   persist_with: demo_sql_new_default_datagroup
}

explore: looker_withparam {
  view_name: looker_withparam
#   persist_with: demo_sql_new_default_datagroup
}

explore: report_1 {
  view_name: report_1
#    persist_with: demo_sql_new_default_datagroup
#   persist_for:"1 second"
}




explore:  looker_table_one{
}

explore: looker_table_proc_1 {
  view_name: looker_table_proc
  }

explore: prc_with_param {
  view_name: prc_with_param
}

explore: abhay_exp_view_params {
  view_name: abhay_exp_view_params
}


explore: abhay_prac_params {
  view_name: abhay_prac_params
}

explore: newexpview {
  view_name: newexpview
}


explore: personinfo {
  view_name: personinfo
}
