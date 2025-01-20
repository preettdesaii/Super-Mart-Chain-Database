/* CREATING TRIGGERS */

-- Business purpose: The TRG_STORE trigger will automatically assign a new sequential STORE_ID to the row whenever a new row is inserted in the STORE_INFO table. It will also assign appropriate values in the created by and created date
-- when a new row is created and appropriate values for modified by and modified date when a row is updated. 

CREATE OR REPLACE TRIGGER TRG_STORE
    BEFORE INSERT OR UPDATE ON STORE_INFO 
    FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            IF :NEW.STORE_ID IS NULL THEN
                :NEW.STORE_ID := SEQ_STORE_ID.NEXTVAL; 
            END IF;
            IF :NEW.CREATED_BY IS NULL THEN
                :NEW.CREATED_BY := USER; 
            END IF;
            IF :NEW.DATE_CREATED IS NULL THEN 
                :NEW.DATE_CREATED := SYSDATE;
            END IF;
        END IF;
        IF INSERTING OR UPDATING THEN 
            :NEW.MODIFIED_BY := USER; 
            :NEW.DATE_MODIFIED := SYSDATE;
        END IF; 
    END;
/

-- Business purpose: The TRG_EMPLOYEE trigger will automatically assign a new sequential EMPLOYEE_ID to the row whenever a new row is inserted in the EMPLOYEE table. It will also assign appropriate values in the created by and created date
-- when a new row is created and appropriate values for modified by and modified date when a row is updated. 

CREATE OR REPLACE TRIGGER TRG_EMPLOYEE
    BEFORE INSERT OR UPDATE ON EMPLOYEE
    FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            IF :NEW.EMPLOYEE_ID IS NULL THEN
                :NEW.EMPLOYEE_ID := SEQ_EMPLOYEE_ID.NEXTVAL; 
            END IF;
            IF :NEW.CREATED_BY IS NULL THEN
                :NEW.CREATED_BY := USER; 
            END IF;
            IF :NEW.DATE_CREATED IS NULL THEN 
                :NEW.DATE_CREATED := SYSDATE;
            END IF;
        END IF;
        IF INSERTING OR UPDATING THEN 
            :NEW.MODIFIED_BY := USER; 
            :NEW.DATE_MODIFIED := SYSDATE;
        END IF; 
    END;
/

-- Business purpose: The TRG_MANUFACTURER trigger will automatically assign a new sequential MANUFACTURER_ID to the row whenever a new row is inserted in the MANUFACTURER table. It will also assign appropriate values in the created by and created date
-- when a new row is created and appropriate values for modified by and modified date when a row is updated. 

CREATE OR REPLACE TRIGGER TRG_MANUFACTURER
    BEFORE INSERT OR UPDATE ON MANUFACTURER 
    FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            IF :NEW.MANUFACTURER_ID IS NULL THEN
                :NEW.MANUFACTURER_ID := SEQ_MANUFACTURER_ID.NEXTVAL; 
            END IF;
            IF :NEW.CREATED_BY IS NULL THEN
                :NEW.CREATED_BY := USER; 
            END IF;
            IF :NEW.DATE_CREATED IS NULL THEN 
                :NEW.DATE_CREATED := SYSDATE;
            END IF;
        END IF;
        IF INSERTING OR UPDATING THEN 
            :NEW.MODIFIED_BY := USER; 
            :NEW.DATE_MODIFIED := SYSDATE;
        END IF; 
    END;
/

-- Business purpose: The TRG_PRODUCT trigger will automatically assign a new sequential PRODUCT_ID to the row whenever a new row is inserted in the PRODUCT table. It will also assign appropriate values in the created by and created date
-- when a new row is created and appropriate values for modified by and modified date when a row is updated. 

CREATE OR REPLACE TRIGGER TRG_PRODUCT
    BEFORE INSERT OR UPDATE ON PRODUCT
    FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            IF :NEW.PRODUCT_ID IS NULL THEN
                :NEW.PRODUCT_ID := SEQ_PRODUCT_ID.NEXTVAL; 
            END IF;
            IF :NEW.CREATED_BY IS NULL THEN
                :NEW.CREATED_BY := USER; 
            END IF;
            IF :NEW.DATE_CREATED IS NULL THEN 
                :NEW.DATE_CREATED := SYSDATE;
            END IF;
        END IF;
        IF INSERTING OR UPDATING THEN 
            :NEW.MODIFIED_BY := USER; 
            :NEW.DATE_MODIFIED := SYSDATE;
        END IF; 
    END;
/

-- Business purpose: The TRG_CUSTOMER trigger will automatically assign a new sequential CUSTOMER_ID to the row whenever a new row is inserted in the CUSTOMER table. It will also assign a new MEMBERSHIP_NO to the row whenever a new row with 
-- IF_MEMBER column member as TRUE is encountered. It will also assign appropriate values in the created by and created date when a new row is created and appropriate values for modified by and modified date when a row is updated. 

