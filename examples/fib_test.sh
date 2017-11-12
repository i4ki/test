# Example of testing the fibonacci function

# fib returns a function that generates fib numbers
fn fib() {
    var a, b = 0, 1

    fn _fib() {
        a = b
        b = a+b
        
        return a
    }
    return _fib
}

fn testFib(t) {
    var f = fib()

    t.assert("first is 1", 1 == f())
    t.assert("second is 1", 1 == f())
    t.assert("third is 2", 2 == f())
    t.assert("fourth is 3", 3 == f())
    t.assert("fifth is 5", 5 == f())
    return t
}

test.run("fibonacci", testFib)
