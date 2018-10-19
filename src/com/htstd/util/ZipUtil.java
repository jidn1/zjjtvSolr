package com.htstd.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.charset.Charset;
import java.util.zip.ZipOutputStream;

import org.apache.log4j.Logger;

public class ZipUtil
{
	private static final Logger logger = Logger.getLogger(ZipUtil.class);
    public ZipUtil()
    {}

    /**
     * 指定多个文件压缩成一文件
     * 
     * @param zipFileName
     *            要打包的文件或文件夹路径
     * @param inputFiles
     *            多个文件
     * @throws Exception
     */
    public static void zip(String zipFileName, File[] inputFiles) throws Exception
    {
	ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zipFileName));
	for (int i = 0; i < inputFiles.length; i++)
	{
	    zos.putNextEntry(new org.apache.tools.zip.ZipEntry(inputFiles[i].getName()));
	    FileInputStream in = new FileInputStream(inputFiles[i]);
	    int b;
	    while ((b = in.read()) != -1)
	    {
		zos.write(b);
	    }
	    in.close();
	}
	zos.close();
    }

    /**
     * 指定多个文件压缩成一文件，自己指定字符集
     * 
     * @param zipFileName
     *            要打包的文件或文件夹路径
     * @param inputFiles
     *            多个文件
     * @param charset
     *            指定的字符集
     * @throws Exception
     */
    public static void zip(String zipFileName, File[] inputFiles, Charset charset) throws Exception
    {
    Integer num = 0;
	ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zipFileName), charset);
	for (int i = 0; i < inputFiles.length; i++)
	{
		if(inputFiles[i].exists()){
			zos.putNextEntry(new org.apache.tools.zip.ZipEntry(inputFiles[i].getName()));
			FileInputStream in = new FileInputStream(inputFiles[i]);
			int b;
			while ((b = in.read()) != -1)
			{
				zos.write(b);
			}
			in.close();
		}else {
			num++;
		}
	}
	logger.error(DataUtil.getStringTime()+"生成pdf，未找到文件的数量"+num);
	zos.close();
    }

    /**
     * 
     * @param inputFileName
     *            要打包的文件或文件夹路径
     * @param zipFileName
     *            打包后的文件名路径
     * @throws Exception
     */
    public static void zip(String inputFileName, String zipFileName) throws Exception
    {
	zip(zipFileName, new File(inputFileName), inputFileName.substring(inputFileName.lastIndexOf(File.separator) + 1, inputFileName.length()));
    }

    /**
     * 
     * @param zipFileName
     *            要打包的文件或文件夹路径
     * @param inputFile
     * @throws Exception
     */
    private static void zip(String zipFileName, File inputFile, String inputFileName) throws Exception
    {
	ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipFileName));
	zip(out, inputFile, inputFileName);
	out.close();
    }

    private static void zip(ZipOutputStream out, File f, String base) throws Exception
    {
	if (f.isDirectory())
	{
	    File[] fl = f.listFiles();
	    out.putNextEntry(new org.apache.tools.zip.ZipEntry(base + File.separator));
	    base = base.length() == 0 ? "" : base + File.separator;
	    for (int i = 0; i < fl.length; i++)
	    {
		zip(out, fl[i], base + fl[i].getName());
	    }
	} else
	{
	    out.putNextEntry(new org.apache.tools.zip.ZipEntry(base));
	    FileInputStream in = new FileInputStream(f);
	    int b;
	    while ((b = in.read()) != -1)
	    {
		out.write(b);
	    }
	    in.close();
	}
    }
}

