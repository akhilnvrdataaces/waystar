view: looker_withparam {
  derived_table: {
    datagroup_trigger:demo_sql_new_default_datagroup

#     persist_for: "1 day"
    create_process: {

      sql_step: CREATE TABLE ${SQL_TABLE_NAME} (
                        userid nvarchar(100) ,username nvarchar(100),
            Orderid nvarchar(100) ,Customer nvarchar(100) ,orderdate nvarchar(100),
                        country nvarchar(100),state nvarchar(100),productname nvarchar(100),
                        category nvarchar(100),subcategory nvarchar(100),sales int,quantity int) ;;

        sql_step: INSERT INTO ${SQL_TABLE_NAME}(
                        userid ,username ,Orderid  ,Customer ,orderdate,
                        country ,state ,productname,category ,subcategory ,sales
                        ,quantity )
                        exec Looker_withparam
                         @orderid={% parameter orderid_param %},
                        @category={% parameter category_param %},
                        @username={% parameter username_param %}
                      --    {% parameter orderid_param %},
                      --  {% parameter category_param %},
                      --  {% parameter username_param %}
                        ;;
      }
    }

#   -------------parameters------------ #
    parameter:  orderid_param{
      type: string
    }

    parameter: category_param{
      type: string
    }

    parameter:  username_param{
      type: string
    }

# ------------------dimensions--------------------- #
    dimension: orderid {
      type: string
      sql: ${TABLE}.orderid ;;
    }

    dimension:category{
      type: string
      sql: ${TABLE}.category ;;
    }

    dimension: username {
      type: string
      sql: ${TABLE}.username ;;
    }

    dimension: productname{
      type: string
      sql: ${TABLE}.productname ;;
    }

  }
