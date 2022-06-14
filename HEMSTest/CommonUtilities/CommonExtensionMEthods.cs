using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HEMSTest.CommonUtilities
{
    public static class CommonExtensionMEthods
    {
        public static IEnumerable<T> ConvertDataReaderToList<T>(this IDataReader dr) where T : new()
        {
            List<T> list = new List<T>();

            try
            {
                while (dr.Read())
                {
                    var typeProperties = typeof(T).GetProperties().Select(propertyInfo => new
                    {
                        PropertyInfo = propertyInfo,
                        Type = Nullable.GetUnderlyingType(propertyInfo.PropertyType) ?? propertyInfo.PropertyType
                    }).ToList();

                    T obj = new T();
                    foreach (var typeProperty in typeProperties)
                    {
                        if (dr.GetColumnNames().Contains(typeProperty.PropertyInfo.Name))
                        {
                            object value = dr[typeProperty.PropertyInfo.Name];
                            object safeValue = value == null || DBNull.Value.Equals(value)
                                ? null
                                : (typeProperty.Type.IsEnum ? Enum.ToObject(typeProperty.Type, value) : Convert.ChangeType(value, typeProperty.Type));

                            typeProperty.PropertyInfo.SetValue(obj, safeValue, null);
                        }
                    }
                    list.Add(obj);
                }

            }
            catch (Exception ex)
            {

            }
            return list;
        }

        public static IEnumerable<string> GetColumnNames(this IDataRecord dr)
        {
            return Enumerable.Range(0, dr.FieldCount)
                .Select(dr.GetName)
                .ToList();
        }
    }
}