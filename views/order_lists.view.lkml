explore: order_lists{}

view: order_lists {
  sql_table_name: dbo.OrderLists ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
    drill_fields: [country,state]
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.Customer ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.OrderId ;;
  }

  dimension: orderdate {
    type: string
    sql: ${TABLE}.Orderdate ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
