$.fn.bootstrapValidator.validators.fileSieze = {
	validate : function(validator, $field, options) {
		var size = $field[0].files[0].size;
		console.info(options);
		if (size > options.size * 1024) {			
			return false;
		}
		return true;
	}
};
