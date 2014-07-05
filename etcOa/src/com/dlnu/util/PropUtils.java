package com.dlnu.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.LinkedHashMap;
import java.util.Map;

public class PropUtils {
	// 使用LinkedHashMap保持顺序读取properties文件
	public static Map<String, Object> prop2Map(File file) throws IOException {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 设置读取文件的字符集为UTF-8，避免乱码
		BufferedReader br = new BufferedReader(new InputStreamReader(
				new FileInputStream(file), "UTF-8"));
		String line;
		while ((line = br.readLine()) != null) {
			String[] s = line.split("=");
			map.put(s[0], s[1]);
		}
		return map;
	}
	
}