CREATE OR REPLACE TRIGGER TRG_CUSTOMER
    BEFORE INSERT OR UPDATE ON CUSTOMER
    FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            IF : NEW.MEMBERSHIP_NO IS NULL THEN 
                IF : NEW.IF_MEMBER IN (1) THEN 
                    :NEW.MEMBERSHIP_NO := SEQ_REFERENCE_ID.NEXTVAL;
                END IF;
            END IF;
            IF :NEW.CREATED_BY IS NULL THEN
                :NEW.CREATED_BY := USER; 
            END IF;
            IF :NEW.DATE_CREATED IS NULL THEN 
                :NEW.DATE_CREATED := SYSDATE;
            END IF;
        END IF;
        IF INSERTING OR UPDATING THEN 
            :NEW.MODIFIED_BY := USER; 
            :NEW.DATE_MODIFIED := SYSDATE;
        END IF; 
    END;
/

-- Business purpose: The TRG_ORDER trigger will automatically assign a new sequential ORDER_ID to the row whenever a new row is inserted in the ORDER table. It will also assign a new REFERENCE_ID to the row whenever a new row with 
-- IF_ONLINE column is encountered as TRUE. It will also assign appropriate values in the created by and created date when a new row is created and appropriate values for modified by and modified date when a row is updated. 

CREATE OR REPLACE TRIGGER TRG_ORDER
    BEFORE INSERT OR UPDATE ON ALL_ORDER
    FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            IF :NEW.ORDER_ID IS NULL THEN
                :NEW.ORDER_ID := SEQ_ORDER_ID.NEXTVAL;
            END IF;
            IF : NEW.REFERENCE_ID IS NULL THEN 
                IF : NEW.IF_ONLINE IN (1) THEN 
                    :NEW.REFERENCE_ID := SEQ_REFERENCE_ID.NEXTVAL;
                END IF;
            END IF;
            IF :NEW.CREATED_BY IS NULL THEN
                :NEW.CREATED_BY := USER; 
            END IF;
            IF :NEW.DATE_CREATED IS NULL THEN 
                :NEW.DATE_CREATED := SYSDATE;
            END IF;
        END IF;
        IF INSERTING OR UPDATING THEN
            :NEW.MODIFIED_BY := USER; 
            :NEW.DATE_MODIFIED := SYSDATE;
        END IF; 
    END;
/
-- Business purpose: The TRG_PAYMENT trigger will automatically assign a new sequential PAYMENT_ID to the row whenever a new row is inserted in the PAYMENT table. It will also assign appropriate values in the created by and created date
-- when a new row is created and appropriate values for modified by and modified date when a row is updated. 


CREATE OR REPLACE TRIGGER TRG_PAYMENT
    BEFORE INSERT OR UPDATE ON PAYMENT_INFO
    FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            IF :NEW.PAYMENT_ID IS NULL THEN
                :NEW.PAYMENT_ID := SEQ_PAYMENT_ID.NEXTVAL; 
            END IF;
            IF :NEW.CREATED_BY IS NULL THEN
                :NEW.CREATED_BY := USER; 
            END IF;
            IF :NEW.DATE_CREATED IS NULL THEN 
                :NEW.DATE_CREATED := SYSDATE;
            END IF;
        END IF;
        IF INSERTING OR UPDATING THEN 
            :NEW.MODIFIED_BY := USER; 
            :NEW.DATE_MODIFIED := SYSDATE;
        END IF; 
    END;
/

-- Business purpose: The TRG_SHIPMENT trigger will automatically assign a new sequential SHIPMENT_ID to the row whenever a new row is inserted in the SHIPMENT table. It will also assign appropriate values in the created by and created date
-- when a new row is created and appropriate values for modified by and modified date when a row is updated. 

CREATE OR REPLACE TRIGGER TRG_SHIPMENT
    BEFORE INSERT OR UPDATE ON SHIPMENT
    FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            IF :NEW.SHIPMENT_ID IS NULL THEN
                :NEW.SHIPMENT_ID := SEQ_SHIPMENT_ID.NEXTVAL; 
            END IF;
            IF :NEW.CREATED_BY IS NULL THEN
                :NEW.CREATED_BY := USER; 
            END IF;
            IF :NEW.DATE_CREATED IS NULL THEN 
                :NEW.DATE_CREATED := SYSDATE;
            END IF;
        END IF;
        IF INSERTING OR UPDATING THEN 
            :NEW.MODIFIED_BY := USER; 
            :NEW.DATE_MODIFIED := SYSDATE;
        END IF; 
    END;
/