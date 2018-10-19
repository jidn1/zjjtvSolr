package com.htstd.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class RedisApi {

	private static JedisPool pool = null;
	private static Properties pro = null;

	static {
		InputStream is = RedisApi.class.getClassLoader().getResourceAsStream(
				"redis.properties");
		pro = new Properties();
		try {
			pro.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}

		JedisPoolConfig config = new JedisPoolConfig();
		// ����һ��pool�ɷ�����ٸ�jedisʵ��ͨ��pool.getResource��������ȡ
		// ���ֵΪ-1�����ʾ�����ƣ����pool�Ѿ�������maxActive��jedisʵ������ʱpool��״̬Ϊexhausted���ľ���
		config.setMaxTotal(Integer.valueOf(pro.getProperty("MAX_TOTAL")));
		// ����һ��pool����ж��ٸ�״̬Ϊidle�����У���jedisʵ��
		config.setMaxIdle(Integer.valueOf(pro.getProperty("MAX_IDLE")));

		// ��ʾ��borrow�����룩һ��jedisʵ��ʱ�����ĵȴ�ʱ�䣬����ȴ�ʱ�䣬��ֱ���׳�jedisConnectionException
		config.setMaxWaitMillis(Integer.valueOf(pro
				.getProperty("MAX_WAIT_MILLIS")));
		// �ڽ���returnObejct�Է��ص�connectin����validateObjectУ��
		config.setTestOnReturn(Boolean.valueOf(pro
				.getProperty("TESET_ON_RETURN")));
		// ��borrowһ��jedisʵ��ʱ���Ƿ���ǰ����validateOjectУ��λtrue����õ�jedisʵ����ǿ��õ�
		config.setTestOnBorrow(Boolean.valueOf(pro
				.getProperty("TEST_ON_BORROW")));
		// ��ʱ���̳߳��п��е����ӽ���validateObjectУ��
		config.setTestWhileIdle(Boolean.valueOf(pro
				.getProperty("TEST_WHILE_IDLE")));

		pool = new JedisPool(config, pro.getProperty("REDIS_IP"),
				Integer.valueOf(pro.getProperty("REDIS_PORT")), 100000);

	}

	public static JedisPool getPool() {
		if (pool == null) {
			JedisPoolConfig config = new JedisPoolConfig();
			// ����һ��pool�ɷ�����ٸ�jedisʵ��ͨ��pool.getResource��������ȡ
			// ���ֵΪ-1�����ʾ�����ƣ����pool�Ѿ�������maxActive��jedisʵ������ʱpool��״̬Ϊexhausted���ľ���
			config.setMaxTotal(Integer.valueOf(pro.getProperty("MAX_TOTAL")));
			// ����һ��pool����ж��ٸ�״̬Ϊidle�����У���jedisʵ��
			config.setMaxIdle(Integer.valueOf(pro.getProperty("MAX_IDLE")));

			// ��ʾ��borrow�����룩һ��jedisʵ��ʱ�����ĵȴ�ʱ�䣬����ȴ�ʱ�䣬��ֱ���׳�jedisConnectionException
			config.setMaxWaitMillis(Integer.valueOf(pro
					.getProperty("MAX_WAIT_MILLIS")));
			// �ڽ���returnObejct�Է��ص�connectin����validateObjectУ��
			config.setTestOnReturn(Boolean.valueOf(pro
					.getProperty("TESET_ON_RETURN")));
			// ��borrowһ��jedisʵ��ʱ���Ƿ���ǰ����validateOjectУ��λtrue����õ�jedisʵ����ǿ��õ�
			config.setTestOnBorrow(Boolean.valueOf(pro
					.getProperty("TEST_ON_BORROW")));
			// ��ʱ���̳߳��п��е����ӽ���validateObjectУ��
			config.setTestWhileIdle(Boolean.valueOf(pro
					.getProperty("TEST_WHILE_IDLE")));

			pool = new JedisPool(config, pro.getProperty("REDIS_IP"),
					Integer.valueOf(pro.getProperty("REDIS_PORT")), 100000);
		}

		return pool;
	}

	/**
	 * �ͷ�pool���е�jedis����
	 * 
	 * @param pool
	 * @param jedis
	 */
	public static void returnResource(JedisPool pool, Jedis jedis) {
		if (jedis != null) {
			pool.returnResource(jedis);
		}
	}

	/**
	 * ��ȡ���
	 * 
	 * @param key
	 * @return
	 */
	public static byte[] get(String key) {
		Jedis jedis = null;
		byte[] value = null;
		try {
			jedis = pool.getResource();
			value = jedis.get(key.getBytes());
		} catch (Exception e) {

		} finally {
			returnResource(pool, jedis);
		}
		return value;
	}

	/*
	 * set���
	 */
	public static String set(String key, Object value) {
		Jedis jedis = null;
		try {
			jedis = pool.getResource();
			
			return jedis.set(key.getBytes(), SerializeUtil.serialize(value));
		} catch (Exception e) {

		} finally {
			returnResource(pool, jedis);
		}
		return "0";
	}
	
	public static Long del(String key){
		Jedis jedis = null;
		try {
			jedis = pool.getResource();
			return jedis.del(key);
		} catch (Exception e) {
			
		}finally{
			returnResource(pool, jedis);
		}
		return 0L;
	}

	public static Long lpush(String key, String[] strings) {
		Jedis jedis = null;
		try {
			jedis = pool.getResource();
			return jedis.lpush(key, strings);
		} catch (Exception e) {

		} finally {
			returnResource(pool, jedis);
		}
		return 0L;
	}

	public static List<String> lrange(String key) {
		Jedis jedis = null;
		try {
			jedis = pool.getResource();
			return jedis.lrange(key, 0, -1);
		} catch (Exception e) {

		} finally {
			returnResource(pool, jedis);
		}
		return null;
	}

	public static String hmset(String key, Map map) {
		Jedis jedis = null;
		try {
			jedis = pool.getResource();
			return jedis.hmset(key, map);
		} catch (Exception e) {
			
		} finally {
			returnResource(pool, jedis);
		}
		return "0";
	}

	public static List<String> hmget(String key, String... strings) {
		Jedis jedis = null;
		try {
			jedis = pool.getResource();
			return jedis.hmget(key, strings);
		} catch (Exception e) {

		} finally {
			returnResource(pool, jedis);
		}
		return null;
	}

	public static Long hset(String key, String field, String value) {
		Jedis jedis = null;
		try {
			jedis = pool.getResource();
			return jedis.hset(key, field, value);
		} catch (Exception e) {

		} finally {
			returnResource(pool, jedis);
		}
		return 0L;
	}

	public static String hget(String key, String field) {
		Jedis jedis = null;
		try {
			jedis = pool.getResource();
			return jedis.hget(key, field);
		} catch (Exception e) {

		} finally {
			returnResource(pool, jedis);
		}
		return null;

	}
	
	public static Long hdel(String key, String key1) {
		Jedis jedis = null;
		try {
			jedis = pool.getResource();
			return jedis.hdel(key, key1);
		} catch (Exception e) {

		} finally {
			returnResource(pool, jedis);
		}
		return null;

	}
	
	public static Set<String> hkeys(String key) {
		Jedis jedis = null;
		try {
			jedis = pool.getResource();
			return jedis.hkeys(key);
		} catch (Exception e) {

		} finally {
			returnResource(pool, jedis);
		}
		return null;

	}
	
	
	public static Map<String,String> hgetAll(String key) {
		Jedis jedis = null;
		try {
			jedis = pool.getResource();
			return jedis.hgetAll(key);
		} catch (Exception e) {

		} finally {
			returnResource(pool, jedis);
		}
		return null;

	}

}
