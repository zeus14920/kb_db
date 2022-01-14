-- 복호화 함수
CREATE OR REPLACE FUNCTION func_Decrypt (p_Encrypted_str in varchar2) RETURN VARCHAR2
AS
    v_Decrypted_str VARCHAR2(3000) :=NULL;
    v_Key VARCHAR2(16) := 'abcdefgh12345678';
BEGIN
    SYS.dbms_obfuscation_toolkit.desdecrypt
    (input_string => p_Encrypted_str,
    key_string => v_Key, decrypted_string => v_Decrypted_str);
    RETURN trim(v_Decrypted_str);
END;