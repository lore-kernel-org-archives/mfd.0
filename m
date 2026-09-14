Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9762BE035;
	Mon, 14 Sep 2026 01:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350143; cv=none; b=Y8kB7/uTm5SyWlYiiTCMm7bz5sUatYLRdYhBwpa6l3RXWegbTdBu28ZEoCHASsbRIHWPqjxjI6yUNoAvQQuzgoL/AFRTKRgrzB6Jv+5pYmY8VqRq3sPEzVf5ylow4Dt5vmeSFaGBkI1xg9UbEdW9xZNoEJUtxRwTPVhx2QN2a1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350143; c=relaxed/simple;
	bh=6DyaG1tGCEhw8NgR3yVhy4fhpwPv0JRSO8sJpq7uCok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bh6+QvyanLrRI5ENuwm/3aZJkoSSS9bxEmE7hB+NzxvsJ+rZKI1fUwOHBfYaLPSH5Be7DZxkrqD2jNvSsxTqXb8waxl1ZdBueTjKcRo86By3Db7um0YoIE2hDr2zuQqoKR2hph0xXSmqMl73cQXrx8opE3nfdgJAElcCs0yyNhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=md9g7KjP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="md9g7KjP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D393E1F000FF;
	Mon, 14 Sep 2026 01:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789350142;
	bh=9mGksh/1TO/Wq4klZCX/Ll5YciXcoUHIC+PnI5Yu2o4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=md9g7KjP2a0nynOAYtirWLEvHOf7FkkIT3U0U3uklTMYbN0uPhzpd5oPHO4+fptfu
	 ZQtV2pLjerHwK3/PDpTMIm+48ErX3dllxXfqPR1dQVWJ1OLA8ymo8CwVZOarBzD0y1
	 I+aG+56DdXwf55H3AGjG8Q4BU2z1i5k2nk0enLi9PnyUQIapevYv84WHUaLDP/J9+o
	 LC7mPYgfebmYW4Ox2qrWObje5s11ep6pM4M/TekQNn5JwwIiNbzsZmwPniT1CuLz22
	 +djeGx93p0MGvHNfCaFmwy0JramwMinydQ0Qsti953mpluY/jNA1fWCQV5Xo2n6Au9
	 EAdWPPAUFLKsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: convert lp3943 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914013752.394579-1-quchaosheng000406@163.com>
References: <20260914013752.394579-1-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 01:42:21 +0000
Message-Id: <20260914014221.D393E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Convert the LP3943 MFD binding from free-form text to DT schema.
>=20
> The LP3943 is an I2C LED driver that contains two sub-devices,
> lp3943-gpio and lp3943-pwm.  The GPIO sub-device is already covered by
> trivial-gpio.yaml, so only the PWM sub-device needs a schema of its own.
>=20
> The PWM schema documents the ti,pwm0 and ti,pwm1 properties that select
> the output pins for each of the two internal PWM channels, matching what
> pwm-lp3943.c reads through of_property_read_u32_array().
>=20
> Both schemas pass dt_binding_check.
>=20
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914013752.3945=
79-1-quchaosheng000406@163.com?part=3D1

