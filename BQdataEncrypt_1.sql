-- Declare and generate a key
DECLARE key BYTES;
SET key = AEAD.GENERATE_KEY('AEAD_AES_GCM_256');

-- Sample plaintext and AAD
DECLARE plaintext STRING DEFAULT 'Hello, Tink BigQuery!';
DECLARE aad STRING DEFAULT 'optional-aad';

-- Encrypt
DECLARE ciphertext BYTES;
SET ciphertext = AEAD.ENCRYPT(key, TO_BYTES(plaintext), TO_BYTES(aad));

-- Decrypt
DECLARE decrypted STRING;
SET decrypted = AEAD.DECRYPT_STRING(key, ciphertext, TO_BYTES(aad));

-- Show results
SELECT
  plaintext AS original,
  TO_HEX(ciphertext) AS encrypted_hex,
  decrypted AS decrypted_text;
