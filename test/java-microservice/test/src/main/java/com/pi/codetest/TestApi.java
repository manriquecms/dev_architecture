package com.pi.codetest;

import io.javalin.Javalin;

public class TestApi {
	public static void main(String[] args) {
		Javalin app = Javalin.start(7000);
		app.post("/api/mix", ctx -> {
			try {
				CodeTestResponse ctr = new CodeTestResponse();
				CodeTestRequest req = ctx.bodyAsClass(CodeTestRequest.class);
				ctr.setResponse(CodeTest.mix(req.getStrings()));
				ctx.json(ctr);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});

	}
}
