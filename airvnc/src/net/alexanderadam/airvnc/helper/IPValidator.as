package net.alexanderadam.airvnc.helper
{
	import mx.validators.Validator;
    import mx.validators.ValidationResult;


	public class IPValidator extends Validator
	{
		// Define Array for the return value of doValidation().
        private var results:Array;
        // Constructor.
        public function IPValidator() {
            // Call base class constructor. 
            super();
        }
    
        // Define the doValidation() method.
        override protected function doValidation(value:Object):Array {
            // Clear results Array.
            results = [];
            // Call base class doValidation().
            results = super.doValidation(value);        
            // Return if there are errors.
            if (results.length > 0)
                return results;
                
            if (String(value).length == 0)
             return results;
        
           var pattern:RegExp = /\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/;
     		var r:Array = pattern.exec(String(value));
		   if (r == null)
		   {
		    results.push(new ValidationResult(true, null, "NaN", 
		                    "You must enter an IP Address"));
		                return results;
		   }
		             return results;
        }
    }

		
}