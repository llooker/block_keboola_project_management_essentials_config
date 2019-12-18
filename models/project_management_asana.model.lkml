connection: "keboola_block_asana"

# include all the views
include: "/views/**/*.view"

datagroup: project_management_asana_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: project_management_asana_default_datagroup

explore: project {}

explore: project_snapshot {
  join: project {
    type: left_outer
    sql_on: ${project_snapshot.project_id} = ${project.project_id} ;;
    relationship: many_to_one
  }
}

explore: project_user {
  join: project {
    type: left_outer
    sql_on: ${project_user.project_id} = ${project.project_id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${project_user.user_id} = ${user.user_id} ;;
    relationship: many_to_one
  }
}

explore: task {
  join: project {
    type: left_outer
    sql_on: ${task.project_id} = ${project.project_id} ;;
    relationship: many_to_one
  }
}

explore: task_snapshot {
  join: task {
    type: left_outer
    sql_on: ${task_snapshot.task_id} = ${task.task_id} ;;
    relationship: many_to_one
  }

  join: project {
    type: left_outer
    sql_on: ${task.project_id} = ${project.project_id} ;;
    relationship: many_to_one
  }
}

explore: task_tag {
  join: task {
    type: left_outer
    sql_on: ${task_tag.task_id} = ${task.task_id} ;;
    relationship: many_to_one
  }

  join: project {
    type: left_outer
    sql_on: ${task.project_id} = ${project.project_id} ;;
    relationship: many_to_one
  }
}

explore: task_user {
  join: user {
    type: left_outer
    sql_on: ${task_user.user_id} = ${user.user_id} ;;
    relationship: many_to_one
  }

  join: task {
    type: left_outer
    sql_on: ${task_user.task_id} = ${task.task_id} ;;
    relationship: many_to_one
  }

  join: project {
    type: left_outer
    sql_on: ${task.project_id} = ${project.project_id} ;;
    relationship: many_to_one
  }
}

explore: user {}
