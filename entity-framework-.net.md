# Entity Framework .NET

\#EntityFramework \#EntityFramework\.NET

## Custom Expressions

Following are some really useful code snippets useful for creating custom `Expression` functions.

Some common use-cases for creating custom Expressions:

* You have an interface, say, `IEntity`, containing properties: `int Id`, `string Name`, and you would like to create a common function that can be called for ALL entities implementing `IEntity` interface.
* TODO: Add more.

### Terms and Terminology

* `keyName` is the "property name" of a class/oject. E.g. if I want to do some operation on `User.Name` property, I may pass `"Name"` as the `keyName` in below functions.
* TODO: Explanation.

### Generic Expression to call a custom Method/Function

```c#
public IQueryable<IEntity> Contains(string keyName, IEnumerable<int> itemList)
{
    var containsMethodInfo = itemList.GetType().GetMethod("Contains");
    ParameterExpression parameterExp = Expression.Parameter(typeof(IEntity));
    MemberExpression activeExp = Expression.PropertyOrField(parameterExp, keyName);
    MethodCallExpression containsCallExp = Expression.Call(Expression.Constant(itemList), containsMethodInfo, activeExp);
    var predicate = Expression.Lambda<Func<IEntity, bool>>(containsCallExp, parameterExp);
    return Where(predicate);
}

public static void Main()
{
    Console.WriteLine(dbo.Products.Select(p => p.Id).Contains(new int[] { 111, 222, 333, 555 }));
}
```

### Generic Expression to Select a Property by string keyName

```c#
public IQueryable<int> SelectId(string keyName)
{
    ParameterExpression entityParam = Expression.Parameter(typeof(IEntity));
    MemberExpression keyExp = Expression.PropertyOrField(entityParam, keyName);
    var selector = Expression.Lambda<Func<IEntity, int>>(keyExp, entityParam);
    return query.Select(selector);
}

public static void Main()
{
    Console.WriteLine(dbo.Users.SelectId("Id"));
    Console.WriteLine(dbo.Products.SelectId("ProductId"));
}
```

### Generic Expression to check for Equal condition

```c#
public IQueryable<IEntity> Where(int id)
{
    ParameterExpression entityParam = Expression.Parameter(typeof(IEntity));
    MemberExpression keyExp = Expression.PropertyOrField(entityParam, "Id");
    UnaryExpression valueExp = Expression.Convert(Expression.Constant(id), keyExp.Type); // NOTE: Expression.Convert handles NULL values
    BinaryExpression keyEqualValExpression = Expression.Equal(keyExp, valueExp);
    var predicate = Expression.Lambda<Func<IEntity, bool>>(keyEqualValExpression, entityParam);
    return Where(predicate);
}

public static void Main()
{
    Console.WriteLine(dbo.Products.Where(3001));
}
```

## References

Some references from where this cheatsheet's code is inspired/prepared.

* [https://stackoverflow.com/questions/39464074/linq-get-string-list-using-dynamic-field-name]
