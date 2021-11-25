{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'hash'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('event_rewards_ab3') }}
select
    _id,
    cash,
    {{ adapter.quote('type') }},
    status,
    {{ adapter.quote('options') }}::json->'referral' AS option_referral,
    {{ adapter.quote('options') }}::json->'invitee' AS option_invitee,
    {{ adapter.quote('options') }}::json->'order' AS option_order,
    {{ adapter.quote('options') }}::json->'percent' AS option_percent,
    {{ adapter.quote('options') }}::json->'minOrderToClaim' AS option_min_order_to_claim,
    {{ adapter.quote('options') }}::json->'minOrderValue' AS option_min_order_value,
    {{ adapter.quote('options') }}::json->'userEventQuest' AS option_event_quest,
    {{ adapter.quote('user') }} AS seller_id,
    {{ adapter.quote('event') }} AS event_id,
    createdat AS created_at,
    updatedat AS updated_at,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_event_rewards_hashid
from {{ ref('event_rewards_ab3') }}
-- event_rewards from {{ source('unibag', '_airbyte_raw_event_rewards') }}
where 1 = 1
