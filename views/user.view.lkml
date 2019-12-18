view: user {
  sql_table_name: WORKSPACE_557790397."USER" ;;
  drill_fields: [user_id]

  dimension: user_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}."USER" ;;
  }

  measure: count {
    type: count
    drill_fields: [user_id, project_user.count, task_user.count]
  }
}
