using System;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace CEIHaryana.Model.Common.Method
{
    public static class CryptoHelper
    {
        // 32-byte AES Key
        private static readonly byte[] EncryptionKey =
            Encoding.UTF8.GetBytes("12345678901234567890123456789012");

        // 32-byte HMAC Key (Different from AES Key)
        private static readonly byte[] HmacKey =
            Encoding.UTF8.GetBytes("abcdefghijklmnopqrstuvwxyz123456");

        public static string Encrypt(string plainText)
        {
            byte[] iv = new byte[16];

            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(iv);
            }

            byte[] cipherBytes;

            using (Aes aes = Aes.Create())
            {
                aes.Key = EncryptionKey;
                aes.IV = iv;
                aes.Mode = CipherMode.CBC;
                aes.Padding = PaddingMode.PKCS7;

                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, aes.CreateEncryptor(), CryptoStreamMode.Write))
                    using (StreamWriter sw = new StreamWriter(cs))
                    {
                        sw.Write(plainText);
                    }

                    cipherBytes = ms.ToArray();
                }
            }

            // Combine IV + Cipher
            byte[] ivCipher = new byte[iv.Length + cipherBytes.Length];
            Buffer.BlockCopy(iv, 0, ivCipher, 0, iv.Length);
            Buffer.BlockCopy(cipherBytes, 0, ivCipher, iv.Length, cipherBytes.Length);

            // Create HMAC
            byte[] hmac;
            using (var hmacsha = new HMACSHA256(HmacKey))
            {
                hmac = hmacsha.ComputeHash(ivCipher);
            }

            // Final = IV + Cipher + HMAC
            byte[] finalBytes = new byte[ivCipher.Length + hmac.Length];
            Buffer.BlockCopy(ivCipher, 0, finalBytes, 0, ivCipher.Length);
            Buffer.BlockCopy(hmac, 0, finalBytes, ivCipher.Length, hmac.Length);

            return HttpServerUtility.UrlTokenEncode(finalBytes);
        }

        public static string Decrypt(string cipher)
        {
            byte[] finalBytes = HttpServerUtility.UrlTokenDecode(cipher);

            if (finalBytes == null || finalBytes.Length < 48)
                throw new CryptographicException("Invalid encrypted data.");

            // Split Data
            byte[] receivedHmac = finalBytes.Skip(finalBytes.Length - 32).ToArray();
            byte[] ivCipher = finalBytes.Take(finalBytes.Length - 32).ToArray();

            // Verify HMAC
            byte[] computedHmac;
            using (var hmacsha = new HMACSHA256(HmacKey))
            {
                computedHmac = hmacsha.ComputeHash(ivCipher);
            }

            if (!FixedTimeEquals(receivedHmac, computedHmac))
            {
                throw new CryptographicException("Invalid or tampered data.");
            }
            // Extract IV
            byte[] iv = ivCipher.Take(16).ToArray();
            byte[] cipherBytes = ivCipher.Skip(16).ToArray();

            using (Aes aes = Aes.Create())
            {
                aes.Key = EncryptionKey;
                aes.IV = iv;
                aes.Mode = CipherMode.CBC;
                aes.Padding = PaddingMode.PKCS7;

                using (MemoryStream ms = new MemoryStream(cipherBytes))
                using (CryptoStream cs = new CryptoStream(ms, aes.CreateDecryptor(), CryptoStreamMode.Read))
                using (StreamReader sr = new StreamReader(cs))
                {
                    return sr.ReadToEnd();
                }
            }
        }


        private static bool FixedTimeEquals(byte[] a, byte[] b)
        {
            if (a == null || b == null || a.Length != b.Length)
                return false;

            int diff = 0;

            for (int i = 0; i < a.Length; i++)
            {
                diff |= a[i] ^ b[i];
            }

            return diff == 0;
        }
    }
}