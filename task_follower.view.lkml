view: task_follower {
  sql_table_name: TASK_USER ;;

  dimension: task_id {
    type: string
    hidden: yes
    sql: ${TABLE}."TASK_ID" ;;
  }

  dimension: user_id {
    type: string
    hidden: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count {
    label: "Task Followers"
    type: count
    drill_fields: [project.project, task.task, task.task_id, follower.user_id]
  }
}
