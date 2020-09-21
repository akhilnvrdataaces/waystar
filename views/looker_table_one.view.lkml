view: looker_table_one {
  sql_table_name: dbo.Looker_table_one ;;

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
    sql: ${TABLE}.customer ;;
  }

  dimension: orderdate {
    type: string
    sql: ${TABLE}.orderdate ;;
  }

  dimension: orderid {
    type: string
    sql: ${TABLE}.orderid ;;
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

  measure: count {
    type: count
    drill_fields: [productname]
  }
}
