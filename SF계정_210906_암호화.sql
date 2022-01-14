-- 암호화 함수
CREATE OR REPLACE FUNCTION func_Encrypt (p_Input_str in varchar2) RETURN VARCHAR2
AS
    v_Input_len NUMBER := ROUND(LENGTH(p_input_str)/8+0.5)*8;
    v_Encrypted_str VARCHAR2(2000) :=NULL;
    v_Key VARCHAR2(16) := 'abcdefgh12345678';
BEGIN
    SYS.dbms_obfuscation_toolkit.desencrypt
    (input_string =>RPAD(p_Input_str, v_Input_len),
    key_string => v_Key, encrypted_string => v_Encrypted_str);
    RETURN v_encrypted_str;
END;