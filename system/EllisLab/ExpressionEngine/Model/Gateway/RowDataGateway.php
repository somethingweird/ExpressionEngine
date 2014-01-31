<?PHP
namespace EllisLab\ExpressionEngine\Model\Gateway;

use EllisLab\ExpressionEngine\Core\Dependencies;
use EllisLab\ExpressionEngine\Core\Validation\Validator;
use EllisLab\ExpressionEngine\Core\Validation\Error\ValidationError;

use EllisLab\ExpressionEngine\Model\Error\Errors;


/**
 * Helper function to list fields. We need to be
 * able to get all publicly declared fields. This
 * is the easiest way I can think of.
 */
function getFieldList($class)
{
	return get_class_vars($class);
}

/**
 * Base Gateway Class
 *
 * This is the base class for all database table Gateways in ExpressionEngine.
 * It provides basic CRUD operations against a single database table.  An
 * instance of an Gateway represents a single row in the represented table. It
 * tracks which properties are "dirty" (have been changed since loading) and
 * only validates/saves those properties that are dirty.
 */
abstract class RowDataGateway {
	/**
	 * Dependency injection container.
	 */
	private $di = NULL;

	/**
	 * Meta data array, overridden by subclasses.
	 */
	protected static $meta = array();

	/**
	 * Array to track which properties have been modified, so that we
	 * only save or validate those that need it.
	 */
	protected $dirty = array();

	/**
	 * Construct an gateway.  Initialize it with the Depdency Injection object
	 * and, optionally, with an array of data from the database.
	 *
	 * @param	Dependencies	$di	The dependency injection object to use for
	 * 		this instance of an Gateway.
	 * @param	mixed[]	$data	(Optional.) An array of data to be used to
	 * 		initialize the Gateway's public properties.  Of the form
	 * 		'property_name' => 'value'.
	 */
	public function __construct(Dependencies $di, array $data = array())
	{
		$this->di = $di;

		foreach ($data as $property => $value)
		{
			if (property_exists($this, $property))
			{
				$this->{$property} = $value;
			}
		}
	}

	/**
	 * Get Meta Data
	 *
	 * Get a piece of meta data on this gateway.  If no key is given, then all
	 * meta data is returned.  The meta data available is:
	 *
	 * 	table_name			string	-  The name of the database table that is
	 * 		linked to this gateway.  Is returned as a single string.
	 * 	primary_key			string  - The name of the primary key of the linked
	 * 		table.
	 * 	related_gateways	mixed[] - Information on all gateways that have
	 * 		some sort of relationship to this gateway.  Returned as an array of
	 * 		the form:
	 * 			'this_gateways_key' => array(
	 * 				'gateway' => 'GatewayName',
	 * 				'key' => 'related_gateways_key',
	 * 				'pivot_table' => 'pivot_table_name',
	 * 				'pivot_key' => 'this_gateways_key_in_pivot_table'
	 * 				'pivot_foreign_key' => 'related_gateways_key_in_pivot_table'
	 * 			)
	 * 	validation_rules	mixed[] - Validation rules assigned to each
	 * 		property of this gateway.  Returned as an array of
	 * 		property => rule string pairs.  Where a rule string is a pipe
	 * 		separated list of rule names.
	 *
	 * @param	mixed	$key	Which piece of meta data do you want? Available
	 * 				values are 'table_name', 'primary_key', 'related_gateways'
	 * 				and 'validation_rules'.
	 *
	 * @return	mixed[]|mixed	The requested meta data.
	 */
	public static function getMetaData($key = NULL)
	{
		if ($key === 'field_list')
		{
			return getFieldList(get_called_class());
		}

		if (empty(static::$meta))
		{
			throw new \UnderflowException('No meta data set for this gateway!');
		}

		if ( ! isset($key))
		{
			return static::$meta;
		}

		if( ! isset (static::$meta[$key]))
		{
			return NULL;
		}

		return static::$meta[$key];
	}

	/**
	 * Mark a Property as Dirty
	 *
	 * Marks a property on this gateway as having been modified and needing
	 * validation on saving.  If Gateway::save() is called, the property will
	 * be validated and any validation errors will result in an exception
	 * being thrown.
	 *
	 * @param	string	$property	The name of the property which is dirty.
	 * 		Must be a valid property defined on the gateway.
	 *
	 * @return void
	 */
	public function setDirty($property)
	{
		$this->dirty[$property] = TRUE;
		return $this;
	}

	/**
	 * Validate the Gateway
	 *
	 * Vaildate the gateway prior to saving based on validation rules set on
	 * the {$property}_validation properties.
	 *
	 * @return	Errors 	An object containing any errors generated by failed
	 * 				validation.  If no errors were generated, then
	 * 				Errors::hasErrors() will return false.
	 */
	public function validate()
	{
		$errors = new Errors();

		// Nothing to validate!
		if (empty($this->dirty))
		{
			return $errors;
		}

		$validation_rules = static::getMetaData('validation_rules');
		// Nothing to validate.
		if ($validation_rules === NULL)
		{
			return $errors;
		}

		foreach ($this->dirty as $property => $dirty)
		{
			if (isset($validation_rules[$property]))
			{
				$validator = $this->di->getValidation()->getValidator();
				if ( ! $validator->validate($validation_rules[$property], $this->$property))
				{
					foreach ($validator->getFailedRules() as $rule)
					{
						$errors->addError(new ValidationError($property, $rule));
					}
				}
			}
		}

		return $errors;
	}

	/**
	 * Save this Gateway
	 *
	 * Saves this Gateway to the database.  The Gateway represents a single row
	 * in its database table, and saving will result in it either being
	 * updated or inserted depending on whether its primary_key has been set.
	 *
	 * @throws Exception	If validation fails, then an Exception will be
	 * 		thrown.
	 *
	 * @return void
	 */
	public function save()
	{
		// Nothing to save!
		if (empty($this->dirty))
		{
			return;
		}

		$save_array = array();
		foreach ($this->dirty as $property => $dirty)
		{
			$save_array[$property] = $this->{$property};
		}

		$id_name = static::getMetaData('primary_key');
		if (isset($this->{$id_name}))
		{
			ee()->db->where($id_name, $this->{$id_name});
			ee()->db->update(static::getMetaData('table_name'), $save_array);
		}
		else
		{
			ee()->db->insert(static::getMetaData('table_name'), $save_array);
		}
	}

	/**
	 *  Like save, but always insert so that we can restore from
	 *  a database backup.
	 */
	public function restore()
	{
		// Nothing to save!
		if (empty($this->dirty))
		{
			return;
		}

		$save_array = array();
		foreach ($this->dirty as $property => $dirty)
		{
			$save_array[$property] = $this->{$property};
		}

		$id_name = static::getMetaData('primary_key');
		ee()->db->insert(static::getMetaData('table_name'), $save_array);
	}
	
	/**
	 *
	 */
	public function delete()
	{
		$primary_key = static::getMetaData('primary_key');
		if ( ! isset($this->{$primary_key}))
		{
			throw new ModelException('Attempt to delete an Gateway with out an attached ID!');
		}

		ee()->db->delete(
			static::getMetaData('table_name'),
			array($primary_key => $this->{$primary_key})
		);
	}

}
