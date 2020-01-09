view: task_snapshot {
  sql_table_name: TASK_SNAPSHOT ;;

  dimension: task_snapshot_id {
    label: "Task Snapshot ID"
    type:  string
    sql: ${TABLE}."TASK_ID"||'_'||${TABLE}."SNAPSHOT_DATE" ;;
    primary_key: yes
  }

  dimension: task_id {
    type: string
    hidden: yes
    sql: ${TABLE}."TASK_ID" ;;
  }

  dimension: assignee {
    type: string
    sql: ${TABLE}."ASSIGNEE" ;;
  }

  dimension: assignee_change {
    type: string
    sql: ${TABLE}."ASSIGNEE_CHANGE" ;;
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
    sql: ${TABLE}."PREVIOUS_DUE_DATE" ;;
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

  dimension: section {
    type: string
    sql: ${TABLE}."SECTION" ;;
  }

  dimension: previous_section {
    type: string
    sql: ${TABLE}."PREVIOUS_SECTION" ;;
  }

  dimension: section_change {
    type: string
    sql: ${TABLE}."SECTION_CHANGE" ;;
  }

  measure: count {
    label: "Task Snapshots"
    type: count
    drill_fields: [task.task_id, task.task]
  }
}
