{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'hash'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('teams_ab3') }}
select
    _id,
    {{ adapter.quote('name') }},
    active,
    adminuser AS admin_id,
    citycode AS province_code,
    cast({{ adapter.quote('level') }}::json->>'level' AS integer) AS current_level_value,
    {{ adapter.quote('level') }}::json->>'name' AS current_level_name,
    to_date(level::json->>'expiredAt', 'YYYY-MM-DDTHH24:MI:SSZ') AS current_level_expired_at,
    cast({{ adapter.quote('level') }}::json->>'bonusPercent' AS numeric) AS bonus_percent,
    cast({{ adapter.quote('level') }}::json->>'maximumNumberMember' AS integer) AS stats_max_member,
    cast({{ adapter.quote('statistic') }}::json->>'memberTotal' AS integer) AS stats_current_member,
    createdat AS created_at,
    updatedat AS updated_at,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_teams_hashid
from {{ ref('teams_ab3') }}
-- teams from {{ source('unibag', '_airbyte_raw_teams') }}
where 1 = 1

