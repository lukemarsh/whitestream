CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: "AKIAJVDWAGT2T3PNDASA",
    aws_secret_access_key: "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"
  }
  config.fog_directory = "worldedit"
end