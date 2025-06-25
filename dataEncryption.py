import tink
from tink import aead, cleartext_keyset_handle

# Register AEAD
aead.register()

# Generate a new keyset handle with AES128_GCM template
keyset_handle = tink.new_keyset_handle(aead.aead_key_templates.AES128_GCM)

# Get AEAD primitive
aead_primitive = keyset_handle.primitive(aead.Aead)

# Sample string
plaintext = "Hello, Tink encryption demo!"
aad = b"optional-aad"

# Encrypt
ciphertext = aead_primitive.encrypt(plaintext.encode(), aad)
print("Encrypted:", ciphertext)

# Decrypt
decrypted = aead_primitive.decrypt(ciphertext, aad)
print("Decrypted:", decrypted.decode())
