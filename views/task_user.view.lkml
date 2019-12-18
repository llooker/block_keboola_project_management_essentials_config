view: task_user {
  sql_table_name: WORKSPACE_557790397.TASK_USER ;;

  dimension: task_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."TASK_ID" ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [user.user_id, task.task_id]
  }
}
