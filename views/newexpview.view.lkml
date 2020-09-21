view: newexpview {


  parameter: categoryparam {
    type: string

    suggestable: yes
    suggest_explore: salesview
    suggest_dimension: category
    full_suggestions: yes

    # allowed_value: {
    #    label: "Technology"
    #    value: "Technology"
    #  }
    #  allowed_value: {
    #    label: "Furniture"
    #    value: "Furniture"
    #  }

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




  #allowed_value: {
  #  label: "P1"
  #  value: "P1"
  #}
  #allowed_value: {
  #  label: "P2"
  #  value: "P2"
  #}
#}
 #where C_id={% parameter cidparam %} AND patientid={% parameter patientidparam %}
derived_table: {
  #sql: Select c.C_id, c.patientid,p.name as patientname,a.accounttype,c.currentbalance from Currentaccountinfo c
    #  left join personinfo p  on c.patientid=p.id left join accountinfo a on c.accountinfoid=a.id

      # ;;

  sql: select * from dbo.SalesProcwithparam(({% parameter categoryparam %}),({% parameter subcategoryparam %})) ;;
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

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}.Subcategory ;;
  }

}
