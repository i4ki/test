import log

fn newctx() {
    var t = map{
        shouldExit: false,
        succeeded: false,
        failureCause: "",
    }

    t.fatalf = fn(msg, ...args) {
        log.errorf(msg, args...)
        t.shouldExit = true
    }

	t.assert = fn(msg, b) {
		if s1 == s2 {
            t.succeeded = true
        } else {
            t.succeeded = false 
            t.failureCause = msg
        }
        return t
	}

    t.assertstr = fn(msg, s1, s2) {
        return t.assert(msg, s1 == s2)
    }

    return t
}

fn run(desc, testfn) {
    log.printf("RUN %s: ", desc)
    ctx = testfn(newctx())
    if ctx.succeeded {
        log.printf("ok\n")
        return true
    }

    log.printf("failed\n")
    log.printf("cause (%s): %s", desc, ctx.failureCause)
    if ctx.shouldExit {
        exit(1)
    }
    return false
}

fn runall(tests) {
	for test in tests {
		ret = run(test.desc, test.fn)
		if !ret {
			return ret
		}
	}
	return true
}
