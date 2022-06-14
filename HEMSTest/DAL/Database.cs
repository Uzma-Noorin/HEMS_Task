using HEMSTest.CommonUtilities;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Web;

namespace HEMSTest.DAL
{
	public class Database
	{
		public Database()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public static string ConnectionString
		{
			get
			{
				return ConfigurationManager.ConnectionStrings["HEMSConnectionString"].ConnectionString;
			}
		}

		public static T GetFirstFromParameters<T>(string cmdText, params object[] parameters) where T : new()
		{
			try
			{
				List<T> list = null;

				SqlDatabase db = new SqlDatabase(ConnectionString);
				DbCommand cmd = db.GetStoredProcCommand(cmdText, parameters);

				var dtTable = new DataTable();

				using (IDataReader dr = db.ExecuteReader(cmd))
				{
					list = dr.ConvertDataReaderToList<T>().ToList();
				}

				return list.First();
			}
			catch (Exception ex)
			{
				string msg = ex.Message;
				throw ex;
			}
		}

		private static SqlDbType GetSqlDbTypeOfParameter(object param)
		{
			Type t = param.GetType();
			if (t.Equals(typeof(bool)))
				return SqlDbType.Bit;
			else if (t.Equals(typeof(int)))
				return SqlDbType.Int;
			else if (t.Equals(typeof(Byte)))
				return SqlDbType.TinyInt;
			else if (t.Equals(typeof(long)))
				return SqlDbType.BigInt;
			else if (t.Equals(typeof(double)) || t.Equals(typeof(decimal)))
				return SqlDbType.Decimal;
			else if (t.Equals(typeof(char)))
				return SqlDbType.NChar;
			else if (t.Equals(typeof(String)) || t.Equals(typeof(string)))
				return SqlDbType.NVarChar;
			else if (t.Equals(typeof(DateTime)))
				return SqlDbType.DateTime;
			else
				return SqlDbType.Bit;
		}


		public static IEnumerable<T> GetAllFromParameters<T>(string cmdText, params object[] parameters) where T : new()
		{
			try
			{
				List<T> list = null;

				SqlDatabase db = new SqlDatabase(ConnectionString);
				DbCommand cmd = null;

				if (parameters.Length > 0)
				{
					cmd = db.GetStoredProcCommand(cmdText, parameters);
				}
				else
				{
					cmd = db.GetStoredProcCommand(cmdText);
				}

				var dtTable = new DataTable();

				using (IDataReader dr = db.ExecuteReader(cmd))
				{
					list = dr.ConvertDataReaderToList<T>().ToList();
				}

				return list;
			}
			catch (Exception ex)
			{
				string msg = ex.Message;
				return null;
			}
		}

	}
}