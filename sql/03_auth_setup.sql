-- =============================================
-- CHARTER - Authentication Setup
-- 03_auth_setup.sql
-- =============================================

-- 1. CHARTER USERS TABLE
CREATE TABLE CHARTER_USERS (
    User_ID NUMBER GENERATED ALWAYS AS IDENTITY,
    Username VARCHAR2(50) NOT NULL,
    Password VARCHAR2(50) NOT NULL,
    Role VARCHAR2(50) NOT NULL,
    PRIMARY KEY (User_ID),
    UNIQUE (Username),
    CONSTRAINT chk_user_role CHECK (
        Role IN ('ADMIN', 'PRESIDENT', 'MEMBER', 'ADVISOR')
    )
);

-- 2. INSERT USERS
INSERT INTO CHARTER_USERS (Username, Password, Role)
VALUES ('admin', 'admin123', 'ADMIN');

INSERT INTO CHARTER_USERS (Username, Password, Role)
VALUES ('president', 'president123', 'PRESIDENT');

INSERT INTO CHARTER_USERS (Username, Password, Role)
VALUES ('member', 'member123', 'MEMBER');

INSERT INTO CHARTER_USERS (Username, Password, Role)
VALUES ('advisor', 'advisor123', 'ADVISOR');

COMMIT;

-- 3. AUTHENTICATION FUNCTION
CREATE OR REPLACE FUNCTION CHARTER_AUTH (
    p_username IN VARCHAR2,
    p_password IN VARCHAR2
) RETURN BOOLEAN AS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM CHARTER_USERS
    WHERE UPPER(Username) = UPPER(p_username)
    AND Password = p_password;

    RETURN v_count > 0;
END;
/

-- 4. ROLE FETCH FUNCTION
CREATE OR REPLACE FUNCTION CHARTER_GET_ROLE (
    p_username IN VARCHAR2
) RETURN VARCHAR2 AS
    v_role VARCHAR2(50);
BEGIN
    SELECT Role INTO v_role
    FROM CHARTER_USERS
    WHERE UPPER(Username) = UPPER(p_username);

    RETURN v_role;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

-- 5. POST LOGIN PROCEDURE
CREATE OR REPLACE PROCEDURE CHARTER_SET_ROLE AS
    v_role VARCHAR2(50);
BEGIN
    SELECT Role INTO v_role
    FROM CHARTER_USERS
    WHERE UPPER(Username) = UPPER(V('APP_USER'));

    APEX_UTIL.SET_SESSION_STATE(
        p_name  => 'APP_USER_ROLE',
        p_value => v_role
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        APEX_UTIL.SET_SESSION_STATE(
            p_name  => 'APP_USER_ROLE',
            p_value => NULL
        );
END;
/