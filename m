Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8FC4C651E;
	Tue, 22 Sep 2026 06:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058327; cv=none; b=sykCuaM3eOMsPJH0JMa+5FnmCb29pSNxPYfOBG5ETXfxL+pcixnR4hagk76FcLlkutaiL5IR5fipkH6Pk2bvwq6B+c/Y9L6+iL+VB9laNEOMPk+rG0CSEUCMUtDiYynRmkdHIJat5PwS0Ct/GxpHN6DRXOGKxcKNwhjawiOARXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058327; c=relaxed/simple;
	bh=FhgO3SpPcjSwNKHVyfqGlzWe5p8iBYO6Vb5UI4d4CdU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r4t+lvGViuyeZiBo/fvB+YO1OWW8T7aSyjt4QYWmeCyOYSK/17nEdFXPlWjAC1CFbJxCXnCs90V/hGrfl8uxxgqr1mvtGUXgz08pf3u84WtiQWo0umf2tYSA/yH0MCKv2iAK9KNkMaOMEwTK6dlHbY9UdLODeUqdHUbBfhS1xi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JswNbLth; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JswNbLth"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5101F000FF;
	Tue, 22 Sep 2026 06:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790058324;
	bh=FhgO3SpPcjSwNKHVyfqGlzWe5p8iBYO6Vb5UI4d4CdU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JswNbLthnN8IgoOG/AAsYbRISoHtTuCTVHCSTyXEEllp+T2OUv/x+ar0+19ad0wn3
	 jYWiuPL7OMjf7erw/BJTqxS7OUW7i2rv5ROA3z2gUPDKvl5ZJ8vQpUW5ecChXUfkcu
	 J4xIXN0jsCNW0ZrQ6xWl7hMWWgLfcjtLEtN4ZQJrCL7bTWgfZMXq2rKzUTdLJkieDb
	 VYqu0potYMd0OiDyrF+GUpspux5QVUDT4vEb4CuRjQ5RctGWbBZC5DdjwdxJhuDDT6
	 QGv4pQqNBB1ZnwPibyTv/Hlgi0hypneXib7Doy+4T4pG+e2DNRJoQMk7boEkcqXGrO
	 5PeIinHHJmihQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: convert lp3943 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260922061907.56372-1-quchaosheng000406@163.com>
References: <20260922061907.56372-1-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 06:25:23 +0000
Message-Id: <20260922062524.5F5101F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Convert the LP3943 MFD binding from free-form text to DT schema.
>=20
> The LP3943 is an I2C LED driver with two sub-devices, lp3943-gpio and
> lp3943-pwm. The GPIO sub-device is covered by trivial-gpio.yaml, so only
> the PWM sub-device gets a schema of its own.
>=20
> The PWM schema documents ti,pwm0 and ti,pwm1, which select the output pins
> of the two internal PWM channels and are read by pwm-lp3943.c with
> of_property_read_u32_array().
>=20
> Assisted-by: LLM
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922061907.5637=
2-1-quchaosheng000406@163.com?part=3D1

