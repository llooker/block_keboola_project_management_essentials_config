view: follower {
  sql_table_name: "USER" ;;

  dimension: user_id {
    label: "Follower ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: user {
    label: "Follower"
    type: string
    sql: ${TABLE}."USER" ;;
  }

  measure: count {
    label: "Followers"
    type: count
    drill_fields: [user_id, user, task_user.count]
  }
}
