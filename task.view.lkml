view: task {
  sql_table_name: WORKSPACE_557790397.TASK ;;

  dimension: task_id {
    label: "Task ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."TASK_ID" ;;
    html: <a href={{url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: project_id {
    type: string
    hidden: yes
    sql: ${TABLE}."PROJECT_ID" ;;
  }

  dimension: assignee {
    type: string
    sql: ${TABLE}."ASSIGNEE" ;;
  }

  dimension: completed {
    type: yesno
    sql: ${TABLE}."COMPLETED" = 'true' ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension_group: completed_at {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."COMPLETED_AT" ;;
  }

  dimension_group: due {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}."DUE_DATE" ;;
  }

  dimension: is_subtask {
    type: yesno
    sql: ${TABLE}."IS_SUBTASK" = 'true' ;;
  }

  dimension: section {
    type: string
    sql: ${TABLE}."SECTION" ;;
  }

  dimension: task {
    type: string
    sql: ${TABLE}."TASK" ;;
    html: <a href={{url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: url {
    label: "URL"
    type: string
    sql: ${TABLE}."URL" ;;
  }

  measure: count {
    label: "Tasks"
    type: count
    drill_fields: [project.project, task_id, task, task_snapshot.count, task_tag.count, task_user.count]
  }
}
