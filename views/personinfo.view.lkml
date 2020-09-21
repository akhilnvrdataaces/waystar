view: personinfo{
  sql_table_name: Personinfo ;;


  dimension: patientid{
    type: string
    primary_key: yes
    sql: ${TABLE}.id;;
  }

  dimension: name {
  type: string
  sql: ${TABLE}.Name ;;
  }


}
