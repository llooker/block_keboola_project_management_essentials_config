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

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: email_domain {
    type: string
    sql: ${TABLE}."EMAIL_DOMAIN" ;;
  }

  dimension: user_type {
    description: "Defines if user is employee or external person."
    type: string
    sql: ${TABLE}."USER_TYPE" ;;
  }

  measure: count {
    label: "Followers"
    type: count
    drill_fields: [user_id, user, task_user.count]
  }
}
