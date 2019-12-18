view: task {
  sql_table_name: WORKSPACE_557790397.TASK ;;
  drill_fields: [task_id]

  dimension: task_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."TASK_ID" ;;
  }

  dimension: assignee {
    type: string
    sql: ${TABLE}."ASSIGNEE" ;;
  }

  dimension: completed {
    type: string
    sql: ${TABLE}."COMPLETED" ;;
  }

  dimension_group: completed {
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

  dimension_group: created {
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
    datatype: date
    sql: ${TABLE}."DUE_DATE" ;;
  }

  dimension: is_subtask {
    type: string
    sql: ${TABLE}."IS_SUBTASK" ;;
  }

  dimension: project_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."PROJECT_ID" ;;
  }

  dimension: section {
    type: string
    sql: ${TABLE}."SECTION" ;;
  }

  dimension: task {
    type: string
    sql: ${TABLE}."TASK" ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}."URL" ;;
  }

  measure: count {
    type: count
    drill_fields: [task_id, project.project_id, task_snapshot.count, task_tag.count, task_user.count]
  }
}
