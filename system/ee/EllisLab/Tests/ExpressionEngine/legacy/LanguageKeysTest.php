<?php

require_once APPPATH.'helpers/directory_helper.php';

define('PASSWORD_MAX_LENGTH', 72);

class LanguageKeysTest extends \PHPUnit_Framework_TestCase {

	public function setUp()
	{
		$this->files = directory_map(BASEPATH.'language/english/', 1);
	}

	/**
	 * Recurses over a set of language files provided by directory_map
	 * @param  array $files Array from directory_map()
	 * @param  string $path Path where files are located
	 * @param  Callable $callback Method to call with the list of files,
	 *  expectes a callable with ($filename, $language_array)
	 * @return void
	 */
	private function recurseLanguageFiles($files, $path, $callback)
	{
		foreach ($files as $dir => $filename)
		{
			if (is_array($filename))
			{
				$this->recurseLanguageFiles($filename, $path.$dir.'/', $callback);
			}
			else if (strpos($filename, '.php') !== FALSE)
			{
				$callback($path.$filename);
			}
		}
	}

	/**
	 * Get language keys given a filename
	 * @param  string $filename Path to a language file
	 * @return array Array of language keys found in file, duplicates included
	 */
	private function getLanguageKeysFromFile($filename)
	{
		$lang_file = file_get_contents($filename);
		$lang_file = preg_replace('/[\'"]{2,2}\s*=\>\s*[\'"]{2,2}/i', '', $lang_file);
		$lang_file = str_replace('$lang = array(', 'array(', $lang_file);

		if (strpos($lang_file, '=>') !== FALSE)
		{
			preg_match_all("/^[ \t]*['\"](.*?)['\"]\s*=>/im", $lang_file, $keys);
		}
		else
		{
			preg_match_all('/\[[\'"](.*)[\'"]\]/i', $lang_file, $keys);
		}

		return $keys[1];
	}

	/**
	 * Test each language file to see if there are duplicate language keys
	 */
	public function testDuplicateLanguageKeys()
	{
		$this->recurseLanguageFiles(
			$this->files,
			BASEPATH.'language/english/',
			function ($filename) {
				$keys = $this->getLanguageKeysFromFile($filename);

				$failures = array();
				$keysCount = array_count_values($keys);
				foreach ($keysCount as $key => $count)
				{
					try
					{
						$message = "There are {$count} language keys for '{$key}'.";
						$this->assertEquals($count, 1, $message);
					}
					catch (PHPUnit_Framework_AssertionFailedError $e)
					{
						$failures[] = $message;
					}
				}

				if ( ! empty($failures))
				{
					echo "\n{$filename}:\n- ".implode("\n- ", $failures);
					$this->fail("{$filename} contains duplicate language keys.");
				}
			}
		);
	}

	/**
	 * Test each language file to see if there are duplicate values
	 */
	public function testDuplicateLanguageValues()
	{
		$this->markTestSkipped('Need to discuss implications of this one.');

		$this->recurseLanguageFiles(
			$this->files,
			BASEPATH.'language/english/',
			function ($filename) {
				$valuesCount = array_count_values($lang);
				foreach ($valuesCount as $value => $count)
				{
					$this->assertEquals(
						$count,
						1,
						"{$filename} contains duplicate language values for '{$value}'."
					);
				}
			}
		);
	}

	/**
	 * Test to ensure there are no duplicate language keys across all language
	 * files
	 */
	public function testDuplicateLanguageKeysAcrossFiles()
	{
		$this->markTestSkipped('Not implemented.');

		$allKeys = array();
		$this->recurseLanguageFiles(
			$this->files,
			BASEPATH.'language/english/',
			function ($filename) use (&$allKeys) {
				$keys = $this->getLanguageKeysFromFile($filename);

				foreach ($keys as $key)
				{
					$allKeys[$key][] = $filename;
				}
			}
		);

		$failures = [];
		foreach ($allKeys as $key => $files)
		{
			try
			{
				$list = implode(', ', $files);
				$message = "The language key '{$key}' was found in multiple files: {$list}.";
				$this->assertTrue((count($files) <= 1), $message);
			}
			catch (PHPUnit_Framework_AssertionFailedError $e)
			{
				$failures[] = $message;
			}
		}
		if ( ! empty($failures))
		{
			echo "\n".implode("\n\n", $failures);
			$this->fail("Duplicate language keys found across files.");
		}
	}
}
