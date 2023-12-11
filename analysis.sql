SELECT 
    test_grp,
    -- Average Revenue Per User (ARPU)
    round(sum(total_purchases) / count(*), 3) as ARPU,
    -- Average Revenue Per Active User (ARPAU): Users with more than 10 correct answers
    round(sum(total_purchases) / count(total_correct) filter (where total_correct > 10), 3) as ARPAU,
    -- Conversion Rate (CR) to Purchase: Ratio of users who made a purchase
    round(count(total_purchases)::DECIMAL / count(*), 3) as CR_to_purchase,
    -- Conversion Rate (CR) of Active Users to Purchase: Users with more than 10 correct answers
    round(count(total_purchases) filter (where total_correct > 10)::DECIMAL / count(st_id) filter (where total_correct > 10), 3) as CR_of_active_user_to_purchase,
    -- Conversion Rate (CR) from Math Activity to Purchase: Users active in math (at least 2 correct math answers)
    round(count(math_purchases) filter (where math_correct >= 2)::DECIMAL / count(st_id) filter (where math_correct >= 2), 3) as CR_from_math_activity_to_purchase
FROM studs -- Main table containing student data
    -- Joining with a subquery that calculates total and math-specific correct answers
    LEFT JOIN (
        select 
            DISTINCT st_id,
            sum(correct) over (partition by st_id ORDER BY st_id) as total_correct, -- Total correct answers per student
            sum(correct) filter (where subject = 'Math') over (partition by st_id ORDER BY st_id) AS math_correct -- Total correct math answers per student
        from peas
        ) 
    using (st_id)
    -- Joining with a subquery that calculates total and math-specific money spent by each student
    LEFT JOIN (
        select 
            DISTINCT st_id,
            sum(money) over (partition by st_id ORDER BY st_id) AS total_purchases, -- Total money spent per student
            sum(money) filter (where subject = 'Math') over (partition by st_id ORDER BY st_id) AS math_purchases -- Money spent on Math per student
        from final_project_check
        )
    using (st_id) 
GROUP by test_grp -- Grouping the results by test group 
