	-- Step : 01.1
	/******************************************************************************
	-- Doel : Maak een nieuwe stored procedure aan spDeleteCountry
	-- ****************************************************************************
	-- Versie     Datum          Auteur			Omschrijving
	-- ******     **********     *******		**************
	-- 01         26-02-2024     RRA			Nieuw 
	*******************************************************************************/ 
	USE mvcframework;
    DROP PROCEDURE IF EXISTS spDeleteCountry;
    
    DELIMITER //
        
	CREATE PROCEDURE spDeleteCountry
	(
		 Id				        INT UNSIGNED 
	)
    
    BEGIN
    
		-- Stap_01
        -- Definieer een local variable
       
        
    	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    	BEGIN
        	ROLLBACK;
        	SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    	END;
                
		START TRANSACTION;					
			-- Stap_02
			-- Delete een record uit de country tabel.
            DELETE 
            
            FROM country as C 
            
            WHERE C.id = Id;

            COMMIT;	
	END //
        
 /*****************************************Debug SP*****************************************

	CALL spDeleteCountry  (39)	

   ********************************************************************************************/