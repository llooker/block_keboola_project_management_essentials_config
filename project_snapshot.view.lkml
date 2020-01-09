view: project_snapshot {
  sql_table_name: PROJECT_SNAPSHOT ;;

  dimension: project_snapshot_id {
    label: "Project Snapshot ID"
    type:  string
    sql: ${TABLE}."PROJECT_ID"||'_'||${TABLE}."SNAPSHOT_DATE" ;;
    primary_key: yes
  }

  dimension: project_id {
    type: string
    hidden: yes
    sql: ${TABLE}."PROJECT_ID" ;;
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
    datatype: date
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
    type: yesno
    sql: ${TABLE}."DUE_DATE_CHANGE" = 'true' ;;
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

  dimension: owner {
    type: string
    sql: ${TABLE}."OWNER" ;;
  }

  dimension: owner_change {
    type: yesno
    sql: ${TABLE}."OWNER_CHANGE" = 'true' ;;
  }

  dimension: previous_owner {
    type: string
    sql: ${TABLE}."PREVIOUS_OWNER" ;;
  }

  dimension: previous_status {
    type: string
    sql: ${TABLE}."PREVIOUS_STATUS" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: status_change {
    type: yesno
    sql: ${TABLE}."STATUS_CHANGE" = 'true' ;;
  }

  dimension: status_text {
    type: string
    sql: ${TABLE}."STATUS_TEXT" ;;
  }

  dimension: days_in_status_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."DAYS_IN_STATUS" ;;
  }

  dimension: days_in_previous_status_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."DAYS_IN_PREVIOUS_STATUS" ;;
  }

  measure: days_in_status {
    type: average
    sql: ${days_in_status_dimension} ;;
    value_format: "#,##0"
  }

  measure: days_in_previous_status {
    type: average
    sql: ${days_in_previous_status_dimension} ;;
    value_format: "#,##0"
  }

  measure: count {
    label: "Project Snapshots"
    type: count
    drill_fields: [project.project_id, project.project]
  }
}
