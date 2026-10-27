Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091236;
	b=JZcfFcfTnl141xDGJQ9kYiyVph5KIpkmXGQ/KQRyc/XwsMSja/Md2mWf/lBDyN0lMbRm
	 bPi061D0ZWKabGb+9PhtMzG8LR9jX32GLMeykVqaoM89EYL1douQ7ULXoeEPc3iZ5Wl8g
	 6Bnqr9lUO2krGDnJS0CS7IYXnYh6DmH3MGMGJ00bBDpoMY9jBIsuf22dUJkPadu2U9Bq7
	 S1VPsRDkzQ2nn26iN4xkXehYkqlzYSAIdeBACFW9ucMXacfrnWlIj2hnz8h/QyFnTzYUh
	 kDseKY9W+ENlsprB1+JntPpOFghNH62kilC27HNr3tSTTjm5M63rEzq4tmXZKWxCfoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091236;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yNBJTkMGaQWJR7537+FXiL3KuVd7EpygbChLg0HosmA=;
	b=oSkl06OlNBazyJeclKBv093DHrkWc3Pc1vgUhkPefogX9F/owvIxYSaKHc7YTidjPaKp
	 Vj8uN3GqaL5aQ1IPFIhfM6P+xIP9hTJij7FqYyqebFPeCZINPzhgEi+yQ2MvJ8uxArnJ9
	 8Y0hjgdewE6DHOW2cUI0OxNECkMvL2/cLMJrgfH1GNUU2f/2RRS7Ka0gNQOJHKPEuRN7i
	 wfbVor6DGHhAh/r2Ni7Tthc8HJ3UQYolhlFuosLkC64jex1MR4fIMIUBoRlhAO8SIzijR
	 l7j/W9lEeVnWOCVhS+s7c5PECcC1IX00Rr12T2pvWJ9902qO3rEp/QJ1EodNbC44sWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gj9FMtfs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A52606A32E
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gj9FMtfs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFD01F01825;
	Tue, 27 Oct 2026 08:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793091235;
	bh=yNBJTkMGaQWJR7537+FXiL3KuVd7EpygbChLg0HosmA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gj9FMtfstUPtDUunv9opHCemZXAYhGaTMZv78sQ6sLStSJ0UZsN05agD366RzQuhH
	 mMggq2F7lrjRhOffq6+h5gapA41zAaeSQhf3tEJDjM3nbrd7QTof3sBf/mxEcISI3+
	 5heQpR9RlPP4ek2hF59b8wskCsSG8pUHLTX3/84fM8xHb/SNkNItyv17n+ZDXIeVKW
	 nZdn7QTyPnP3G2wH3vsScZNbYjTJEcdu55G2cAVI9q1D4hcE+EvIBz47amHH2Fnigm
	 4t1p1veW6e5tRbraR6xA5Vkv0IrRJqUtWAq9l7iV0HRza0SzXz/uMDOYiSoI2n1Bni
	 oSbdcFaBL+uvg==
Message-ID: <sashiko-outbox-186308@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] mfd: rk8xx: Release the power hold GPIOs before
 powering off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261027084511.1992-3-yaozhonguwl@gmail.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
 <20261027084511.1992-3-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 08:53:55 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> rk808_power_off() writes the PMIC's shutdown bit directly. On boards where
> lines driven by the SoC gate the PMIC's power-off path, a shutdown
> performed this way does not stick: the rails drop and immediately come
> back up, so the board restarts instead of staying off. U-Boot reports the
> result as a power-on reset.
>=20
> Take those lines as an optional GPIO array, hold them asserted while the
> system runs and release them - waiting power-hold-delay-ms - before
> writing the shutdown bit. Device trees without the property retain the
> existing behaviour.
>=20
> The array is claimed before any child device is registered, so that a
> -EPROBE_DEFER from the GPIO provider does not tear down the regulators,
> RTC and clocks that devm_mfd_add_devices() has already registered.
>=20
> On a Firefly-RK3399 the shutdown stuck when such a line went from high to
> low before the shutdown bit was written, and did not when the line was
> never driven.
>=20
> Assisted-by: LLM
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027084511.1992=
-1-yaozhonguwl@gmail.com?part=3D2

