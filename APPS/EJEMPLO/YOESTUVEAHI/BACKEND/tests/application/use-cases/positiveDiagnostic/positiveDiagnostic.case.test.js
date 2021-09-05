const {validTrue, validFalse, errored, assertable, responder} = require("../common/entities");
const { PositiveDiagnosticError, UnexistingUserError } = require("../../../../application/positiveDiagnostic/errors");
const positiveDiagnosticUOC = require("../../../../application/positiveDiagnostic");

const actor = {}
const date = new Date()
describe("positiveDiagnostic uoc cases test", () => {
	test("Happy path", async () => {
		
		let dependencies = {
			fetchUser: validTrue,
			persistDiagnostic: validTrue
		}
		let uoc = positiveDiagnosticUOC(dependencies)(actor)
		await uoc({date})
		
	});
	test("should throw UnexistingUser if user does not exists", async () => {
		let shouldNotBeUsed = assertable()
		
		let dependencies = {
			fetchUser: validFalse,
			persistDiagnostic: shouldNotBeUsed
		}
		let uoc = positiveDiagnosticUOC(dependencies)(actor)
		await expect(uoc({date})).rejects.toThrow(UnexistingUserError)
		expect(shouldNotBeUsed.isUsed()).toBe(false)
		
	});
	test("should throw if fetchUser is errored", async () => {
		let shouldNotBeUsed = assertable()
		
		let dependencies = {
			fetchUser: errored,
			persistDiagnostic: shouldNotBeUsed
		}
		let uoc = positiveDiagnosticUOC(dependencies)(actor)
		await expect(uoc({date})).rejects.toThrow(PositiveDiagnosticError)
		expect(shouldNotBeUsed.isUsed()).toBe(false)
		
	});
	test("should throw if persistDiagnostic is errored", async () => {
		
		let dependencies = {
			fetchUser: validTrue,
			persistDiagnostic: errored
		}
		let uoc = positiveDiagnosticUOC(dependencies)(actor)
		await expect(uoc({date})).rejects.toThrow(PositiveDiagnosticError)
		
	});
	test("should throw if parameter is not a timestamp", async () => {
		let shouldNotBeUsed = assertable()
		let dependencies = {
			fetchUser: shouldNotBeUsed.func,
			persistDiagnostic: shouldNotBeUsed.func
		}
		let uoc = positiveDiagnosticUOC(dependencies)(actor)
		await expect(uoc({date:'nana'})).rejects.toThrow(PositiveDiagnosticError)
		expect(shouldNotBeUsed.isUsed()).toBe(false)
		
	});
})