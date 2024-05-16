
view: viets {
  derived_table: {
    sql: SELECT
          sql_runner_query.f_id  AS `f_id`,
          sql_runner_query.words  AS `words`
      FROM (SELECT 1 as f_id , "[Huỷ hoặc thay đổi ngày tổ chức]" as words
                  UNION ALL
                SELECT 2 as f_id, "[Vượt ngân sách]" as words
                  UNION ALL
                SELECT 3 as f_id, "[Khách không có nhu cầu]" as words
                  UNION ALL
                SELECT  4 as f_id,"[Khách hàng | không phản hồi]" as words
                  UNION ALL
                SELECT  5 as f_id, "[Huỷ hoặc thay - đổi ngày tổ chức]" as words
                  UNION ALL
                SELECT  6 as f_id, "[I am coming home]" as words ) AS sql_runner_query
      GROUP BY
          1,
          2
      ORDER BY
          1
      LIMIT 500 ; ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: f_id {
    type: number
    sql: ${TABLE}.f_id ;;
  }

  dimension: words {
    type: string
    sql: ${TABLE}.words ;;
  }

  set: detail {
    fields: [
      f_id,
      words
    ]
  }
}
