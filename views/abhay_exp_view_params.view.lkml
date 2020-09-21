view: abhay_exp_view_params {
  #sql_table_name: {% parameter tablename %};;


  parameter: tablename {
    type: unquoted
    allowed_value: {
      label: "UK"
      value: "00001.ga_sessions"
    }
    allowed_value: {
      label: "Germany"
      value: "00002.ga_sessions"
    }
  }




  parameter: orderid {
    type: number

    suggestable: yes
    suggest_explore: salesview
    suggest_dimension: orderdate
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

          CREATE TABLE ${SQL_TABLE_NAME} (
                         orderid nvarchar(100),customer nvarchar(100),orderdate nvarchar(100),
                        country nvarchar(100),state nvarchar(100),productname nvarchar(100),
                        category nvarchar(100),subcategory nvarchar(100),sales int,quantity int



                       ) ;;
      sql_step: INSERT INTO ${SQL_TABLE_NAME}(orderid,customer ,orderdate,country,state,productname
                     , category,subcategory,sales,quantity)
                       exec SalesProcwithparamone @category={% parameter categoryparam %} ,@subcategory={% parameter subcategoryparam %}
                         ;;
    }
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
    sql: ${TABLE}.category ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}.subcategory ;;
  }


}
