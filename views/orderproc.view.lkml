
explore:orderproc  {}
view: orderproc {


  derived_table: {
    datagroup_trigger:demo_sql_new_default_datagroup
    create_process: {

      sql_step:  CREATE TABLE ${SQL_TABLE_NAME} (
                         orderid nvarchar(100),customer nvarchar(100),orderdate nvarchar(100),
                        country nvarchar(100),state nvarchar(100),productname nvarchar(100),
                        category nvarchar(100),subcategory nvarchar(100),sales int,quantity int



                       ) ;;
      sql_step: INSERT INTO ${SQL_TABLE_NAME}(orderid,customer ,orderdate,country,state,productname
                     , category,subcategory,sales,quantity)
                       exec SalesProcwithparam @category='Furniture' ,@subcategory='Bookcases'
                         ;;
    }
  }

  dimension: orderid {
    type: string
    primary_key: yes
    sql: ${TABLE}.orderid ;;
  }

  dimension: customer {
    type: string

    sql: ${TABLE}.customer;;}

    dimension: orderdate {
      type: string

      sql: ${TABLE}.orderdate;;}

  dimension: country {
    type: string

    sql: ${TABLE}.country;;
  }
      dimension: state {
        type: string

        sql: ${TABLE}.state;;
      }
      dimension: productname {
        type: string

        sql: ${TABLE}.productname;;
      }
      dimension: category {
        type: string

        sql: ${TABLE}.category;;
      }
      dimension: subcategory {
        type: string

        sql: ${TABLE}.subcategory;;
      }

  dimension: sales {
    type: number

    sql: ${TABLE}.sales ;;
  }

      dimension: quantity {
        type: number

        sql: ${TABLE}.quantity ;;
      }
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: orderstoredproc {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
