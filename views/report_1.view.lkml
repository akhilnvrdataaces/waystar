view: report_1 {
   sql_table_name: Report_1 ;;


  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.Customer ;;
  }

  dimension: orderdate {
    type: string
    sql: ${TABLE}.orderdate ;;
  }

  dimension: orderid {
    type: string
    sql: ${TABLE}.Orderid ;;
  }

  dimension: productname {
    type: string
    sql: ${TABLE}.productname ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.sales ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}.subcategory ;;
  }

  dimension: userid {
    type: string
    sql: ${TABLE}.userid ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: count {
    type: count
    drill_fields: [username, productname]
  }
}
