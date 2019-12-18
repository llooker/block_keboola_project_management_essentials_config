view: task_tag {
  sql_table_name: WORKSPACE_557790397.TASK_TAG ;;

  dimension: task_snapshot_id {
    label: "Task Tag ID"
    type:  string
    sql: ${TABLE}."TASK_ID"||'_'||${TABLE}."TAG" ;;
    primary_key: yes
  }

  dimension: task_id {
    type: string
    hidden: yes
    sql: ${TABLE}."TASK_ID" ;;
  }

  dimension: tag {
    type: string
    sql: ${TABLE}."TAG" ;;
  }

  measure: count {
    label: "Tags"
    type: count
    drill_fields: [task.task_id, task.task, tag]
  }
}
