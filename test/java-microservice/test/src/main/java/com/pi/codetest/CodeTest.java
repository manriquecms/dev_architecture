package com.pi.codetest;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public class CodeTest {

	/**
	 * Code test required functionality
	 * @param strings 
	 * @return
	 */
	public static String mix(String... strings) {
		StringBuilder result = new StringBuilder();
		Set<Character> diffChars = new HashSet<>();
		List<Map<Character, Integer>> listOfCounts = new ArrayList<>();

		// Get the characters counted by string
		Arrays.asList(strings).stream().forEach(s -> listOfCounts.add(countCharacters(s)));
		// Get the different characters
		listOfCounts.stream().forEach(m -> diffChars.addAll(m.keySet()));

		for (Character c : diffChars) {
			// compare the base char with a list created with the count of the char in every String
			// that "count" would be zero if is not present
			String resultForChar = compareChars(c,
					listOfCounts.stream().map(i -> i.get(c) != null ? i.get(c) : 0).collect(Collectors.toList()));
			if(resultForChar.length()>0) {
				result.append(result.length()==0?"":"/").append(resultForChar);	
			}
		}
		
		//I forgot to take present the order, so I finally order the response
		
		return Arrays.asList(result.toString().split("/")).stream().sorted((x,y) -> {
			if(x.split(":")[1].length()>y.split(":")[1].length()) {
				return -1;
			}else if (x.split(":")[1].length()==y.split(":")[1].length()) {
				return x.compareTo(y);
			} else {
				return 1;
			}
		}).collect(Collectors.joining("/"));
		
	}

	/**
	 * Count every char in the string, and returns a Map with the <char, count>
	 * 
	 * @param string
	 *            - The string
	 * @return
	 */
	public static Map<Character, Integer> countCharacters(String string) {
		Map<Character, Integer> map = new HashMap<>();
		string.chars().filter(i -> new Character((char) i).toString().matches("[a-z]+"))
				.forEach(i -> map.merge((char) i, 1, (x, y) -> (x + y)));

		return map;
	}

	/**
	 * Get the output format required
	 * 
	 * @param base
	 *            - Base character
	 * @param counts
	 *            - List of "counts" for every String
	 * @return
	 */
	public static String compareChars(Character base, List<Integer> counts) {
		StringBuilder result = new StringBuilder();
		// First get the max value
		int maxValue = counts.stream().reduce(Integer::max).get();
		// Only if the maxValue is greater than 1, iterate over the list to get the
		// position/s of the maxValue
		if (maxValue > 1) {
			List<Integer> listOfIndex = new ArrayList<>();
			for (int i = 0; i < counts.size(); i++) {
				// Save the found index (incremented by one) that contains the maxValue
				if (counts.get(i) == maxValue) {
					listOfIndex.add(i + 1);
				}
			}

			// if the strings list size is equals to 2, and both are maxValue, then =
			// character
			if (listOfIndex.size() == 2 && counts.size() == 2) {
				result.append("=");
			} else {
				result.append(listOfIndex.stream().map(i -> i.toString()).collect(Collectors.joining(",")));
			}
			// Add the : character and the sequence
			result.append(":")
					.append(Collections.nCopies(maxValue, base.toString()).stream().collect(Collectors.joining("")));
		}

		return result.toString();
	}
}