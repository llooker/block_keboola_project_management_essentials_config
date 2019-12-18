view: task_snapshot {
  sql_table_name: WORKSPACE_557790397.TASK_SNAPSHOT ;;

  dimension: assignee {
    type: string
    sql: ${TABLE}."ASSIGNEE" ;;
  }

  dimension: assignee_change {
    type: string
    sql: ${TABLE}."ASSIGNEE_CHANGE" ;;
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

  dimension: due_date_change {
    type: string
    sql: ${TABLE}."DUE_DATE_CHANGE" ;;
  }

  dimension: due_date_diff {
    type: number
    sql: ${TABLE}."DUE_DATE_DIFF" ;;
  }

  dimension: last_day_of_month {
    type: string
    sql: ${TABLE}."LAST_DAY_OF_MONTH" ;;
  }

  dimension: last_day_of_quarter {
    type: string
    sql: ${TABLE}."LAST_DAY_OF_QUARTER" ;;
  }

  dimension: last_snapshot {
    type: string
    sql: ${TABLE}."LAST_SNAPSHOT" ;;
  }

  dimension: previous_assignee {
    type: string
    sql: ${TABLE}."PREVIOUS_ASSIGNEE" ;;
  }

  dimension_group: previous_due {
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
    sql: ${TABLE}."PREVIOUS_DUE_DATE" ;;
  }

  dimension: previous_section {
    type: string
    sql: ${TABLE}."PREVIOUS_SECTION" ;;
  }

  dimension: section {
    type: string
    sql: ${TABLE}."SECTION" ;;
  }

  dimension_group: snapshot {
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
    sql: ${TABLE}."SNAPSHOT_DATE" ;;
  }

  dimension: status_change {
    type: string
    sql: ${TABLE}."STATUS_CHANGE" ;;
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
