view: task {
  sql_table_name: TASK ;;

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

  dimension: assignee_type {
    description: "Defines if assignee is employee or external person."
    type: string
    sql: ${TABLE}."ASSIGNEE_TYPE" ;;
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

  dimension: is_past_due {
    type: yesno
    sql:  ${TABLE}."IS_PAST_DUE" = 'true' ;;
  }

  dimension: days_past_due_dimension {
    hidden: yes
    type: number
    sql:  ${TABLE}."DAYS_PAST_DUE" ;;
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

  measure: days_past_due {
    type: average
    sql:  ${TABLE}."DAYS_PAST_DUE" ;;
    value_format: "#,##0"
  }

  measure: count {
    label: "Tasks"
    type: count
    drill_fields: [project.project, task_id, task, days_past_due, task_snapshot.count, task_tag.count, task_user.count]
  }
}
