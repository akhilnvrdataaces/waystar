view: abhay_prac_params {

  parameter: categoryparam {
    type: unquoted

    suggestable: yes
    suggest_explore: salesview
    suggest_dimension: category
    full_suggestions: yes

  }


  parameter: subcategoryparam {
      type: unquoted

      suggestable: yes
      suggest_explore: salesview
      suggest_dimension: subcategory
      full_suggestions: yes

      #allowed_value: {
      #  label: "Accessories"
      #  value: "Accessories"
      #}
      #allowed_value: {
      #  label: "Bookcases"
      #  value: "Bookcases"
      #}

  }

  derived_table: {

#     sql:EXEC SalesProcwithparam @category={% parameter categoryparam %},@subcategory ={% parameter subcategoryparam %}  ;;
    # datagroup_trigger: demo_sql_new_default_datagroup
#  create_process: {
#    sql_step: EXEC dbo.SalesProcwithparam @category='{% parameter categoryparam %}',@subcategory ='{% parameter subcategoryparam %}'   ;;
#  }
#      sql: EXEC SalesProcwithparam @category='Technology',@subcategory ='Accessories' ;;

    datagroup_trigger:demo_sql_new_default_datagroup
    create_process: {
      #sql_step: @tablename VARCHAR(MAX) ;;
      sql_step:

          CREATE TABLE ${SQL_TABLE_NAME={%parameter tablenameparam%}} (
                         orderid nvarchar(100),customer nvarchar(100),orderdate nvarchar(100),
                        country nvarchar(100),state nvarchar(100),productname nvarchar(100),
                        category nvarchar(100),subcategory nvarchar(100),sales int,quantity int



                       ) ;;
      sql_step: INSERT INTO ${SQL_TABLE_NAME={%parameter tablenameparam%}(orderid,customer ,orderdate,country,state,productname
                     , category,subcategory,sales,quantity)
                       exec {%parameter databaseparam%}.dbo.SalesProcwithparam @category={% parameter categoryparam %} ,@subcategory={% parameter subcategoryparam %}
                         ;;

    }
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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
    sql: ${TABLE}.Country ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: productname {
    type: string
    sql: ${TABLE}.Productname ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}.Subcategory ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.Sales ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }


  parameter:tablenameparam {
    type: unquoted
    allowed_value: {
      label: "Table1"
      value: "Table1"
    }
    allowed_value: {
      label: "Table2"
      value: "Table2"
    }
  }
  parameter:databaseparam {
    type: unquoted
    allowed_value: {
      label: "TEST_DB_LKR"
      value: "TEST_DB_LKR"
    }
    allowed_value: {
      label: "TEST_DB_LKR1"
      value: "TEST_DB_LKR1"
    }
  }

  set: detail {
    fields: [
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
