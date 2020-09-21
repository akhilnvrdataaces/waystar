explore: salesview {

  #access_filter: {

  #  field: salesview.category
   # user_attribute: user_category

 # }


}


view: salesview {
  sql_table_name: dbo.Salesview ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
    drill_fields: [state,productname]  }

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
    sql: ${TABLE}.Productname ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.Sales ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}.Subcategory ;;
  }

  measure: count {
    type: count
    drill_fields: [productname]
  }
}
