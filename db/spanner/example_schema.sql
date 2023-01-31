-- https://github.com/GoogleCloudPlatform/cloud-spanner-samples/tree/main/finance
CREATE TABLE Customer (
  CustomerId STRING(36),
  CreationTimestamp TIMESTAMP NOT NULL OPTIONS (allow_commit_timestamp=true),
  Name STRING(MAX),
  Address STRING(MAX),
) PRIMARY KEY (CustomerId);
