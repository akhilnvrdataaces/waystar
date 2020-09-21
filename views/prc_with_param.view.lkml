view: prc_with_param {

  derived_table: {
#     sql: EXEC dbo.SalesProcwithparam @category='Technology',@subcategory ='Accessories'  ;;
    datagroup_trigger: demo_sql_new_default_datagroup
    create_process: {
      sql_step: EXEC dbo.SalesProcwithparam @category='Technology',@subcategory ='Accessories'   ;;
    }
#       sql: EXEC dbo.SalesProcwithparam @category='Technology',@subcategory ='Accessories' ;;

  }

dimension: category {
  type: string
  sql: ${TABLE}.category ;;
}

dimension: subcategory {
  type: string
  sql: ${TABLE}.subcategory ;;
}
}
