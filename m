Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943939;
	b=b7VIxB24Fi++JWKz5xXKq1NO9X3Zt5LsHhbfjXTwJNJXv108yb7AfVaKbuVINQKMSGIG
	 +JhminZD8YLThulWd1NhGhetH+Qpl6jqdXH1vn/eq0AgRHd9osBni0Gt0JL3hU/F1jiTz
	 h7rE/fLF8/3DLqr1Ou0QEfstt5qoqZ3+EUWofnOWi91gYe4S0aXJNdss+w8tjBeXcCRDp
	 GDYiP9xEEM4RT4EALRkcmVbxPy5HFf/KjT0ddU6DTjU5SoGGeMTI0nqwzZVobUWEApc2V
	 +P/+5YBHNDcpvxuCe4kyGcqGjICRuI+vqHpLDi7zr9HCerN1Xdutg1cSw9lA4/59Ztw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943939;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Af6N8TMYJXlnWgQgLz8THGwbiJSgO5l2uE+3uITqO5E=;
	b=a2qadopnBGE092cN6zjfV2lQzODmPs0D7lB2ItJqhwJY2QHU+dWupoLKX2p2VkDZ77io
	 1abkKJVV17dqsHsAsPTgILo5XUS5kKjSeV3U3QWLBlUHBu7vMUdeqCirRu8xndyp18Eis
	 stPThnrXJLvHWCpT1guOU3ENteOT0cKWx9vOw72WZ4fNa1RC9vbBgQTgUUG4Ml97mcoZ1
	 0f4vg83On/2skBPbm17Llx3JXbXpR9PMAEIMVOdt6fdw7NygVdfDQMrq9AxmYMkMiHaAA
	 VF6C67VGxah5g1bKyVTjA0CQWymJjFfv9v2+ulcMJeXsB5YsEemKM3aTvcKlCGj07XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJYtB6RR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B579606A332
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 05:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJYtB6RR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79F61F0089F;
	Fri,  6 Nov 2026 05:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793943938;
	bh=Af6N8TMYJXlnWgQgLz8THGwbiJSgO5l2uE+3uITqO5E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eJYtB6RRYc12W4CuHCYDAYYCqKH23oDQqtgnjQxAqN2MHvOGBk6xYdeVTeSkswAB/
	 dtJwUFfKj0+CSIhcwbUKMMoiPe3SaaJ3BgdbL1LCXRPohBLlT5ChtiWmwv51h9LMpX
	 8IWAIYoA3RII27Kkey5NWIHMjAUP06klSG6Vh5hVMmDM4S4KnFChGw/WKGDgE7X2uR
	 VJhsY8WFYQTYqVr9Q80A3Zt4UJ7fbuAYCU7vm/JuAe0wd3dG2rSBnyOUcU/+l201bI
	 cXuMR1O+zTEoSqZjMJQf++OHHfMU9cuxB8SpQzE4c4BLJpnrj3i8HZ/qqqD6NQ9rOI
	 e+U3sl5mnRIsA==
Message-ID: <sashiko-outbox-200852@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] ASoC: arizona: drop unused HPDET accessory ID
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261105-arizona-asoc-v1-3-25ec7338446e@gmail.com>
References: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
 <20261105-arizona-asoc-v1-3-25ec7338446e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 05:45:38 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Nothing in the kernel sets hpdet_acc_id or hpdet_acc_id_line in
> struct arizona_pdata, and neither has any Device Tree or ACPI bindings.
>=20
> Remove both platform data fields and all exclusively connected HPDET
> accessory identification logic, work items, GPIO lookup, and state from
> the Arizona jack detection driver.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-arizona-as=
oc-v1-0-25ec7338446e@gmail.com?part=3D3

