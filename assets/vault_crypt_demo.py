import json
import oci
import base64

f = open("/tmp/vault_access.json")
data = json.load(f)
f.close()

### OCI setup
vault_endpoint = data['crypto_endpoint']
vault_key_ocid = data['crypto_key_ocid']
signer = oci.auth.signers.InstancePrincipalsSecurityTokenSigner()
kms = oci.key_management.KmsCryptoClient(config={}, 
                                        signer=signer, 
                                        service_endpoint=vault_endpoint)

### input text
text = input("enter text:\n")
print(f"text: {text}")

### encode base64
text_bytes = text.encode('ascii')
base64_bytes = base64.b64encode(text_bytes)
base64_text_encoded = base64_bytes.decode('ascii')
print(f"base64_text_encoded: {base64_text_encoded}")

### encrypt OCI
encrypt_details = oci.key_management.models.EncryptDataDetails(key_id=vault_key_ocid, plaintext=base64_text_encoded)
response = kms.encrypt(encrypt_details)
cipher = response.data.ciphertext
print(f"cipher: {cipher}")

### decrypt OCI
decrypt_data_details = oci.key_management.models.DecryptDataDetails(key_id=vault_key_ocid, ciphertext=cipher)
response = kms.decrypt(decrypt_data_details)
cipher_decrypted = response.data.plaintext
print(f"cipher_decrypted: {cipher_decrypted}")

### decode base64
base64_message = cipher_decrypted
base64_bytes = base64_message.encode('ascii')
message_bytes = base64.b64decode(base64_bytes)
base64_text_decoded = message_bytes.decode('ascii')
print(f"base64_text_decoded: {base64_text_decoded}")