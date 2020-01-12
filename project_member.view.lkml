view: project_member {
  sql_table_name: PROJECT_USER ;;

  dimension: project_id {
    type: string
    hidden: yes
    sql: ${TABLE}."PROJECT_ID" ;;
  }

  dimension: user_id {
    type: string
    hidden: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count {
    label: "Project Members"
    type: count
    drill_fields: [project.project_id, project.project, member.user_id]
  }
}
