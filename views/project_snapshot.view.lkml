view: project_snapshot {
  sql_table_name: WORKSPACE_557790397.PROJECT_SNAPSHOT ;;

  dimension: days_in_previous_status {
    type: number
    sql: ${TABLE}."DAYS_IN_PREVIOUS_STATUS" ;;
  }

  dimension: days_in_status {
    type: number
    sql: ${TABLE}."DAYS_IN_STATUS" ;;
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

  dimension: owner {
    type: string
    sql: ${TABLE}."OWNER" ;;
  }

  dimension: owner_change {
    type: string
    sql: ${TABLE}."OWNER_CHANGE" ;;
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

  dimension: previous_owner {
    type: string
    sql: ${TABLE}."PREVIOUS_OWNER" ;;
  }

  dimension: previous_status {
    type: string
    sql: ${TABLE}."PREVIOUS_STATUS" ;;
  }

  dimension: project_id {
    type: string
    # hidden: yes
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
    datatype: date
    sql: ${TABLE}."SNAPSHOT_DATE" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: status_change {
    type: string
    sql: ${TABLE}."STATUS_CHANGE" ;;
  }

  dimension: status_text {
    type: string
    sql: ${TABLE}."STATUS_TEXT" ;;
  }

  measure: count {
    type: count
    drill_fields: [project.project_id]
  }
}
