connection: "keboola_block_asana"

# include all the views
include: "/*.view"

datagroup: project_management_asana_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: project_management_asana_default_datagroup

explore: project {
  join: project_member {
    type: left_outer
    sql_on: ${project.project_id} = ${project_member.project_id} ;;
    relationship: one_to_many
  }

  join: owner {
    type: left_outer
    sql_on: ${project_member.user_id} = ${owner.user_id} ;;
    relationship: many_to_one
  }

  join: project_snapshot {
    type: left_outer
    sql_on: ${project.project_id} = ${project_snapshot.project_id} ;;
    relationship: one_to_many
  }

  join: task {
    type: left_outer
    sql_on: ${project.project_id} = ${task.project_id} ;;
    relationship: one_to_many
  }

  join: task_follower {
    type: left_outer
    sql_on: ${task.task_id} = ${task_follower.task_id} ;;
    relationship: many_to_one
  }

  join: task_tag {
    type: left_outer
    sql_on: ${task.task_id} = ${task_tag.task_id} ;;
    relationship: one_to_many
  }

  join: task_snapshot {
    type: left_outer
    sql_on: ${task.task_id} = ${task_snapshot.task_id} ;;
    relationship: one_to_many
  }
}

explore: user {
  label: "Owner/Follower"
  from: owner
}
