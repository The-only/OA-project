package com.dlnu.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.dlnu.vo.Schedules;

public class ExcelUtils {

	public static InputStream writeExcel(List<Schedules> list) throws Exception {
		HSSFWorkbook hssf = new HSSFWorkbook();
		HSSFSheet sheet = hssf.createSheet("sheet");
		HSSFRow row = sheet.createRow(0);
		row.createCell(0).setCellValue("工作安排");
		row.createCell(1).setCellValue("开始时间");
		row.createCell(2).setCellValue("结束时间");
		row.createCell(3).setCellValue("安排人");
		int i = 1;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
		for (Schedules s : list) {
			HSSFRow r = sheet.createRow(i++);
			HSSFCell c1 = r.createCell(0);
			HSSFCell c2 = r.createCell(1);
			HSSFCell c3 = r.createCell(2);
			HSSFCell c4 = r.createCell(3);
			c1.setCellValue(s.getSname());
			c2.setCellValue(sdf.format(s.getStart()));
			c3.setCellValue(sdf.format(s.getEnd()));
			c4.setCellValue(s.getPlanname());

		}
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		hssf.write(baos);
		baos.flush();
		byte[] aa = baos.toByteArray();
		return new ByteArrayInputStream(aa, 0, aa.length);
	}

}
