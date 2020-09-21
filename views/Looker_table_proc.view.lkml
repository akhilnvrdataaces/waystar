explore: looker_table_proc {}

view: looker_table_proc {






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
                       exec salesProcwithparamone {% parameter orderid %}
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





      parameter: orderidparam {

        type: string

        suggest_explore: looker_table_one
        suggest_dimension: orderid
        full_suggestions: yes

      }













    }
