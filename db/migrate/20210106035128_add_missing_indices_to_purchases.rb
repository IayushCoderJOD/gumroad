# frozen_string_literal: true

class AddMissingIndicesToPurchases < ActiveRecord::Migration[6.0]
  def up
    execute <<~SQL
      ALTER TABLE purchases CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      add index index_purchases_on_seller_id_and_succeeded_at (seller_id, succeeded_at),
      add index index_purchases_on_seller_id_and_chargeback_date (seller_id, chargeback_date),
      add index index_purchases_on_affiliate_id_and_created_at (affiliate_id, created_at),
      MODIFY `email` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `displayed_price_currency_type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT "usd",
      MODIFY `rate_converted_to_usd` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `street_address` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `city` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `state` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `zip_code` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `country` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `full_name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `purchaser_type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT "User",
      MODIFY `session_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `ip_address` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `stripe_transaction_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `stripe_fingerprint` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `stripe_card_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `subunsub` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `referrer` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `stripe_status` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `variants` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `card_type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `card_visual` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `purchase_state` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `card_country` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `stripe_error_code` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `browser_guid` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `error_code` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `card_bin` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `custom_fields` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `ip_country` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `ip_state` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `billing_name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `billing_zip_code` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `credit_card_zipcode` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `json_data` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `card_data_handling_mode` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `charge_processor_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      MODIFY `processor_fee_cents_currency` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT "usd",
      MODIFY `paypal_order_id` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
    SQL
  end

  def down
    execute <<~SQL
      ALTER TABLE purchases CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      drop index index_purchases_on_seller_id_and_succeeded_at,
      drop index index_purchases_on_seller_id_and_chargeback_date,
      drop index index_purchases_on_affiliate_id_and_created_at,
      MODIFY `email` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `displayed_price_currency_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT "usd",
      MODIFY `rate_converted_to_usd` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `street_address` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `city` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `state` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `zip_code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `country` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `full_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `purchaser_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT "User",
      MODIFY `session_id` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `ip_address` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `stripe_transaction_id` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `stripe_fingerprint` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `stripe_card_id` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `subunsub` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `referrer` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `stripe_status` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `variants` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `card_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `card_visual` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `purchase_state` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `card_country` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `stripe_error_code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `browser_guid` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `error_code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `card_bin` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `custom_fields` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `ip_country` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `ip_state` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `billing_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `billing_zip_code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `credit_card_zipcode` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `json_data` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `card_data_handling_mode` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `charge_processor_id` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
      MODIFY `processor_fee_cents_currency` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT "usd",
      MODIFY `paypal_order_id` VARCHAR(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci
    SQL
  end
end
