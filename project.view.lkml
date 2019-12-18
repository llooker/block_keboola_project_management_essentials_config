view: project {
  sql_table_name: WORKSPACE_557790397.PROJECT ;;
  drill_fields: [project_id]

  dimension: project_id {
    label: "Project ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."PROJECT_ID" ;;
    html: <a href={{url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: archived {
    type: yesno
    sql: ${TABLE}."ARCHIVED" = 'true' ;;
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

  dimension: owner {
    type: string
    sql: ${TABLE}."OWNER" ;;
  }

  dimension: project {
    type: string
    sql: ${TABLE}."PROJECT" ;;
    html: <a href={{url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: public {
    type: string
    sql: ${TABLE}."PUBLIC" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: status_text {
    type: string
    sql: ${TABLE}."STATUS_TEXT" ;;
  }

  dimension: url {
    label: "URL"
    type: string
    sql: ${TABLE}."URL" ;;
  }

  dimension: workspace {
    type: string
    sql: ${TABLE}."WORKSPACE" ;;
  }

  measure: count {
    label: "Projects"
    type: count
    drill_fields: [project_id, project, project_snapshot.count, project_user.count, task.count]
  }
}
