view: task_event {
  sql_table_name: TASK_EVENT ;;
  drill_fields: [task_event_id]

  dimension: task_event_id {
    label: "Task Event ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."TASK_EVENT_ID" ;;
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

  dimension: event {
    type: string
    sql: ${TABLE}."EVENT" ;;
  }

  dimension: event_text {
    type: string
    sql: ${TABLE}."EVENT_TEXT" ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}."EVENT_TYPE" ;;
  }

  dimension: task_id {
    hidden: yes
    type: string
    sql: ${TABLE}."TASK_ID" ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}."USER" ;;
  }

  dimension: user_type {
    description: "Defines if user is employee or external person."
    type: string
    sql: ${TABLE}."USER_TYPE" ;;
  }

  dimension: user_id {
    hidden: yes
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count {
    label: "Events"
    type: count
    drill_fields: [project_task_event_user_date*]
  }

  measure: comments {
    type: count
    filters: {
      field: event
      value: "comment_added"
    }
    drill_fields: [project_task_event_user_date*]
  }

  # ----- Sets of fields for drilling ------
  set: project_task_event_user_date {
    fields: [
      project.project,
      task.task,
      event_type,
      event,
      task.assignee,
      user,
      created_at_date,
      event_text
    ]
  }
}
