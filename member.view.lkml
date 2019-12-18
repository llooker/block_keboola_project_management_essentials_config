view: owner {
  sql_table_name: WORKSPACE_557790397."USER" ;;

  dimension: user_id {
    label: "Member ID ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: user {
    label: "Member"
    type: string
    sql: ${TABLE}."USER" ;;
  }

  measure: count {
    label: "Members"
    type: count
    drill_fields: [user_id, user, project_user.count]
  }
}
