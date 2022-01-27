# Usecase
This class serves as the default interface to create usecases for our features.

**All usecases must** extend it.

The contract for this interface is the callable method `call`.
```
 Future<Either<IFailure, Output>> call(Input params);
```
You can see that it requires the exceptions to be of type `IFailure`

## Implementation
```
// create the class extending Usecase 
// providing the Input and Output types
class MyUseCase extends Usecase<DateParams, String>{}

// Provide you input type
class DateParams extends Params {
  final ShiftDateTime date;
  DateParams(this.date);
}

// Provide you exception type
class MyException extends IFailure {
  MyException(String message) : super(message);
  @override
  List<Object> get props => [message];
}

```

## How to use
When you extend `Usecase` you must provide `Input` and `Output` type.


### Input
The `Input` must extend the `Params` interface.

Eg.: 
If you need a usecase that receives a `ShiftDateTime` as input parameter

you need to create a `Params` type class and receive the arguments in the constructor:
```
class DateParams extends Params {
  final ShiftDateTime date;
  DateParams(this.date);
}
```

If you don't needd a parameter you can just pass `Params` as type or create a `NoParams` type

### Output
The `Output` can be any type you want.

### Exceptions
The exceptions musht extend from `IFailure` class.
```
class MyException extends IFailure {
  MyException(String message) : super(message);
  @override
  List<Object> get props => [message];
}
```