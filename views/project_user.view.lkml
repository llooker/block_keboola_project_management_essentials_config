view: project_user {
  sql_table_name: WORKSPACE_557790397.PROJECT_USER ;;

  dimension: project_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."PROJECT_ID" ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [project.project_id, user.user_id]
  }
}
