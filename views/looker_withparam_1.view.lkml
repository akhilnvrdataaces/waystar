explore: looker_withparam_1  {}

view: looker_withparam_1 {

  derived_table: {
    datagroup_trigger:demo_sql_new_default_datagroup
    create_process: {

      sql_step:  CREATE TABLE ${SQL_TABLE_NAME} (
                         userid nvarchar(100),username nvarchar(100),orderid nvarchar(100),customer nvarchar(100),orderdate nvarchar(100),
                        country nvarchar(100),state nvarchar(100),productname nvarchar(100),
                        category nvarchar(100),subcategory nvarchar(100),sales int,quantity int



                       ) ;;
      sql_step: INSERT INTO ${SQL_TABLE_NAME}(userid,username,orderid,customer ,orderdate,country,state,productname
                     , category,subcategory,sales,quantity)
                       exec Looker_withparam {% parameter orderidparam  %},{% parameter Categoryparam  %},{% parameter usernameparam %}
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

  parameter: Categoryparam {
    type: string
    suggest_dimension: category
  }

  parameter: orderidparam {
    type: string

  }

  parameter: usernameparam {
    type: string

  }



























}
