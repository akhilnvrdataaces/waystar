view: sql_runner_query {
  derived_table: {
    sql: -- exec looker_withparam @orderid='AZ-2011-617423',@username='abhay',@category='Office Supplies'

            --SELECT * FROM orderbreakdown where orderid='AZ-2011-617423';

            select * from report_1

            --exec looker_withparam @username='abhay',@orderid='AZ-2011-617423',@category='Office Supplies'
             ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: userid {
    type: string
    sql: ${TABLE}.userid ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: orderid {
    type: string
    sql: ${TABLE}.Orderid ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.Customer ;;
  }

  dimension: orderdate {
    type: string
    sql: ${TABLE}.orderdate ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: productname {
    type: string
    sql: ${TABLE}.productname ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}.subcategory ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.sales ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  set: detail {
    fields: [
      userid,
      username,
      orderid,
      customer,
      orderdate,
      country,
      state,
      productname,
      category,
      subcategory,
      sales,
      quantity
    ]
  }
}
