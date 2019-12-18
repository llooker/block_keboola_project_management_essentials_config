view: task_tag {
  sql_table_name: WORKSPACE_557790397.TASK_TAG ;;

  dimension: tag {
    type: string
    sql: ${TABLE}."TAG" ;;
  }

  dimension: task_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."TASK_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [task.task_id]
  }
}
